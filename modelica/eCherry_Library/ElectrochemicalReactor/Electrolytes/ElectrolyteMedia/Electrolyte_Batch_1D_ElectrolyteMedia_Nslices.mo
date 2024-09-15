within eCherry_Library.ElectrochemicalReactor.Electrolytes.ElectrolyteMedia;
model Electrolyte_Batch_1D_ElectrolyteMedia_Nslices
  "Compartment with diffusive transport in one dimension containing the electrolyte media"
  //   To be finished

  import ElectrolyteMedia;
  import eCherry_Library.Data.DataRecords.Species.SpeciesRecord;
  parameter Data.DataRecords.Geometry GeoRec;

  parameter SpeciesRecord specRec;
  parameter Length X=GeoRec.X "total length along discretization direction";
  parameter Length Y=GeoRec.Y "perpendicular to discretization direction";
  parameter Length Z=GeoRec.Z "perpendicular to discretization direction";
  parameter Temperature T "systems temperature";
  parameter Pressure p_system "systems temperature";
  replaceable package Medium =
      ElectrolyteMedia.Media.LiquidPhase.Common.MixtureLiquid                          annotation(choicesAllMatching=true);

  parameter Concentration c0[specRec.nSpec] "initial concentrations";
  parameter Conductivity kappa(start=30);

 //geometry
 parameter Integer n_slices(min=1)=10 "number of finite volume cells (discretization)";
 parameter Real dXs[n_slices]= fill(X*(n_slices+1)/(n_slices^2),n_slices);
 parameter Real diff_distances[n_slices-1]=Utility.ArrayFunctions.get_diffusion_distances( dXs);

  MaterialDomain.ConnectionLayers.ConnectionLayer_Diffusive diffConneL[n_slices
     - 1](
    each specRec=specRec,
    dX=diff_distances,
    each GeoRec=GeoRec,
    each Y=Y,
    each Z=Z);

  Electrolyte_Batch_0D_ElectrolyteMedia slices[n_slices](
    X=dXs,
    each GeoRec=GeoRec,
    each Y=Y,
    each Z=Z,
    each specRec=specRec,
    redeclare package Medium = Medium,
    each Tstart=T,
    each pstart=p_system,
    each c0=c0,
    each T_zero=T,
    each p_zero(displayUnit="Pa") = p_system,
    each kappa=kappa);
  MaterialDomain.Connectors.Material_Liquid leftFlow(specRec=specRec)
    annotation (Placement(transformation(extent={{-110,50},{-90,70}}),
        iconTransformation(extent={{-130,30},{-90,70}})));
  MaterialDomain.Connectors.Material_Liquid rightFlow(specRec=specRec)
    annotation (Placement(transformation(extent={{90,50},{110,70}}),
        iconTransformation(extent={{80,40},{120,80}})));
                    Modelica.Electrical.Analog.Interfaces.PositivePin p "Positive electrical pin"
  annotation (Placement(
        transformation(extent={{-110,-10},{-90,10}})));
  Modelica.Electrical.Analog.Interfaces.NegativePin n "Negative electrical pin" annotation (Placement(transformation(extent={{
            110,-10},{90,10}})));
equation
  for i in 1:n_slices-1 loop
    connect(slices[i].rightFlow, diffConneL[i].leftFlow) "a";
    connect(diffConneL[i].rightFlow, slices[i+1].leftFlow) "a";
  end for;
  connect(slices[1].leftFlow, leftFlow);
  connect(slices[n_slices].rightFlow, rightFlow);

    // connecting the equivalent circuits
  for i in 1:n_slices-1 loop
    connect(slices[i].p, slices[i+1].n) "a";
  end for;
    connect(p, slices[1].p)
    annotation (Line(points={{-100,0},{-46,0}}, color={0,0,255}));
    connect(slices[n_slices].n, n)
    annotation (Line(points={{46,0},{100,0}}, color={0,0,255}));
end Electrolyte_Batch_1D_ElectrolyteMedia_Nslices;
