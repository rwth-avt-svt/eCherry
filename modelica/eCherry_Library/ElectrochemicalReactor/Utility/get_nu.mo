within eCherry_Library.ElectrochemicalReactor.Utility;
function get_nu
  "returns stoichionetric coefficient (nu) of Species spec in (electrochemical) Reaction reac"
  input Data.DataRecords.Species.Species spec;
  input Data.DataRecords.ElecReaction.Reaction reac;
  output Real nu;
algorithm
  nu :=if string_in_list(spec.name, reac.species) then reac.nu[
    get_string_index(spec.name, reac.species)] else 0;

end get_nu;
