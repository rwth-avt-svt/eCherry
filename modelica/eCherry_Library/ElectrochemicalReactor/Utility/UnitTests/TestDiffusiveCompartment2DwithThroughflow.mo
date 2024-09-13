within eCherry_Library.ElectrochemicalReactor.Utility.UnitTests;
model TestDiffusiveCompartment2DwithThroughflow

  import eCherry_Library.ElectrochemicalReactor.SpeciesPackage.*;

  parameter SpeciesRecord specRec(species={H2O, Hp, OHm, H2});
  parameter Length cellWidth = 0.1 "in m";
  parameter Length cellHeight = 0.1 "in m";
  parameter Length electrodeSpacing = 0.02 "in m, distance between electrodes";
  parameter Integer nCellsX = 10;
  parameter Integer nCellsZ = 10;
  parameter Concentration[specRec.nSpec] c0 = {55.5e3,  1e-11, 1e3, 0};
  parameter DiffusionCoefficient[specRec.nSpec] D = fill(0.00035, specRec.nSpec);

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
        nCellsZ),fill(
        c0[4],
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

  MaterialDomain.Flows.FixedConcentrationsWithDiffFlowL leftSide[nCellsZ](
      specRec={specRec for j in 1:nCellsZ}, c={c0 for j in 1:nCellsZ});
  //FixedConcentrationsWithDiffFlow rightSide[nCellsZ](specRec={specRec for j in 1:nCellsZ}, c={c0 for j in 1:nCellsZ});

  MaterialDomain.Flows.FixedConvInFlowL bottomInlet[nCellsX](
    specRec={specRec for j in 1:nCellsX},
    Vflow={0.1/nCellsX for j in 1:nCellsX},
    c={{55.5e3,3.6e-4,6.9e3,1e-7} for i in 1:nCellsX});
  MaterialDomain.Flows.ConvectiveOutFlowL topOutlet[nCellsX](specRec={specRec
        for j in 1:nCellsX});

equation
  for j in 1:nCellsZ loop
    connect(leftSide[j].diffFlow, leftDiffusiveConnection[j].leftFlow);
    connect(leftDiffusiveConnection[j].rightFlow, electrolyte.leftFlow[j]);
    connect(electrolyte.rightFlow[j], rightDiffusiveConnection[j].leftFlow);
    //connect(rightDiffusiveConnection[j].rightFlow, rightSide[j].diffFlow);
  end for;

  for i in 1:nCellsX loop
    connect(bottomInlet[i].convFlow, electrolyte.bottomConvFlow[i]);
    connect(topOutlet[i].convFlow, electrolyte.topConvFlow[i]);
  end for;

  // Expectation:
  // Modeling 1D diffusion, starting with neutral water (pH=7) and contacting with pH=0 at the left side
  // --> Expecting increasing H+ concentration, first at leftmost component, later at components further right

  annotation (experiment(StopTime=10));
end TestDiffusiveCompartment2DwithThroughflow;
