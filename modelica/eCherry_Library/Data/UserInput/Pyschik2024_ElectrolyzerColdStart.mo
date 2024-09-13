within eCherry_Library.Data.UserInput;
record Pyschik2024_ElectrolyzerColdStart
//Species: define the required speices for an Alkaline Water Electrolyser with KOH solution here:
  constant Data.DataRecords.Species.SpeciesRecord AWEKOHspec(species={Data.DataRecords.Species.GaseousSpecies.O2,
        Data.DataRecords.Species.GaseousSpecies.H2,Data.DataRecords.Species.DissolvedSpecies.Hp,
        Data.DataRecords.Species.DissolvedSpecies.OHm,Data.DataRecords.Species.DissolvedSpecies.Kp,
        Data.DataRecords.Species.LiquidSpecies.H2O});

  //Reactions: define the reactions for an Alkaline Water Electrolyser here:
  constant Data.DataRecords.ElecReaction.Reaction HERdummy=Data.DataRecords.ElecReaction.List_Of_Reactions.HERdummy_Sakas2022;
  constant Data.DataRecords.ElecReaction.Reaction OERdummy=Data.DataRecords.ElecReaction.List_Of_Reactions.OERdummy_Sakas2022;

  //Geometry: define the geometry of the reactor here:
  constant Data.DataRecords.Geometry GeoRec(
    X=0.00475,
    Y=1.631,
    X_membrane=0.1,
    Z=1.631,
    cond0=1,
    dX=1e-6);

  //Conditions: Define  constant Temperature and pressure within the electrolyzer
  constant Data.DataRecords.Conditions CondRec(
    T0=303.15,
    p=16,
    Tenvironment=303.15);

  //Concentrations: Define the initial concentrations within your bulk electrolyte
    constant Modelica.Units.SI.Concentration c0[AWEKOHspec.nSpec]={0,1.45e-12,  2e-4, 13300, 13300,53e3};
    constant Modelica.Units.SI.Pressure Pi[AWEKOHspec.nSpec]={1600000,1600000,1600000,1600000,1600000,1600000};

    //constant MolarFlowRate[AWEKOHspec.nSpec] molFlow_vec_inFlow = {0,1.45e-12,  1e-4, 6000, 6000,55e3}/100;
    constant MolarFlowRate[AWEKOHspec.nSpec] molFlow_vec_inFlow = {1e-10,1e-10,1e-5,78.7,78,310}/(163*2);
    //constant MolarFlowRate[AWEKOHspec.nSpec] molFlow_vec_inFlow = {1e-10,1e-10,1e-5,145.277,145.277,134.438}/(163*2);
    constant Conductivity kappa_const = 1000;

  constant
    eCherry_Library.Data.DataRecords.Thermal
    EBdummy(
    lambda_housing=0.3,
    alpha_housing_environment=100,
    alpha_housing_electrolyte=100,
    delta_housing=0.002,
    Tenvironment_housing=303.05,
    e=1,
    rho_anode=8000,
    cp_anode=420,
    alpha_anode_externalHeating=200,
    alpha_anode_electrolyte=100000,
    X_anode=0.00325,
    rho_cathode=8000,
    cp_cathode=420,
    alpha_cathode_externalHeating=200,
    alpha_cathode_electrolyte=100000,
    X_cathode=0.00325,
    rho_membrane=1,
    cp_membrane=3000,
    alpha_membrane_anolyte=100000,
    alpha_membrane_catholyte=100000,
    T0externalHeating=333.15,
    T0convectiveInflow=343.15,
    alpha_electrolyte_electrolyte=1);

end Pyschik2024_ElectrolyzerColdStart;
