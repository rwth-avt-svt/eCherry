within eCherry_Library.ElectrochemicalReactor.MaterialDomain.Connectors;
connector Material_Simple "Flow defined by species molar flow rates"

  // Species handling
  parameter Data.DataRecords.Species.SpeciesRecord specRec(nSpec=0);

  // Variables
  flow MolarFlowRate molFlow_vec[specRec.nSpec];

end Material_Simple;
