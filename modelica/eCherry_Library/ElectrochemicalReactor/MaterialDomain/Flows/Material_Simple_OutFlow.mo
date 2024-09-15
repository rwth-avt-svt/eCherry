within eCherry_Library.ElectrochemicalReactor.MaterialDomain.Flows;
model Material_Simple_OutFlow "Convective outflow, not imposing anything"

  // Species handling
  parameter Data.DataRecords.Species.SpeciesRecord specRec(nSpec=0);

  // Connectors
  Connectors.Material_Simple convFlow(specRec=specRec) annotation (Placement(
        transformation(extent={{0,-100},{20,-80}}), iconTransformation(extent={
            {-20,-120},{20,-80}})));
  annotation (Icon(graphics={Bitmap(
          extent={{-108,-100},{106,100}},
          fileName="modelica://eCherry_Library/../Icons/Arrow.png")}));
end Material_Simple_OutFlow;
