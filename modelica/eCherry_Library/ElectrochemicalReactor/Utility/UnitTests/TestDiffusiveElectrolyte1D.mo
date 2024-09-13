within eCherry_Library.ElectrochemicalReactor.Utility.UnitTests;
model TestDiffusiveElectrolyte1D
  // TBD is the source connected correctly?
  // in electrolyte the potential&current is going down
  import eCherry_Library.ElectrochemicalReactor.SpeciesPackage.*;

  parameter SpeciesRecord specRec(species={H2O, Hp, OHm});
  parameter Length cellWidth = 1 "in m";
  parameter Length cellHeight = 1 "in m";
  parameter Length electrodeSpacing = 0.02 "in m, distance between electrodes";
  parameter Integer nCells = 10;
  parameter Concentration c0[specRec.nSpec] = {55.5, 1e-7, 1e-7};
  parameter DiffusionCoefficient[specRec.nSpec] D = fill(0.00035, specRec.nSpec);

  Compartments.Electrolyte_0D.DiffusiveElectrolyte1D electrolyte(
    specRec=specRec,
    X=electrodeSpacing,
    Y=cellWidth,
    Z=cellHeight,
    nCells=nCells,
    D=D,
    kappa=10,
    c0={fill(c0[1], nCells),fill(c0[2], nCells),fill(c0[3], nCells)});

  MaterialDomain.Flows.FixedConcentrationsWithDiffFlowL leftSide(specRec=
        specRec, c={55.5,1e0,1e-14});
  MaterialDomain.Flows.FixedConcentrationsWithDiffFlowL rightSide(specRec=
        specRec, c=c0);

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

  ElectricalDomain.Source.Current_Source.LinearCurrentDensity currentSource(
    dj=1,
    j0=0,
    Y=cellWidth,
    Z=cellHeight);
  Modelica.Electrical.Analog.Basic.Ground ground;

equation

  connect(leftSide.diffFlow, leftDiffusiveConnection.leftFlow);
  connect(leftDiffusiveConnection.rightFlow, electrolyte.leftFlow);
  connect(electrolyte.rightFlow, rightDiffusiveConnection.leftFlow);
  connect(rightDiffusiveConnection.rightFlow, rightSide.diffFlow);
  connect(currentSource.p, electrolyte.p);
  connect(currentSource.n, electrolyte.n);
  connect(currentSource.n, ground.p);

  // Expectation:
  // Modeling 1D diffusion, starting with neutral water (pH=7) and contacting with pH=0 at the left side
  // --> Expecting increasing H+ concentration, first at leftmost component, later at components further right
  //     Simultaneously, overpotential should increase linearly as current density increases linearly as well
  // to be found @   Hp              electrolyte.c[2,i] for all i=1,2,...,n
  //                 OHm             electrolyte.c[3,i] for all i=1,2,...,n
  //                 current density electrolyte.j
  //                 potential       electrolyte.v
end TestDiffusiveElectrolyte1D;
