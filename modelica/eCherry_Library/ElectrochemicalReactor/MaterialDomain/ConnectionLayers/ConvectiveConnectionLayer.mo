within eCherry_Library.ElectrochemicalReactor.MaterialDomain.ConnectionLayers;
model ConvectiveConnectionLayer
  "A layer connecting two compartments by convection (via flow parallel to layer, not through layer!)"

  // Species handling
  parameter Data.DataRecords.Species.SpeciesRecord specRec(nSpec=0);

  // Input parameters
  parameter Length Y "length of the connection layer";
  parameter Length Z "height of the connection layer";
  parameter Properties.MassTransferCoefficient h
    "in (mol/s)/(m^2*mol/m^3) = m/s";

  // Other parameters
  parameter Area A = Y*Z;

  // Connectors:
  Connectors.Material_Liquid leftFlow(specRec=specRec)
    annotation (Placement(transformation(extent={{-110,-10},{-90,10}})));
  Connectors.Material_Liquid rightFlow(specRec=specRec)
    annotation (Placement(transformation(extent={{92,-10},{112,10}})));
equation

  for k in 1:specRec.nSpec loop

    // Mole balance:
    // No molar holdup in connection layer; holdup is only in adjacent compartments.
    leftFlow.molFlow_vec[k] + rightFlow.molFlow_vec[k] = 0;

    // Mass transfer by convection between the two connectors
    leftFlow.molFlow_vec[k] = A * h * (leftFlow.c[k] - rightFlow.c[k]);

  end for;

    annotation (Icon(graphics={Bitmap(extent={{-100,-102},{100,100}}, fileName=
              "modelica://eCherry_Library/../Icons/DiffusionLayer.png")}));
end ConvectiveConnectionLayer;
