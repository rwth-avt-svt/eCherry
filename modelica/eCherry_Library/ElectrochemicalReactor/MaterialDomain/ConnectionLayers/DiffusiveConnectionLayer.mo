within eCherry_Library.ElectrochemicalReactor.MaterialDomain.ConnectionLayers;
model DiffusiveConnectionLayer
  "A layer connecting two compartments via diffusion"

  // Species handling
  parameter Data.DataRecords.Species.SpeciesRecord specRec(nSpec=0);
  parameter Data.DataRecords.Geometry GeoRec;

  // Input parameters
  parameter Length Y=GeoRec.Y "length of the connection layer";
  parameter Length Z=GeoRec.Y "height of the connection layer";
  parameter Length dX "width of connection layer (e.g., average of cell widths of adjacent compartments)";

  // Other parameters
  parameter Area A = Y*Z;

  // Connectors
  Connectors.Material_Liquid leftFlow(specRec=specRec) annotation (Placement(
        transformation(extent={{-110,50},{-90,70}}), iconTransformation(extent=
            {{-120,40},{-88,70}})));
  Connectors.Material_Liquid rightFlow(specRec=specRec) annotation (Placement(
        transformation(extent={{90,50},{110,70}}), iconTransformation(extent={{
            80,40},{120,80}})));

equation

  for k in 1:specRec.nSpec loop

    // Mole balance:
    // No molar holdup in connection layer; holdup is only in adjacent compartments.
    leftFlow.molFlow_vec[k] + rightFlow.molFlow_vec[k] = 0;

    // 1st Fick's law for diffusion between the two connectors
    leftFlow.molFlow_vec[k] = A * specRec.species[k].D * (leftFlow.c[k] - rightFlow.c[k]) / dX;
  end for;

  annotation (Icon(graphics={Bitmap(extent={{-100,-102},{100,100}}, fileName=
              "modelica://eCherry_Library/../Icons/DiffusionLayer.png")}));
end DiffusiveConnectionLayer;
