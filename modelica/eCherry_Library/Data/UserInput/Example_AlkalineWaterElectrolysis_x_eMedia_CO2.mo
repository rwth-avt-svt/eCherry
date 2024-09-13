within eCherry_Library.Data.UserInput;
record Example_AlkalineWaterElectrolysis_x_eMedia_CO2
  import eCherry_Library.Data.DataRecords.Species.GaseousSpecies.*;
  import eCherry_Library.Data.DataRecords.Species.DissolvedSpecies.*;
  import eCherry_Library.Data.DataRecords.Species.LiquidSpecies.*;

  constant DataRecords.ElecReaction.Reaction HERdummy=DataRecords.ElecReaction.List_Of_Reactions.HERdummy;
  constant DataRecords.ElecReaction.Reaction OERdummy=DataRecords.ElecReaction.List_Of_Reactions.OERdummy;

  constant DataRecords.Species.SpeciesRecord CO2Spec(species={Hp,OHm,CO,CO2,Kp,
        HCO3m,CO3mm,KSO4m,SO4mm,HSO4m,KOH,H2,O2,H2O});

   constant Modelica.Units.SI.Pressure Pi[CO2Spec.nSpec]=ones(CO2Spec.nSpec)*100000;

end Example_AlkalineWaterElectrolysis_x_eMedia_CO2;
