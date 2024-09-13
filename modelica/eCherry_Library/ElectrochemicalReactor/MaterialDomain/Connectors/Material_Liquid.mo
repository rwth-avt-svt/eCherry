within eCherry_Library.ElectrochemicalReactor.MaterialDomain.Connectors;
connector Material_Liquid
  "Flow defined by species molar flow rates and concentrations"

  // Species handling
  parameter Data.DataRecords.Species.SpeciesRecord specRec(nSpec=0);

  // Variables
  Concentration c[specRec.nSpec];
  flow MolarFlowRate molFlow_vec[specRec.nSpec];

end Material_Liquid;
