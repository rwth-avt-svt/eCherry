within eCherry_Library.Data.UserInput;
record Pyschik2024_CyclicVoltammetry

   //Species: define the required speices here, we simplifiy electrolyte as H2O as note modelled in detail:
  constant eCherry_Library.Data.DataRecords.Species.SpeciesRecord FRRspec(
      species={eCherry_Library.Data.DataRecords.Species.DissolvedSpecies.Fcp,
        eCherry_Library.Data.DataRecords.Species.DissolvedSpecies.Fc,
        eCherry_Library.Data.DataRecords.Species.LiquidSpecies.H2O});

  //Reactions: define the reactions here:
  constant DataRecords.ElecReaction.Reaction FCOR=DataRecords.ElecReaction.List_Of_Reactions.FCOR;

  //Geometry: define the geometry of the reactor here:
  constant DataRecords.Geometry StandRec(
    X=0.01,
    Y=1,
    Z=1,
    cond0=1,
    dX=1e-6,
    slices=1);

  //Conditions: Define  constant Temperature and pressure within the electrolyzer
  constant DataRecords.Conditions CondRec(
    T0=303,
    Tenvironment=203,
    p=1);

  //Concentrations: Define the initial concentrations within your bulk electrolyte here:
   constant Modelica.Units.SI.Concentration c0[FRRspec.nSpec]={0.5,0.5, 55e3};

  //Geometry: define the geometry of the reactor here:
  constant DataRecords.Geometry GeoRec(
    X=0.00125,
    X_membrane=0.0005,
    Y=1,
    Z=1,
    cond0=1,
    dX=1e-6);

end Pyschik2024_CyclicVoltammetry;
