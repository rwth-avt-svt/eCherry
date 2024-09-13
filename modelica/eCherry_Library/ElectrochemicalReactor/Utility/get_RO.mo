within eCherry_Library.ElectrochemicalReactor.Utility;
function get_RO
  "returns reaction order (RO) of Species spec in (electrochemical) Reaction reac"
  input Data.DataRecords.Species.Species spec;
  input Data.DataRecords.ElecReaction.Reaction reac;
  output Real RO;
algorithm
  RO :=if string_in_list(spec.name, reac.species) then reac.RO[
    get_string_index(spec.name, reac.species)] else 0;
end get_RO;
