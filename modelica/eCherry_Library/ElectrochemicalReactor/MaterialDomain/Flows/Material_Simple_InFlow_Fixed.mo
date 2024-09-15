within eCherry_Library.ElectrochemicalReactor.MaterialDomain.Flows;
model Material_Simple_InFlow_Fixed
  "Convective inflow with fixed volume flow rate and concentrations"

  // Species handling
  parameter Data.DataRecords.Species.SpeciesRecord specRec(nSpec=0);

  // Input parameters
   parameter MolarFlowRate[specRec.nSpec] molFlow_vec=zeros(specRec.nSpec);

  // Connectors
  Connectors.Material_Simple convFlow(specRec=specRec) annotation (Placement(
        transformation(extent={{0,100},{20,120}}), iconTransformation(extent={{
            -20,80},{20,120}})));
equation
  molFlow_vec = -convFlow.molFlow_vec;

  annotation (Icon(graphics={Bitmap(
          extent={{-108,-100},{106,100}},
          fileName="modelica://eCherry_Library/../Icons/Arrow.png")}));
end Material_Simple_InFlow_Fixed;
