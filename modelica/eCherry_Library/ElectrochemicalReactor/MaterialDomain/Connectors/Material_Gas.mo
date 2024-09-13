within eCherry_Library.ElectrochemicalReactor.MaterialDomain.Connectors;
connector Material_Gas
  "Flow defined by species molar flow rates and partial pressures"

  // Species handling
  parameter Data.DataRecords.Species.SpeciesRecord specRec(nSpec=0);

  // Variables
  Pressure Pi[specRec.nSpec];
  flow MolarFlowRate molFlow_vec[specRec.nSpec];

  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end Material_Gas;
