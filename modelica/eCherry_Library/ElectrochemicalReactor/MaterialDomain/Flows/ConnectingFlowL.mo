within eCherry_Library.ElectrochemicalReactor.MaterialDomain.Flows;
model ConnectingFlowL
  "Convective inflow with fixed volume flow rate and concentrations"

  // Species handling
  parameter Data.DataRecords.Species.SpeciesRecord specRec(nSpec=0);

  // Connectors
  Connectors.Material_Simple convoutFlow(specRec=specRec) annotation (Placement(
        transformation(extent={{0,100},{20,120}}), iconTransformation(extent={{
            -20,80},{20,120}})));
                                  //in and out are seen in relation to this flow object
  Connectors.Material_Simple convinFlow(specRec=specRec) annotation (Placement(
        transformation(extent={{0,-100},{20,-80}}), iconTransformation(extent={
            {-20,-120},{20,-80}})));
                                     //in is thus the flow going into this flow object
equation

  zeros(specRec.nSpec)=convinFlow.molFlow_vec+ convoutFlow.molFlow_vec;

    annotation (Icon(graphics={Bitmap(
          extent={{-108,-100},{106,100}},
          fileName="modelica://eCherry_Library/../Icons/Arrow.png")}));
end ConnectingFlowL;
