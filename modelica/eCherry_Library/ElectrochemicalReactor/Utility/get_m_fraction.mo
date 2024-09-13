within eCherry_Library.ElectrochemicalReactor.Utility;
function get_m_fraction

  input AmountOfSubstance mol_vec[:];
  input Data.DataRecords.Species.SpeciesRecord specRec;
  Mass m_tot;
  output Real specVec_mass_fraction[:];

algorithm

  m_tot :=get_m_tot(mol_vec, specRec);
  specVec_mass_fraction := mol_vec.*specRec.species.M/m_tot;

end get_m_fraction;
