within eCherry_Library.ElectrochemicalReactor.Utility.UnitTests;
model TestDiffusiveCompartment1D

  import eCherry_Library.ElectrochemicalReactor.SpeciesPackage.*;

  parameter SpeciesRecord specRec(species={H2O, Hp, OHm});
  parameter Length cellWidth = 1 "in m";
  parameter Length cellHeight = 1 "in m";
  parameter Length electrodeSpacing = 0.02 "in m, distance between electrodes";
  parameter Integer nCells = 10;
  parameter Concentration[specRec.nSpec] c0 = {55.5, 1e-7, 1e-7};
  parameter DiffusionCoefficient[specRec.nSpec] D = fill(0.00035, specRec.nSpec);

  Compartments.DiffusiveCompartment1D electrolyte(
    specRec=specRec,
    X=electrodeSpacing,
    Y=cellWidth,
    Z=cellHeight,
    nCells=nCells,
    D=D,
    c0={fill(c0[1], nCells),fill(c0[2], nCells),fill(c0[3], nCells)});

  MaterialDomain.ConnectionLayers.DiffusiveConnectionLayer
    leftDiffusiveConnection(
    specRec=specRec,
    Y=cellWidth,
    Z=cellHeight,
    dX=0.5*electrodeSpacing/nCells,
    D=D);

  MaterialDomain.ConnectionLayers.DiffusiveConnectionLayer
    rightDiffusiveConnection(
    specRec=specRec,
    Y=cellWidth,
    Z=cellHeight,
    dX=0.5*electrodeSpacing/nCells,
    D=D);

  MaterialDomain.Flows.FixedConcentrationsWithDiffFlowL leftSide(specRec=
        specRec, c={55.5,1e0,1e-14});
  MaterialDomain.Flows.FixedConcentrationsWithDiffFlowL rightSide(specRec=
        specRec, c=c0);

equation

  connect(leftSide.diffFlow, leftDiffusiveConnection.leftFlow);
  connect(leftDiffusiveConnection.rightFlow, electrolyte.leftFlow);
  connect(electrolyte.rightFlow, rightDiffusiveConnection.leftFlow);
  connect(rightDiffusiveConnection.rightFlow, rightSide.diffFlow);

  // Expectation:
  // Modeling 1D diffusion, starting with neutral water (pH=7) and contacting with pH=0 at the left side
  // --> Expecting increasing H+ concentration, first at leftmost component, later at components further right
  // to be found @   Hp  electrolyte.c[2,i] for all i=1,2,...,n
  //                 OHm electrolyte.c[3,i] for all i=1,2,...,n
  annotation (experiment(StopTime=10));
end TestDiffusiveCompartment1D;
