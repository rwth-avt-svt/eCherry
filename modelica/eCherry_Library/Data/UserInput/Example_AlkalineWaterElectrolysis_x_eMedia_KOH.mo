within eCherry_Library.Data.UserInput;
record Example_AlkalineWaterElectrolysis_x_eMedia_KOH

  constant DataRecords.ElecReaction.Reaction HERdummy=DataRecords.ElecReaction.List_Of_Reactions.HERdummy;
  constant DataRecords.ElecReaction.Reaction OERdummy=DataRecords.ElecReaction.List_Of_Reactions.OERdummy;

//constant SpeciesPackage.SpeciesRecord SpecRec=Echery_library.Media.SpeciesPackage.Alkaline_KOH_spec;
  constant eCherry_Library.Data.DataRecords.Species.SpeciesRecord
    Alkaline_KOH_spec(species={eCherry_Library.Data.DataRecords.Species.GaseousSpecies.O2,
        eCherry_Library.Data.DataRecords.Species.GaseousSpecies.H2,
        eCherry_Library.Data.DataRecords.Species.DissolvedSpecies.Hp,
        eCherry_Library.Data.DataRecords.Species.DissolvedSpecies.OHm,
        eCherry_Library.Data.DataRecords.Species.DissolvedSpecies.Kp,
        eCherry_Library.Data.DataRecords.Species.DissolvedSpecies.KOH,
        eCherry_Library.Data.DataRecords.Species.LiquidSpecies.H2O});
//         corresponds to Electrolysis_H2_KOH in the Electrolytemedia
//         the same species in the same order
// constant SpeciesPackage.SpeciesRecord SpecRec=Echery_library.Media.SpeciesPackage.Alkaline_NaOH_spec;
   constant Modelica.Units.SI.Pressure Pi[Alkaline_KOH_spec.nSpec]=ones(Alkaline_KOH_spec.nSpec)*100000;
end Example_AlkalineWaterElectrolysis_x_eMedia_KOH;
