within eCherry_Library.ElectrochemicalReactor.ThermalDomain.ConnectionLayers;
model ConnectionLayer_Convective
  "A layer connecting two compartments via convection"

  parameter ThermalConductance C;

  // Connectors
  Thermal leftFlow annotation (Placement(transformation(extent={{-110,50},{-90,
            70}}), iconTransformation(extent={{-120,40},{-88,70}})));
  Thermal rightFlow annotation (Placement(transformation(extent={{90,50},{110,
            70}}), iconTransformation(extent={{80,40},{120,80}})));

equation

    // No energy holdup in connection layer; holdup is only in adjacent compartments.
    leftFlow.QFlow_tot + rightFlow.QFlow_tot = 0;
    //heat flow due to convection
    leftFlow.QFlow_tot = C*(leftFlow.T-rightFlow.T);

  annotation (Icon(graphics={Bitmap(extent={{-100,-102},{100,100}}, fileName=
              "modelica://eCherry_Library/../Icons/DiffusionLayer.png")}));
end ConnectionLayer_Convective;
