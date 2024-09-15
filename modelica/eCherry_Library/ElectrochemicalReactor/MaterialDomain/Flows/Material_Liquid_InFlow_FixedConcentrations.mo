within eCherry_Library.ElectrochemicalReactor.MaterialDomain.Flows;
model Material_Liquid_InFlow_FixedConcentrations
  "Auxiliary model prescribing fixed concentrations for Material_Liquid"

  // Species handling
  parameter Data.DataRecords.Species.SpeciesRecord specRec(nSpec=0);

  // Input parameters
  parameter Concentration[specRec.nSpec] c;

  // Connectors
  Connectors.Material_Liquid diffFlow(specRec=specRec) annotation (Placement(
        transformation(extent={{0,100},{20,120}}), iconTransformation(extent={{
            -20,80},{20,120}})));

equation

  for k in 1:specRec.nSpec loop
    c[k] = diffFlow.c[k];
  end for;

  annotation (Icon(graphics={Bitmap(
          extent={{-108,-100},{106,100}},
          fileName="modelica://eCherry_Library/../Icons/Arrow.png")}));
end Material_Liquid_InFlow_FixedConcentrations;
