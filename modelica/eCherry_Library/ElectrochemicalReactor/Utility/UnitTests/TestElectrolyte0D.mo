within eCherry_Library.ElectrochemicalReactor.Utility.UnitTests;
model TestElectrolyte0D

  import eCherry_Library.Data.DataRecords.Species.*;

  parameter SpeciesRecord specRec(species={H2O, Hp, OHm});
  parameter Volume V = 1 "in m^3";
  parameter Concentration c0[specRec.nSpec] = {55.5, 1e-7, 1e-7};
  parameter DiffusionCoefficient[specRec.nSpec] D = fill(0.00035, specRec.nSpec);

  Electrolytes.LiquidElectrolytes.Electrolytes0D.Electrolyte0DBatch electrolyte(
    specRec=specRec,
    V_geo=V,
    c0=c0,
    nDiffFlows=2,
    kappa=1,
    X=1,
    Y=1,
    Z=1);

  MaterialDomain.ConnectionLayers.DiffusiveConnectionLayer
    smallDiffusiveConnection(
    specRec=specRec,
    Y=1,
    Z=1,
    dX=1,
    D=D);
  MaterialDomain.ConnectionLayers.DiffusiveConnectionLayer
    largeDiffusiveConnection(
    specRec=specRec,
    Y=2,
    Z=2,
    dX=1,
    D=D);

  MaterialDomain.Flows.FixedConcentrationsWithDiffFlowL smallSide(specRec=
        specRec, c={55.5,1e0,1e-14});
  MaterialDomain.Flows.FixedConcentrationsWithDiffFlowL largeSide(specRec=
        specRec, c={55.5,1e-14,1e0});

  ElectricalDomain.Source.Current_Source.LinearCurrentDensity currentSource(
    dj=1,
    j0=0,
    Y=1,
    Z=1);
  Modelica.Electrical.Analog.Basic.Ground ground;

equation

  connect(smallSide.diffFlow, smallDiffusiveConnection.leftFlow);
  connect(smallDiffusiveConnection.rightFlow, electrolyte.diffFlow[1]);

  connect(largeSide.diffFlow, largeDiffusiveConnection.leftFlow);
  connect(largeDiffusiveConnection.rightFlow, electrolyte.diffFlow[2]);

  connect(currentSource.p, electrolyte.p);
  connect(currentSource.n, electrolyte.n);
  connect(currentSource.n, ground.p);

  // Expectation:
  // Modeling lumped compartment, starting with neutral water (pH=7) and contacting
  // with pH=0 via a small diffusive patch and pH=14 via a larger one.
  // --> Expecting both H+ and OH- to increase, but OH- faster b/c of larger area for diffusion
  //     Simultaneously, overpotential should increase linearly as current density increases linearly as well
  // to be found @   Hp  electrolyte.c[2]
  //                 OHm electrolyte.c[3]
end TestElectrolyte0D;
