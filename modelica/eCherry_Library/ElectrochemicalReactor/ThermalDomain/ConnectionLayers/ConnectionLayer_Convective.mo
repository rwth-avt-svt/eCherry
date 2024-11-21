within eCherry_Library.ElectrochemicalReactor.ThermalDomain.ConnectionLayers;
model ConnectionLayer_Convective
  "A layer connecting two compartments via convection"

  parameter Data.DataRecords.Geometry GeoRec;
  parameter CoefficientOfHeatTransfer alpha=0;
  parameter ThermalConductance C=alpha*A;
  parameter Length Y=GeoRec.Y "length of the connection layer";
  parameter Length Z=GeoRec.Y "height of the connection layer";
  parameter Area A = Y*Z;
  parameter Boolean useConvection = true;

  // Connectors
  Thermal leftHeatFlow annotation (Placement(transformation(extent={{-110,50},{-90,
            70}}), iconTransformation(extent={{-120,40},{-88,70}})));
  Thermal rightHeatFlow annotation (Placement(transformation(extent={{90,50},{110,
            70}}), iconTransformation(extent={{80,40},{120,80}})));

equation

    // No energy holdup in connection layer; holdup is only in adjacent compartments.
    leftHeatFlow.Q_flow + rightHeatFlow.Q_flow = 0;
    //heat flow due to convection
    if useConvection then
      leftHeatFlow.Q_flow = C*(leftHeatFlow.T-rightHeatFlow.T);
    else
      leftHeatFlow.Q_flow = 0;
    end if;

  annotation (Icon(graphics={Bitmap(extent={{-100,-102},{100,100}}, fileName=
              "modelica://eCherry_Library/../Icons/DiffusionLayer.png")}));
end ConnectionLayer_Convective;
