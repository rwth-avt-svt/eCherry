within eCherry_Library.ElectrochemicalReactor.Utility;
function get_m_tot "returns accumulated mass from a vector of molar mass in kg"

  input AmountOfSubstance mol_vec[:];
  input Data.DataRecords.Species.SpeciesRecord specRec;

  output Mass m_tot;

algorithm

  m_tot := sum(mol_vec[i]*specRec.species[i].M for i in 1:specRec.nSpec);

end get_m_tot;
