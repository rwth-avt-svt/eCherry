within eCherry_Library.Data.UserInput;
record Example_AlkalineAmmoniaElectrolyzer
  //leai01

 //AESspec = Ammonia Electrochemical Synthesis Species
 constant eCherry_Library.Data.DataRecords.Species.SpeciesRecord AESspec(species={
    eCherry_Library.Data.DataRecords.Species.GaseousSpecies.O2,
    eCherry_Library.Data.DataRecords.Species.GaseousSpecies.H2,
    eCherry_Library.Data.DataRecords.Species.GaseousSpecies.N2,
    eCherry_Library.Data.DataRecords.Species.DissolvedSpecies.NH3,
    eCherry_Library.Data.DataRecords.Species.DissolvedSpecies.OHm,
    eCherry_Library.Data.DataRecords.Species.DissolvedSpecies.Kp,
    eCherry_Library.Data.DataRecords.Species.LiquidSpecies.H2O});

  // speciesRecords for Electrolyte_Conti_0D_GL
  constant eCherry_Library.Data.DataRecords.Species.SpeciesRecord Gspec(species={
    eCherry_Library.Data.DataRecords.Species.GaseousSpecies.O2,
    eCherry_Library.Data.DataRecords.Species.GaseousSpecies.H2,
    eCherry_Library.Data.DataRecords.Species.GaseousSpecies.N2});
  constant eCherry_Library.Data.DataRecords.Species.SpeciesRecord Dspec(species={
   eCherry_Library.Data.DataRecords.Species.DissolvedSpecies.NH3,
    eCherry_Library.Data.DataRecords.Species.DissolvedSpecies.OHm,
    eCherry_Library.Data.DataRecords.Species.DissolvedSpecies.Kp});
  constant eCherry_Library.Data.DataRecords.Species.SpeciesRecord Lspec(species={
    eCherry_Library.Data.DataRecords.Species.LiquidSpecies.H2O});


  //Reactions: define the reactions here:
  constant DataRecords.ElecReaction.Reaction NRRdummy(
    species={"Nitrogen","Water", "Ammonia", "Hydroxide"},
    nu={-0.5, -3, 1, 3},
    RO={-0.5, -3, 1, 3},
    z=3,
    Eeq0=-0.736,
    j0=0.038,
    alpha_a=0.748,
    alpha_c=1.252,
    dH_app=0);
             // mA/cm^2 = 0.1 A/m^2
  constant DataRecords.ElecReaction.Reaction HERdummy(
    species={"Water","Hydrogen","Hydroxide"},
    nu={-2,1,2},
    RO={-2,1,2},
    z=2,
    Eeq0=-0.829,
    j0=2,
    alpha_a=1,
    alpha_c=1,
    dH_app=0,
    Eth0=0.5809);
         //2
            // mA/cm^2 = 0.1 A/m^2
  constant DataRecords.ElecReaction.Reaction OERdummy(
    species={"Oxygen","Water","Hydroxide"},
    nu={-0.5,-1,2},
    RO={-0.5,-1,1},
    z=2,
    Eeq0=0.401,
    j0=0.038,
    alpha_a=0.748,
    alpha_c=1.252,
    dH_app=0,
    Eth0=0.9002);
    //j0 https://doi.org/10.1016/j.jcat.2019.09.010
    //alpha https://doi.org/10.1016/j.jcat.2019.09.010
    // mA/cm^2 = 0.1 A/m^2

  //Geometry: define the geometry of the reactor here:
  constant DataRecords.Geometry GeoRec(X=0.001,X_membrane=115e-6,Y=0.5,Z=1,cond0=1, dX=0.01, slices=20);
  constant DataRecords.Geometry GeoRecMem(X=115e-6,X_membrane=115e-6,Y=0.5,Z=1,cond0=1, dX=0.01);
  constant DataRecords.Geometry GeoRecElec(X=0.005,X_membrane=115e-6,Y=0.5,Z=1,cond0=1, dX=0.01);

  //Conditions: Define  constant Temperature and pressure within the electrolyzer
  constant DataRecords.Conditions CondRec(T0=333.15, Tenvironment=288.15, p=1e5);

  //Concentrations: Define the initial concentrations within your bulk electrolyte here:
  // O2, H2, N2, NH3, OHm, Kp, H2O
  constant Modelica.Units.SI.Concentration c0_Electrolyte[AESspec.nSpec]={0, 0,  0, 0, 6000, 6000,55e3};
  constant Modelica.Units.SI.Concentration c0_GasChannel[AESspec.nSpec]={0,0,1,0,0,0,0};
  constant Real mol_vec_frac0[AESspec.nSpec]={0, 0, 1, 0, 0, 0, 0};


  //time in electrolyzer
  constant Modelica.Units.SI.Time t=5 "time [s] in flow channel (gas or electrolyte)";
  constant Modelica.Units.SI.Time t_catholyte=5 "time [s] in flow channel (gas or electrolyte)";
  constant Modelica.Units.SI.Time t_anolyte=5 "time [s] in flow channel (gas or electrolyte)";
  constant Modelica.Units.SI.Time t_gas=5 "time [s] in flow channel (gas or electrolyte)";

  //EnergyBalance: Define the parameters for energy calculation and heat transfer, only necessary when EnergyBalance is used
  constant DataRecords.Thermal EBdummy(
    lambda_housing=0,
    alpha_housing_environment=0,
    alpha_housing_electrolyte=0,
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
    T0convectiveInflow=343.15,
    TinflowMax=353.15,
    Tenvironment_housing=333.15,
    alpha_electrolyte_electrolyte=1);
    //QFlow_shunt=0,

  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end Example_AlkalineAmmoniaElectrolyzer;
