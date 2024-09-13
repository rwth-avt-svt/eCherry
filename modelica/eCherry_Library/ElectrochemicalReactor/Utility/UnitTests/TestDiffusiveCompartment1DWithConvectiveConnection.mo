within eCherry_Library.ElectrochemicalReactor.Utility.UnitTests;
model TestDiffusiveCompartment1DWithConvectiveConnection
  "This is similar, e.g., to a gas diffusion layer"

  import eCherry_Library.ElectrochemicalReactor.SpeciesPackage.*;

  parameter SpeciesRecord specRec(species={H2O, Hp, OHm});
  parameter Length cellWidth = 1 "in m";
  parameter Length cellHeight = 1 "in m";
  parameter Length electrodeSpacing = 0.02 "in m, distance between electrodes";
  parameter Integer nCells = 10;
  parameter Concentration c0[specRec.nSpec] = {55.5, 1e-7, 1e-7};
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

  MaterialDomain.ConnectionLayers.ConvectiveConnectionLayer
    rightConvectiveConnection(
    specRec=specRec,
    Y=cellWidth,
    Z=cellHeight,
    h=3e-9);

  MaterialDomain.Flows.FixedConcentrationsWithDiffFlowL leftSide(specRec=
        specRec, c={55.5,1e0,1e-14});
  MaterialDomain.Flows.FixedConcentrationsWithDiffFlowL rightSide(specRec=
        specRec, c={55.5,1e-14,1e0});

equation

  connect(leftSide.diffFlow, leftDiffusiveConnection.leftFlow);
  connect(leftDiffusiveConnection.rightFlow, electrolyte.leftFlow);
  connect(electrolyte.rightFlow, rightConvectiveConnection.leftFlow);
  connect(rightConvectiveConnection.rightFlow, rightSide.diffFlow);

  // Expectation:
  // Modeling 1D diffusion layer with convection at the right side.
  // Starting with neutral water (pH=7) and contacting with pH=0 at the left side; right side is connected to compartment with ph=14 fixed.
  // --> Expecting decreasing OH- over time in the cells further to the left side and increasing further to the the right side
  // to be found @   Hp  electrolyte.c[2,i] for all i=1,2,...,n
  //                 OHm electrolyte.c[3,i] for all i=1,2,...,n
  annotation (experiment(StopTime=2));
end TestDiffusiveCompartment1DWithConvectiveConnection;
