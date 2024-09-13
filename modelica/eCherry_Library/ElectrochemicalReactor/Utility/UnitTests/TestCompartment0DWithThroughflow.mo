within eCherry_Library.ElectrochemicalReactor.Utility.UnitTests;
model TestCompartment0DWithThroughflow

  import eCherry_Library.Data.DataRecords.Species.*;
  import eCherry_Library.ElectrochemicalReactor.MaterialDomain.*;

  parameter SpeciesRecord specRec(species={SpeciesPackage.LiquidSpecies.H2O, SpeciesPackage.DissolvedSpecies.Hp, SpeciesPackage.DissolvedSpecies.OHm});
  parameter Volume V = 1 "in m^3";
  parameter Concentration c0[specRec.nSpec] = {55.5, 1e-7, 1e-7};
  parameter Real D_0[specRec.nSpec] = {0.00035,0.00035,0.00035};
  parameter NumberOfMolecules  n0[specRec.nSpec] = {1, 1, 1};
  parameter Length X=1, Y=1, Z=1;
  //parameter MolarFlowRate nFlow = {1, 1, 1};
  Electrolytes.LiquidElectrolytes.Electrolytes0D.Electrolyte0DConti electrolyte(
    specRec=specRec,
    X=X,
    Y=Y,
    Z=Z,
    mol_vec0=n0);
       //nDiffFlows=1  c=c0,   n_vec0 = n0,     V=V,

  MaterialDomain.ConnectionLayers.DiffusiveConnectionLayer diffusiveConnection(
    specRec=specRec,
    Y=1,
    Z=1,
    dX=1,
    D=D_0);

  MaterialDomain.Flows.FixedConcentrationsWithDiffFlowL side(specRec=specRec, c
      ={55.5,1e0,1e-14});

  MaterialDomain.Flows.FixedConvInFlowL inlet(specRec=specRec);
    //c={55.5,1e-14,1e0}); nFlow = {1,1,1}
  MaterialDomain.Flows.ConvectiveOutFlowL outlet(specRec=specRec);

equation

  connect(side.diffFlow, diffusiveConnection.leftFlow);
  connect(diffusiveConnection.rightFlow, electrolyte.leftFlow);  //electrolyte.diffFlow[1]

  connect(inlet.convFlow, electrolyte.inFlow);
  connect(electrolyte.outFlow, outlet.convFlow);

  // Expectation:
  // Modeling lumped compartment, starting with neutral water (pH=7) and receiving
  // an inflow with pH=14, while having a diffusive connection to pH=0.
  // --> Expecting both H+ and OH- to increase (b/c of diffusion and mainly (!) convection, respectively, and then level off).
  // to be found @   Hp  electrolyte.c[2]
  //                 OHm electrolyte.c[3]
    annotation (experiment(StopTime=1e2, __Dymola_Algorithm="Dassl"));
end TestCompartment0DWithThroughflow;
