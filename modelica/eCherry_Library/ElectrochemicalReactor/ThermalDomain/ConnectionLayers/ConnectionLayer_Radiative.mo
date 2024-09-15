within eCherry_Library.ElectrochemicalReactor.ThermalDomain.ConnectionLayers;
model ConnectionLayer_Radiative
  "A layer connecting two compartments via radiation"
  parameter Data.DataRecords.Thermal EBRec;
  parameter Data.DataRecords.Geometry GeoRec;

  // Other parameters
  parameter Length X=GeoRec.X "length of the connection layer";
  parameter Length Y=GeoRec.Y "length of the connection layer";
  parameter Length Z=GeoRec.Y "height of the connection layer";
  parameter Area A = Y*Z;

  // Connectors
  Thermal leftFlow annotation (Placement(transformation(extent={{-110,50},{-90,
            70}}), iconTransformation(extent={{-120,40},{-88,70}})));
  Thermal rightFlow annotation (Placement(transformation(extent={{90,50},{110,
            70}}), iconTransformation(extent={{80,40},{120,80}})));

equation

    // No energy holdup in connection layer; holdup is only in adjacent compartments.
    leftFlow.QFlow_tot + rightFlow.QFlow_tot = 0;
    //heat flow due to radiation
    leftFlow.QFlow_tot = -Modelica.Constants.sigma*A*EBRec.e^(leftFlow.
    T^4 - rightFlow.T^4);

  annotation (Icon(graphics={Bitmap(extent={{-100,-102},{100,100}}, fileName=
              "modelica://eCherry_Library/../Icons/DiffusionLayer.png")}));
end ConnectionLayer_Radiative;
