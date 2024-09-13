within eCherry_Library.ElectrochemicalReactor.Utility;
function get_m_vec "converts a vector of moles to a vector of mass"

  input AmountOfSubstance mol_vec[:];
  input Data.DataRecords.Species.SpeciesRecord specRec;

  output Mass m_vec[:];

algorithm
  for i in 1:(specRec.nSpec) loop
    m_vec[i] := mol_vec[i]*specRec.species[i].M;
  end for;
end get_m_vec;
