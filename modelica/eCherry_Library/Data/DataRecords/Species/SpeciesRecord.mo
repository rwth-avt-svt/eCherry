within eCherry_Library.Data.DataRecords.Species;
record SpeciesRecord "Collects information on which species occur in a given model"
    Species species[:] "Array of species to be used in a model";
    constant Integer nSpec = size(species, 1);
end SpeciesRecord;
