within eCherry_Library.ElectrochemicalReactor.ThermalDomain.ConnectionLayers;
model ConnectionLayer_Radiative
  "A layer connecting two compartments via radiation"
  parameter Data.DataRecords.Geometry GeoRec;

  //if grey plates are assumed emmisivity smaller than 1, but in general black plates assumed
  parameter Real epsilon1=1;
  parameter Real epsilon2=1;
  parameter Boolean useRadiation = true;

  // Other parameters
  parameter Length Y=GeoRec.Y "length of the connection layer";
  parameter Length Z=GeoRec.Z "length of the connection layer";
  parameter Area A = Y*Z;

  //We assume no distance between radiative plates
  //parameter Length Z=GeoRec.Y "height of the connection layer";

  // Connectors
  Thermal leftHeatFlow annotation (Placement(transformation(extent={{-110,50},{-90,
            70}}), iconTransformation(extent={{-120,40},{-88,70}})));
  Thermal rightHeatFlow annotation (Placement(transformation(extent={{90,50},{110,
            70}}), iconTransformation(extent={{80,40},{120,80}})));

equation

    // No energy holdup in connection layer; holdup is only in adjacent compartments.
    leftHeatFlow.Q_flow + rightHeatFlow.Q_flow = 0;
    //heat flow due to radiation
    //leftFlow.QFlow_tot = -Modelica.Constants.sigma*A*EBRec.e^(leftFlow.T^4 - rightFlow.T^4);
    //Formular for infinitely large grey plates (corresponds to grey plates with no distance in between)
    if useRadiation then
      leftHeatFlow.Q_flow = 1/(1/epsilon1+1/epsilon2-1)*Modelica.Constants.sigma*A*(leftHeatFlow.T^4 - rightHeatFlow.T^4);
    else
      leftHeatFlow.Q_flow = 0;
    end if;

  annotation (Icon(graphics={Bitmap(extent={{-100,-102},{100,100}}, fileName=
              "modelica://eCherry_Library/../Icons/DiffusionLayer.png")}));
end ConnectionLayer_Radiative;
