within eCherry_Library.Data.UserInput;
record Example_AlkalineWaterElectrolysis_KOH

  //Species: define the required speices for an Alkaline Water Electrolyser with KOH solution here:
  constant eCherry_Library.Data.DataRecords.Species.SpeciesRecord AWEKOHspec(
      species={eCherry_Library.Data.DataRecords.Species.GaseousSpecies.O2,
        eCherry_Library.Data.DataRecords.Species.GaseousSpecies.H2,
        eCherry_Library.Data.DataRecords.Species.DissolvedSpecies.Hp,
        eCherry_Library.Data.DataRecords.Species.DissolvedSpecies.OHm,
        eCherry_Library.Data.DataRecords.Species.DissolvedSpecies.Kp,
        eCherry_Library.Data.DataRecords.Species.LiquidSpecies.H2O});

  //Reactions: define the reactions for an Alkaline Water Electrolyser here:
  constant DataRecords.ElecReaction.Reaction HERdummy=DataRecords.ElecReaction.List_Of_Reactions.HERdummy;
  constant DataRecords.ElecReaction.Reaction OERdummy=DataRecords.ElecReaction.List_Of_Reactions.OERdummy;

  //Geometry: define the geometry of the reactor here:
  constant DataRecords.Geometry GeoRec(
    X=0.01,
    X_membrane=0.0005,
    Y=0.05,
    Z=0.05,
    cond0=1,
    dX=1e-6);

  //Conditions: Define  constant Temperature and pressure within the electrolyzer
  constant DataRecords.Conditions CondRec(
    T0=300,
    Tenvironment=293.15,
    p=1);

  //Concentrations: Define the initial concentrations within your bulk electrolyte
    constant Modelica.Units.SI.Concentration c0_KOH[AWEKOHspec.nSpec]={0,1.45e-12,  1e-4, 6000, 6000,55e3};
    constant Modelica.Units.SI.Pressure Pi[AWEKOHspec.nSpec]={100000,100000,100000,100000,100000,100000};

end Example_AlkalineWaterElectrolysis_KOH;
