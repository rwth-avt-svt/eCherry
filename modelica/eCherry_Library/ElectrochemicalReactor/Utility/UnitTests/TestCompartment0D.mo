within eCherry_Library.ElectrochemicalReactor.Utility.UnitTests;
model TestCompartment0D

  import eCherry_Library.ElectrochemicalReactor.SpeciesPackage.*;

  parameter SpeciesRecord specRec(species={H2O, Hp, OHm});
  parameter Volume V = 1 "in m^3";
  parameter Concentration c0[specRec.nSpec] = {55.5, 1e-7, 1e-7};
  parameter Real D_0[specRec.nSpec] = {0.00035,0.00035,0.00035};

  Compartments.Compartment0D electrolyte(
    specRec=specRec,
    V=V,
    c0=c0,
    nDiffFlows=2);

  MaterialDomain.ConnectionLayers.DiffusiveConnectionLayer
    smallDiffusiveConnection(
    specRec=specRec,
    Y=1,
    Z=1,
    dX=1,
    D=D_0);
  MaterialDomain.ConnectionLayers.DiffusiveConnectionLayer
    largeDiffusiveConnection(
    specRec=specRec,
    Y=2,
    Z=2,
    dX=1,
    D=D_0);

  //FixedConcentrationsWithDiffFlow smallSide(specRec=specRec, c={55.5, 1e0, 1e-7});
  //FixedConcentrationsWithDiffFlow largeSide(specRec=specRec, c={55.5, 1e-7, 1e0});

  MaterialDomain.Flows.FixedConcentrationsWithDiffFlowL smallSide(specRec=
        specRec, c={55.5,1e0,1e-14});
  MaterialDomain.Flows.FixedConcentrationsWithDiffFlowL largeSide(specRec=
        specRec, c={55.5,1e-14,1e0});

equation

  connect(smallSide.diffFlow, smallDiffusiveConnection.leftFlow);
  connect(smallDiffusiveConnection.rightFlow, electrolyte.diffFlow[1]);

  connect(largeSide.diffFlow, largeDiffusiveConnection.leftFlow);
  connect(largeDiffusiveConnection.rightFlow, electrolyte.diffFlow[2]);

  // Expectation:
  // Modeling lumped compartment, starting with neutral water (pH=7) and contacting
  // with pH=0 via a small diffusive patch and pH=14 via a larger one.
  // --> Expecting both H+ and OH- to increase, but OH- faster b/c of larger area for diffusion
  // to be found @   Hp  electrolyte.c[2]
  //                 OHm electrolyte.c[3]
  annotation (experiment(StopTime=100, __Dymola_Algorithm="Dassl"));
end TestCompartment0D;
