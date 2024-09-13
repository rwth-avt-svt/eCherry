within eCherry_Library.ElectrochemicalReactor.Utility.UnitTests;
model TestDiffusiveCompartment2D

  import eCherry_Library.ElectrochemicalReactor.SpeciesPackage.*;

  parameter SpeciesRecord specRec(species={H2O, Hp, OHm});
  parameter Length cellWidth = 1 "in m";
  parameter Length cellHeight = 1 "in m";
  parameter Length electrodeSpacing = 0.02 "in m, distance between electrodes";
  parameter Integer nCellsX = 40;
  parameter Integer nCellsZ = 40;
  parameter Concentration[specRec.nSpec] c0 = {55.5, 1e-1, 1e-7};
  parameter DiffusionCoefficient[specRec.nSpec] D = fill(0.00035, specRec.nSpec);

  Compartments.DiffusiveCompartment2D electrolyte(
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

  MaterialDomain.Flows.FixedConcentrationsWithDiffFlowL leftSide[nCellsZ](
      specRec={specRec for j in 1:nCellsZ}, c={{55.5,1e0*(j/nCellsZ)^2,1e-14}
        for j in 1:nCellsZ});
  MaterialDomain.Flows.FixedConcentrationsWithDiffFlowL rightSide[nCellsZ](
      specRec={specRec for j in 1:nCellsZ}, c={c0 for j in 1:nCellsZ});

equation
  for j in 1:nCellsZ loop
    connect(leftSide[j].diffFlow, leftDiffusiveConnection[j].leftFlow);
    connect(leftDiffusiveConnection[j].rightFlow, electrolyte.leftFlow[j]);
    connect(electrolyte.rightFlow[j], rightDiffusiveConnection[j].leftFlow);
    connect(rightDiffusiveConnection[j].rightFlow, rightSide[j].diffFlow);
  end for;

  // Expectation:
  // Modeling 1D diffusion, starting with neutral water (pH=7) and contacting with pH=0 at the left side
  // --> Expecting increasing H+ concentration, first at leftmost component, later at components further right

  annotation (experiment(StopTime=10));
end TestDiffusiveCompartment2D;
