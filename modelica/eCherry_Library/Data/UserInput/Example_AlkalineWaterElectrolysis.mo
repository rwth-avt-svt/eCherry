within eCherry_Library.Data.UserInput;
record Example_AlkalineWaterElectrolysis

  //Species: define the required speices for an Alkaline Water Electrolyser here:
  constant eCherry_Library.Data.DataRecords.Species.SpeciesRecord AWEspec(
      species={eCherry_Library.Data.DataRecords.Species.GaseousSpecies.O2,
        eCherry_Library.Data.DataRecords.Species.GaseousSpecies.H2,
        eCherry_Library.Data.DataRecords.Species.DissolvedSpecies.Hp,
        eCherry_Library.Data.DataRecords.Species.DissolvedSpecies.OHm,
        eCherry_Library.Data.DataRecords.Species.LiquidSpecies.H2O});

  constant eCherry_Library.Data.DataRecords.Species.SpeciesRecord GSpec(species=
       {eCherry_Library.Data.DataRecords.Species.GaseousSpecies.O2,
        eCherry_Library.Data.DataRecords.Species.GaseousSpecies.H2});
  constant eCherry_Library.Data.DataRecords.Species.SpeciesRecord DSpec(species=
       {eCherry_Library.Data.DataRecords.Species.DissolvedSpecies.Hp,
        eCherry_Library.Data.DataRecords.Species.DissolvedSpecies.OHm});
  constant eCherry_Library.Data.DataRecords.Species.SpeciesRecord LSpec(species=
       {eCherry_Library.Data.DataRecords.Species.LiquidSpecies.H2O});


  //Reactions: define the reactions for an Alkaline Water Electrolyser here:
  constant DataRecords.ElecReaction.Reaction HERdummy=DataRecords.ElecReaction.List_Of_Reactions.HERdummy;
  constant DataRecords.ElecReaction.Reaction OERdummy=DataRecords.ElecReaction.List_Of_Reactions.OERdummy;

  //Geometry: define the geometry of the reactor here:
  constant DataRecords.Geometry GeoRec(
    X=0.01,
    X_membrane=0.0005,
    Y=1,
    Z=1,
    cond0=1,
    dX=1e-6);
    constant Length X_difflayer=1e-6;

  //Conditions: Define  constant Temperature and pressure within the electrolyzer
  constant DataRecords.Conditions CondRec(
    T0=300,
    Tenvironment=293.15,
    p=1);

  //Concentrations: Define the initial concentrations within your bulk electrolyte
    constant Modelica.Units.SI.Concentration c0[AWEspec.nSpec]={0,1.45e-12,  1e-4, 6000, 55e3};
    constant Modelica.Units.SI.Pressure Pi[AWEspec.nSpec]={100000,100000,100000,100000,100000};
    constant Modelica.Units.SI.MolarFlowRate molFlow_vec[AWEspec.nSpec]={0,1.45e-12,1e-4, 6000, 55e3};

  //EnergyBalance: Define the parameters for energy calculation and heat transfer, only necessary when EnergyBalance is used
  constant DataRecords.Thermal EBdummy(
    lambda_housing=0.3,
    alpha_housing_environment=100,
    alpha_housing_electrolyte=100,
    delta_housing=0.002,
    e=1,
    rho_anode=7100,
    cp_anode=400,
    alpha_anode_externalHeating=200,
    alpha_anode_electrolyte=200,
    X_anode=0.001,
    rho_cathode=7100,
    cp_cathode=400,
    alpha_cathode_externalHeating=200,
    alpha_cathode_electrolyte=200,
    X_cathode=0.001,
    rho_membrane=1580,
    cp_membrane=4188,
    alpha_membrane_anolyte=200,
    alpha_membrane_catholyte=200,
    T0externalHeating=333.15,
    T0convectiveInflow=298.15,
    TinflowMax=298.15,
    Tenvironment_housing=333.15,
    alpha_electrolyte_electrolyte=1);
    //QFlow_shunt=0,

end Example_AlkalineWaterElectrolysis;
