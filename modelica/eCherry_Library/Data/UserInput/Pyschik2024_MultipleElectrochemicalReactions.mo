within eCherry_Library.Data.UserInput;
record Pyschik2024_MultipleElectrochemicalReactions

  constant Temperature T= 273.15 + 20;

  //Species: define the required speices for a CO2 reduction electrolyser here:
  constant DataRecords.Species.SpeciesRecord CO2spec(species={eCherry_Library.Data.DataRecords.Species.GaseousSpecies.O2,
        eCherry_Library.Data.DataRecords.Species.GaseousSpecies.H2,
        eCherry_Library.Data.DataRecords.Species.DissolvedSpecies.Hp,
        eCherry_Library.Data.DataRecords.Species.DissolvedSpecies.OHm,
        eCherry_Library.Data.DataRecords.Species.GaseousSpecies.CO,
        eCherry_Library.Data.DataRecords.Species.GaseousSpecies.CO2,
        eCherry_Library.Data.DataRecords.Species.LiquidSpecies.H2O});

  //Reactions: define the reactions for a CO2 reduction electrolyser here:
  constant DataRecords.ElecReaction.Reaction COERAg=DataRecords.ElecReaction.List_Of_Reactions.COERAg;
  constant DataRecords.ElecReaction.Reaction HER=DataRecords.ElecReaction.List_Of_Reactions.HER;
  //constant DataRecords.ElecReaction.Reaction HER=DataRecords.ElecReaction.List_Of_Reactions.HERdummy;
  constant DataRecords.ElecReaction.Reaction OER=DataRecords.ElecReaction.List_Of_Reactions.OER;
  //constant DataRecords.ElecReaction.Reaction OERdummy=DataRecords.ElecReaction.List_Of_Reactions.OERdummy;

  //Geometry: define the geometry of the reactor here:
  constant DataRecords.Geometry GeoRec(
    X=0.01,
    X_membrane=0.0005,
    Y=0.03,
    Z=0.015,
    cond0=1,
    dX=1e-6,
    slices=1);

  //Conditions: Define  constant Temperature and pressure within the electrolyzer
  constant DataRecords.Conditions CondRec(
    T0=293.15,
    Tenvironment=293.15,
    p=1);

  //Concentrations: Define the initial concentrations within your bulk electrolyte
    //constant Modelica.Units.SI.Concentration c0_CO2[CO2spec.nSpec]={0,1.45e-12,6.3e-2, 1e-4, 1e-4, 0.0016, 55e3}; //0.155
    constant Modelica.Units.SI.Concentration c0_cat[CO2spec.nSpec]={0, 1e-4, 1, 0, 1e-4, 0.016, 55e3}; //0.155
    constant Modelica.Units.SI.Concentration c0_an[CO2spec.nSpec]={0, 0, 1, 0, 0, 0, 55e3}; //0.155

end Pyschik2024_MultipleElectrochemicalReactions;
