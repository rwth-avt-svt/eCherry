within eCherry_Library.Data.UserInput;
record Pyschik2024_AlkalineWaterElectrolyzer

    constant Temperature T= 273.15 + 50;

  //Species: define the required species for an Alkaline Water Electrolyser here:
  constant eCherry_Library.Data.DataRecords.Species.SpeciesRecord AWEspec(
      species={eCherry_Library.Data.DataRecords.Species.GaseousSpecies.O2,
        eCherry_Library.Data.DataRecords.Species.GaseousSpecies.H2,
        eCherry_Library.Data.DataRecords.Species.DissolvedSpecies.Hp,
        eCherry_Library.Data.DataRecords.Species.DissolvedSpecies.OHm,
        eCherry_Library.Data.DataRecords.Species.LiquidSpecies.H2O});

      //Species: define the required species for an Alkaline Water Electrolyser here:
  constant eCherry_Library.Data.DataRecords.Species.SpeciesRecord AWE_Gspec(
      species={eCherry_Library.Data.DataRecords.Species.GaseousSpecies.O2,
        eCherry_Library.Data.DataRecords.Species.GaseousSpecies.H2});

  constant eCherry_Library.Data.DataRecords.Species.SpeciesRecord AWE_Lspec(
      species={eCherry_Library.Data.DataRecords.Species.LiquidSpecies.H2O});

  constant eCherry_Library.Data.DataRecords.Species.SpeciesRecord AWE_Dspec(
      species={eCherry_Library.Data.DataRecords.Species.DissolvedSpecies.Hp,
        eCherry_Library.Data.DataRecords.Species.DissolvedSpecies.OHm});

  //Reactions: define the reactions for an Alkaline Water Electrolyser here:
  constant DataRecords.ElecReaction.Reaction HERdummy(
    species={"Water","Hydrogen","Hydroxide"},
    nu={-2,1,2},
    RO={0,0,0},
    z=2,
    Eeq0=-0.829,
    j0=(13.72491 - 0.09055*T + 0.09055*T^2)/10,
    alpha_a = 1-(0.1175 + 0.00095*T)*2,
    alpha_c = (0.1175 + 0.00095*T)*2,
    dH_app=0);

  constant DataRecords.ElecReaction.Reaction OERdummy(
    species={"Oxygen","Water","Hydroxide"},
    nu={-0.5,-1,2},
    RO={0,0,0},
    z=2,
    Eeq0=0.401,
    j0=(30.4 - 0.206*T + 0.00035*T^2)/10,
    alpha_a = (0.0675 + 0.00095*T)*2,
    alpha_c = 1-(0.0675 + 0.00095*T)*2,
    dH_app=0);

  //Geometry: define the geometry of the reactor here:
  constant DataRecords.Geometry GeoRec(
    X=0.00125,
    X_membrane=0.0005,
    Y=0.03^0.5,
    Z=0.03^0.5,
    cond0=1,
    dX=1e-6);


  //Conditions: Define  constant Temperature and pressure within the electrolyzer
  constant DataRecords.Conditions CondRec(
    T0=T,
    Tenvironment=293.15,
    p=1);

  //Concentrations: Define the initial concentrations within your bulk electrolyte
    constant Modelica.Units.SI.Concentration c0[AWEspec.nSpec]={1e-10,1e-10,  1e-10, 6000, 55e3};


end Pyschik2024_AlkalineWaterElectrolyzer;
