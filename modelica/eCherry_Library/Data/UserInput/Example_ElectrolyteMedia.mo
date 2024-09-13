within eCherry_Library.Data.UserInput;
record Example_ElectrolyteMedia

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

  constant eCherry_Library.Data.DataRecords.Species.SpeciesRecord
    Alkaline_NaOH_spec(species={eCherry_Library.Data.DataRecords.Species.GaseousSpecies.O2,
        eCherry_Library.Data.DataRecords.Species.GaseousSpecies.H2,
        eCherry_Library.Data.DataRecords.Species.DissolvedSpecies.Hp,
        eCherry_Library.Data.DataRecords.Species.DissolvedSpecies.OHm,
        eCherry_Library.Data.DataRecords.Species.DissolvedSpecies.Nap,
        eCherry_Library.Data.DataRecords.Species.DissolvedSpecies.NaOH,
        eCherry_Library.Data.DataRecords.Species.LiquidSpecies.H2O});
//         corresponds to Electrolysis_H2_NaOH in the Electrolytemedia
//         the same species in the same order
end Example_ElectrolyteMedia;
