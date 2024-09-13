within eCherry_Library.ElectrochemicalReactor.Utility.UnitTests;
model TestCompartment0DWithInflow

  import eCherry_Library.ElectrochemicalReactor.SpeciesPackage.*;

  parameter SpeciesRecord specRec(species={H2O, Hp, OHm});
  parameter Volume V = 1 "in m^3";
  parameter Concentration c0[specRec.nSpec] = {55.5, 1e-7, 1e-7};
  parameter Real D_0[specRec.nSpec] = {0.00035,0.00035,0.00035};
  Compartments.Compartment0DWithInflow electrolyte(
    specRec=specRec,
    V=V,
    c0=c0,
    nDiffFlows=1);

  MaterialDomain.ConnectionLayers.DiffusiveConnectionLayer diffusiveConnection(
    specRec=specRec,
    Y=1,
    Z=1,
    dX=1,
    D=D_0);

  MaterialDomain.Flows.FixedConcentrationsWithDiffFlowL side(specRec=specRec, c
      ={55.5,1e0,1e-14});

  MaterialDomain.Flows.FixedConvInFlowL inlet(
    specRec=specRec,
    Vflow=0.1,
    c={55.5,1e-14,1e0});

equation

  connect(side.diffFlow, diffusiveConnection.leftFlow);
  connect(diffusiveConnection.rightFlow, electrolyte.diffFlow[1]);

  connect(inlet.convFlow, electrolyte.inFlow);

  // Expectation:
  // Modeling lumped compartment, starting with neutral water (pH=7) and receiving
  // an inflow with pH=14, while having a diffusive connection to pH=0.
  // --> Expecting all concentrations to increase and then level off because of diffusion (very long time frame, because diffusion is slow
  // to be found @   Hp  electrolyte.c[2]
  //                 OHm electrolyte.c[3]
    annotation (experiment(StopTime=5e4, __Dymola_Algorithm="Dassl"));
end TestCompartment0DWithInflow;
