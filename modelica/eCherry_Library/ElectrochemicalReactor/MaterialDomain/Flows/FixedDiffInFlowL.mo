within eCherry_Library.ElectrochemicalReactor.MaterialDomain.Flows;
model FixedDiffInFlowL
  "Diffusive inflow with fixed molar flow rates and concentrations"

  // Species handling
  parameter Data.DataRecords.Species.SpeciesRecord specRec(nSpec=0);

  // Input parameters
  parameter Concentration[specRec.nSpec] c;
  parameter MolarFlowRate[specRec.nSpec] molFlow_vec;

  // Connectors
  Connectors.Material_Liquid diffFlow(specRec=specRec) annotation (Placement(
        transformation(extent={{0,100},{20,120}}), iconTransformation(extent={{
            -20,80},{20,120}})));

equation

  for k in 1:specRec.nSpec loop
    c[k] = diffFlow.c[k];
    molFlow_vec[k] = -diffFlow.molFlow_vec[k];
  end for;

  annotation (Icon(graphics={Bitmap(
          extent={{-108,-100},{106,100}},
          fileName="modelica://eCherry_Library/../Icons/Arrow.png")}));
end FixedDiffInFlowL;
