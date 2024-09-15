within eCherry_Library.ElectrochemicalReactor.Electrolytes.Liquid;
model Electrolyte_Batch_1D_L_nLayers
  "Compartment with diffusive transport in one dimension"
  //   To be finished
  import eCherry_Library.ElectrochemicalReactor.Utility.get_diffusion_distances;
  parameter Data.DataRecords.Species.SpeciesRecord specRec(nSpec=0);
  parameter Data.DataRecords.Geometry GeoRec;
  parameter Data.DataRecords.Conditions CondRec;
  parameter Length X_difflayer "the total width of all layers, along discretization direction";
  parameter Length Y=GeoRec.Y "perpendicular to discretization direction";
  parameter Length Z=GeoRec.Z "perpendicular to discretization direction";

  parameter Integer n_slices(min=2)=10 "number of finite volume cells (discretization)";
  parameter Concentration c0[specRec.nSpec] "initial concentrations";
  parameter Conductivity kappa_con = 80
      "constant default conductivity of electrolyte";

  //geometry
  parameter Length dXs[n_slices]= fill(X_difflayer/n_slices,n_slices) "the width of each small layer";
  parameter Length diff_distances[n_slices-1]=get_diffusion_distances(dXs) "the distance between the centers of two adjacent elements";

  MaterialDomain.ConnectionLayers.ConnectionLayer_Diffusive diffConneL[n_slices
     - 1](
    each specRec=specRec,
    each GeoRec=GeoRec,
    each Y=Y,
    each Z=Z,
    dX=diff_distances);

  Electrolyte_Batch_0D_L slices[n_slices](
    X=dXs,
    each specRec=specRec,
    each GeoRec=GeoRec,
    each Y=Y,
    each Z=Z,
    each CondRec=CondRec,
    each c0=c0,
    each kappa_const=kappa_con);

  Modelica.Electrical.Analog.Interfaces.PositivePin p "Positive electrical pin"
  annotation (Placement(
        transformation(extent={{-110,-10},{-90,10}})));
  Modelica.Electrical.Analog.Interfaces.NegativePin n "Negative electrical pin" annotation (Placement(transformation(extent={{
            110,-10},{90,10}})));
  MaterialDomain.Connectors.Material_Liquid leftFlow(specRec=specRec)
    annotation (Placement(transformation(extent={{-100,60},{-80,80}}),
        iconTransformation(extent={{-120,40},{-80,80}})));
  MaterialDomain.Connectors.Material_Liquid rightFlow(specRec=specRec)
    annotation (Placement(transformation(extent={{90,50},{110,70}}),
        iconTransformation(extent={{80,40},{120,80}})));
equation
  // connecting the material flows
    for i in 1:n_slices-1 loop
    connect(slices[i].rightFlow, diffConneL[i].leftFlow) "a";
    connect(diffConneL[i].rightFlow, slices[i+1].leftFlow) "a";
  end for;
  connect(slices[1].leftFlow, leftFlow);
  connect(slices[end].rightFlow, rightFlow);

  // connecting the equivalent circuits
  for i in 1:n_slices-1 loop
    connect(slices[i].p, slices[i+1].n) "a";
  end for;
    connect(p, slices[1].p)
    annotation (Line(points={{-100,0},{-46,0}}, color={0,0,255}));
    connect(slices[end].n, n)
    annotation (Line(points={{46,0},{100,0}}, color={0,0,255}));

  connect(rightFlow, rightFlow)
    annotation (Line(points={{100,60},{100,60}}, color={0,0,0}));
  connect(leftFlow, leftFlow)
    annotation (Line(points={{-90,70},{-90,70}}, color={0,0,0}));
             annotation (Icon(coordinateSystem(preserveAspectRatio=false), graphics={
          Bitmap(extent={{-102,-100},{104,102}}, fileName=
              "modelica://eCherry_Library/../Icons/nDiscs.png")}),Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end Electrolyte_Batch_1D_L_nLayers;
