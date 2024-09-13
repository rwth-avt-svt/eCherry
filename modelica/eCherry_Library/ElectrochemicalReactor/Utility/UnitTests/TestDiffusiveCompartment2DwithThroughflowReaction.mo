within eCherry_Library.ElectrochemicalReactor.Utility.UnitTests;
model TestDiffusiveCompartment2DwithThroughflowReaction

  import eCherry_Library.ElectrochemicalReactor.SpeciesPackage.*;

  parameter SpeciesRecord specRec(species={H2O, OHm, O2});
  parameter Length cellWidth = 0.001 "in m";
  parameter Length cellHeight = 0.001 "in m";
  parameter Length electrodeSpacing = 0.002 "in m, distance between electrodes";
  parameter Integer nCellsX = 5;
  parameter Integer nCellsZ = 5;

  parameter Temperature T = 300.15 "in Kelvin";
  parameter Concentration[specRec.nSpec] c0 = {55.5e3, 1e-8, 1e-8};
  parameter DiffusionCoefficient[specRec.nSpec] D = fill(5e-8, specRec.nSpec);

  parameter Electrochemistry.Reaction OERdummy(
    species={"Oxygen","Water","Hydroxide"},
    nu={-0.5,-1,2},
    RO={-0.5,-1,2},
    z=2,
    Eeq0=0.401,
    j0=10e-3,
    alpha=0.3,
    dH_app=75.4e3);

  Compartments.DiffusiveCompartment2DwithThroughflow electrolyte(
    specRec=specRec,
    X=electrodeSpacing,
    Y=cellWidth,
    Z=cellHeight,
    nCellsX=nCellsX,
    nCellsZ=nCellsZ,
    D=D,
    c0={fill(
        c0[1],
        nCellsX,
        nCellsZ),fill(
        c0[2],
        nCellsX,
        nCellsZ),fill(
        c0[3],
        nCellsX,
        nCellsZ)});

  MaterialDomain.ConnectionLayers.DiffusiveConnectionLayer
    leftDiffusiveConnection[nCellsZ](
    specRec={specRec for j in 1:nCellsZ},
    Y={cellWidth for j in 1:nCellsZ},
    Z={cellHeight/nCellsZ for j in 1:nCellsZ},
    dX={0.5*electrodeSpacing/nCellsX for j in 1:nCellsZ},
    D={D for j in 1:nCellsZ});

  MaterialDomain.ConnectionLayers.DiffusiveConnectionLayer
    rightDiffusiveConnection[nCellsZ](
    specRec={specRec for j in 1:nCellsZ},
    Y={cellWidth for j in 1:nCellsZ},
    Z={cellHeight/nCellsZ for j in 1:nCellsZ},
    dX={0.5*electrodeSpacing/nCellsX for j in 1:nCellsZ},
    D={D for j in 1:nCellsZ});

  //FixedConcentrationsWithDiffFlow leftSide[nCellsZ](specRec={specRec for j in 1:nCellsZ}, c={c0 for j in 1:nCellsZ});
  ElectrochemicalReaction anodeReaction[nCellsZ](specRec={specRec for j in 1:nCellsZ}, Y={cellWidth for j in 1:nCellsZ}, Z={cellHeight/nCellsZ for j in 1:nCellsZ}, T={T for j in 1:nCellsZ}, reac={OERdummy for j in 1:nCellsZ}, pi={{1,1,1} for j in 1:nCellsZ});
  //FixedConcentrationsWithDiffFlow rightSide[nCellsZ](specRec={specRec for j in 1:nCellsZ}, c={c0 for j in 1:nCellsZ});

  MaterialDomain.Flows.FixedConvInFlowL bottomInlet[nCellsX](
    specRec={specRec for j in 1:nCellsX},
    Vflow={0.000000001*10^2/nCellsX for j in 1:nCellsX},
    c={{55.5e3,1e3,1e-8} for i in 1:nCellsX});
  MaterialDomain.Flows.ConvectiveOutFlowL topOutlet[nCellsX](specRec={specRec
        for j in 1:nCellsX});

  // source
  ElectricalDomain.Source.Potential_Source.ImposedPotential source(
    Ufixed=1.5,
    Y=cellWidth,
    Z=cellHeight);
  Modelica.Electrical.Analog.Basic.Ground ground;
equation
  //OERdummy.Eeq0 = 1.5184 - 1.5421e-3 * T + 9.523e-5* T * log(T) + 9.84e-8 * T^2  -0.8277;
  for j in 1:nCellsZ loop
    //connect(anodeReaction[j].flowFromElectrolyte, electrolyte.leftFlow[j]);
    //connect(electrolyte.rightFlow[j], rightDiffusiveConnection[j].leftFlow);
    //connect(leftSide[j].diffFlow, leftDiffusiveConnection[j].leftFlow);
    connect(anodeReaction[j].flowFromElectrolyte, leftDiffusiveConnection[j].leftFlow);
    connect(leftDiffusiveConnection[j].rightFlow, electrolyte.leftFlow[j]);
    connect(electrolyte.rightFlow[j], rightDiffusiveConnection[j].leftFlow);
    //connect(rightDiffusiveConnection[j].rightFlow, rightSide[j].diffFlow);
    // Connections (circuit)
    connect(anodeReaction[j].electrodePin, source.p);
    connect(anodeReaction[j].electrolytePin, source.n);
  end for;

  connect(ground.p, source.p);

  for i in 1:nCellsX loop
    connect(bottomInlet[i].convFlow, electrolyte.bottomConvFlow[i]);
    connect(topOutlet[i].convFlow, electrolyte.topConvFlow[i]);
  end for;

  annotation (experiment(
      StopTime=100,
      Interval=0.01,
      Tolerance=1e-10));
end TestDiffusiveCompartment2DwithThroughflowReaction;
