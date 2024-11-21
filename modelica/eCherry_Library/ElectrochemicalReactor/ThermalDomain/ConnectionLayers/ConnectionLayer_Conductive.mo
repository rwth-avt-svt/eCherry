within eCherry_Library.ElectrochemicalReactor.ThermalDomain.ConnectionLayers;
model ConnectionLayer_Conductive
  "A layer connecting two compartments via conduction"

  // Input parameters and records
  parameter Data.DataRecords.Geometry GeoRec;
  parameter ThermalConductivity lambda;
  parameter Boolean useConduction = true;

  parameter Length Y=GeoRec.Y "length of the connection layer";
  parameter Length Z=GeoRec.Y "height of the connection layer";
  parameter Length dX_Thermal=1e-5 "width of connection layer (e.g., average of cell widths of adjacent compartments)";

  //dX would be necessary whenworking with lambda and dX
  //parameter Length dX "width of connection layer (e.g., average of cell widths of adjacent compartments)";

  // Other parameters
  parameter Area A = Y*Z;

  // Connectors
  Thermal leftHeatFlow annotation (Placement(transformation(extent={{-110,50},{-90,
            70}}), iconTransformation(extent={{-120,40},{-88,70}})));
  Thermal rightHeatFlow annotation (Placement(transformation(extent={{90,50},{110,
            70}}), iconTransformation(extent={{80,40},{120,80}})));

equation

    // No energy holdup in connection layer; holdup is only in adjacent compartments.
    leftHeatFlow.Q_flow + rightHeatFlow.Q_flow = 0;
    //heat flow due to conduction
    if useConduction then
      leftHeatFlow.Q_flow = lambda/dX_Thermal*A*(leftHeatFlow.T-rightHeatFlow.T);
    else
      leftHeatFlow.Q_flow = 0;
    end if;

  annotation (Icon(graphics={Bitmap(extent={{-100,-102},{100,100}}, fileName=
              "modelica://eCherry_Library/../Icons/DiffusionLayer.png")}));
end ConnectionLayer_Conductive;
