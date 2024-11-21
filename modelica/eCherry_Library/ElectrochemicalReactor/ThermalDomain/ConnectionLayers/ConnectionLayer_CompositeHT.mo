within eCherry_Library.ElectrochemicalReactor.ThermalDomain.ConnectionLayers;
model ConnectionLayer_CompositeHT
  "A layer connecting two compartments via conduction"

  // Species handling
  //parameter Data.DataRecords.Species.SpeciesRecord specRec(nSpec=0);
  parameter Data.DataRecords.Geometry GeoRec;
  //parameter Data.DataRecords.Thermal EBRec;

  // Input parameters
  parameter Length Y=GeoRec.Y "length of the connection layer";
  parameter Length Z=GeoRec.Z "height of the connection layer";
  parameter Length dX_Thermal=1e-5 "width of connection layer (e.g., average of cell widths of adjacent compartments)";

  // Other parameters
  parameter Area A = Y*Z;

  parameter ThermalConductance C=alpha*A "Can also be utilized to directly set a thermal conductance for convection";
  parameter CoefficientOfHeatTransfer alpha=0;
  parameter ThermalConductivity lambda=0;
  parameter Real epsilon1=1;
  parameter Real epsilon2=1;

  parameter Boolean useConvection = false "= true, if convection should be enabled" annotation(Evaluate=true, HideResult=false, choices(checkBox=true));
  parameter Boolean useConduction = false "= true, if conduction should be enabled" annotation(Evaluate=true, HideResult=false, choices(checkBox=true));
  parameter Boolean useRadiation = false "= true, if radiation should be enabled" annotation(Evaluate=true, HideResult=false, choices(checkBox=true));

  // Connectors
  Thermal leftHeatFlow annotation (Placement(transformation(extent={{-110,-50},
            {-90,-30}})));
  Thermal rightHeatFlow annotation (Placement(transformation(extent={{90,-50},{
            110,-30}})));

  ConnectionLayer_Convective convectiveConnectionLayer(
    useConvection=useConvection,
    GeoRec=GeoRec,
    C=C) annotation (Placement(transformation(extent={{-10,40},{10,60}})));
  ConnectionLayer_Conductive conductiveConnectionLayer(
    useConduction=useConduction,
    GeoRec=GeoRec,
    lambda=lambda,
    dX_Thermal=dX_Thermal)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}})));
  ConnectionLayer_Radiative radiativeConnectionLayer(
    useRadiation=useRadiation,
    GeoRec=GeoRec,
    epsilon1=epsilon1,
    epsilon2=epsilon2)
    annotation (Placement(transformation(extent={{-10,-60},{10,-40}})));
equation

  connect(leftHeatFlow, convectiveConnectionLayer.leftHeatFlow) annotation (Line(points={{-100,
          -40},{-16,-40},{-16,55.5},{-10.4,55.5}},     color={0,0,0}));
  connect(leftHeatFlow, conductiveConnectionLayer.leftHeatFlow) annotation (Line(points={{-100,
          -40},{-16,-40},{-16,5.5},{-10.4,5.5}},     color={0,0,0}));
  connect(leftHeatFlow, radiativeConnectionLayer.leftHeatFlow) annotation (Line(points={{-100,
          -40},{-16,-40},{-16,-44.5},{-10.4,-44.5}},     color={0,0,0}));
  connect(rightHeatFlow, convectiveConnectionLayer.rightHeatFlow) annotation (Line(
        points={{100,-40},{18,-40},{18,56},{10,56}},
                                                   color={0,0,0}));
  connect(rightHeatFlow, conductiveConnectionLayer.rightHeatFlow)
    annotation (Line(points={{100,-40},{18,-40},{18,6},{10,6}},
                                                              color={0,0,0}));
  connect(rightHeatFlow, radiativeConnectionLayer.rightHeatFlow) annotation (Line(
        points={{100,-40},{18,-40},{18,-44},{10,-44}},
                                                     color={0,0,0}));
  annotation (Icon(graphics={Bitmap(extent={{-100,-102},{100,100}}, fileName=
              "modelica://eCherry_Library/../Icons/DiffusionLayer.png")}));
end ConnectionLayer_CompositeHT;
