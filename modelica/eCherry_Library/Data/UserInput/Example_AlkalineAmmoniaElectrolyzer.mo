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

  //Reactions: define the reactions here:
  constant DataRecords.ElecReaction.Reaction NRRdummy=DataRecords.ElecReaction.List_Of_Reactions.NRRdummy;
  constant DataRecords.ElecReaction.Reaction HERdummy=DataRecords.ElecReaction.List_Of_Reactions.HERdummy;
  constant DataRecords.ElecReaction.Reaction OERdummy=DataRecords.ElecReaction.List_Of_Reactions.OERdummy;

  //Geometry: define the geometry of the reactor here:
  constant DataRecords.Geometry GeoRec(X=0.001,X_membrane=115e-6,Y=0.5,Z=1/slices,cond0=1, dX=0.01);
  constant DataRecords.Geometry GeoRecMem(X=115e-6,X_membrane=115e-6,Y=0.5,Z=1/slices,cond0=1, dX=0.01);
  constant DataRecords.Geometry GeoRecElec(X=0.005,X_membrane=115e-6,Y=0.5,Z=1/slices,cond0=1, dX=0.01);

  //Conditions: Define  constant Temperature and pressure within the electrolyzer
  constant DataRecords.Conditions CondRec(T0=333.15, Tenvironment=288.15, p=1e5);

  //Concentrations: Define the initial concentrations within your bulk electrolyte here:
  // O2, H2, N2, NH3, OHm, Kp, H2O
  constant Modelica.Units.SI.Concentration c0_Electrolyte[AESspec.nSpec]={0,1.45e-12,  0, 0, 6000, 6000,55e3};
  constant Modelica.Units.SI.Concentration c0_GasChannel[AESspec.nSpec]={0,0,1,0,0,0,0};
  constant Real mol_vec_frac0[AESspec.nSpec]={0, 0, 1, 0, 0, 0, 0};

  //Discretization: Define number of slices in convection layer:
  constant Integer slices(min=2)=10;

  //time in electrolyzer
  constant Modelica.Units.SI.Time t=5 "time [s] in flow channel (gas or electrolyte)";

  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end Example_AlkalineAmmoniaElectrolyzer;
