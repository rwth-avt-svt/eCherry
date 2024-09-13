within eCherry_Library.ElectrochemicalReactor.Utility;
function get_mFlow_tot
  "returns mass flow which is transported through a connector in kg/s"

  input MolarFlowRate molFlow_vec[:]; //specRec.nSpec
  input Data.DataRecords.Species.SpeciesRecord specRec;
  output MassFlowRate mFlow_tot;

algorithm

  mFlow_tot := sum(molFlow_vec[i]*specRec.species[i].M for i in 1:specRec.nSpec);

end get_mFlow_tot;
