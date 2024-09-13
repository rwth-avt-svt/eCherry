within eCherry_Library.ElectrochemicalReactor.Utility;
function get_x "returns substance amount fraction in mol%"

  input AmountOfSubstance mol_vec[:];
  input Data.DataRecords.Species.SpeciesRecord specRec;
  AmountOfSubstance mol_tot;
  output Real x[:];

algorithm

  mol_tot :=sum(mol_vec[i] for i in 1:specRec.nSpec);
  x := mol_vec/mol_tot;

end get_x;
