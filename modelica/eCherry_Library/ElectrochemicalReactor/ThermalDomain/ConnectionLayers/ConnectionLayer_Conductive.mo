within eCherry_Library.ElectrochemicalReactor.ThermalDomain.ConnectionLayers;
model ConnectionLayer_Conductive
  "A layer connecting two compartments via conduction"

  // Species handling
  parameter Data.DataRecords.Species.SpeciesRecord specRec(nSpec=0);
  parameter Data.DataRecords.Geometry GeoRec;
  parameter CoefficientOfHeatTransfer alpha;

  // Input parameters
  parameter Length Y=GeoRec.Y "length of the connection layer";
  parameter Length Z=GeoRec.Y "height of the connection layer";
  parameter Length dX "width of connection layer (e.g., average of cell widths of adjacent compartments)";

  // Other parameters
  parameter Area A = Y*Z;

  // Connectors
  Thermal leftFlow annotation (Placement(transformation(extent={{-110,50},{-90,
            70}}), iconTransformation(extent={{-120,40},{-88,70}})));
  Thermal rightFlow annotation (Placement(transformation(extent={{90,50},{110,
            70}}), iconTransformation(extent={{80,40},{120,80}})));

equation

    // No energy holdup in connection layer; holdup is only in adjacent compartments.
    leftFlow.QFlow_tot + rightFlow.QFlow_tot = 0;
    //heat flow due to conduction
    leftFlow.QFlow_tot = alpha*A*(leftFlow.T-rightFlow.T);

  annotation (Icon(graphics={Bitmap(extent={{-100,-102},{100,100}}, fileName=
              "modelica://eCherry_Library/../Icons/DiffusionLayer.png")}));
end ConnectionLayer_Conductive;
