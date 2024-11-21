within eCherry_Library.ElectrochemicalReactor.MaterialDomain.Flows;
partial model Material_Simple_InFlow_ResTime_Base
  "Convective inflow with fixed volume flow rate and concentrations"

  // Species handling
  parameter Data.DataRecords.Species.SpeciesRecord specRec;
  parameter Data.DataRecords.Geometry GeoRec;
  parameter Data.DataRecords.Conditions CondRec "needed for inflow temperature T0 (density calc.)";

  // Input parameters
  parameter Integer slices = 1 "number of compartments, 0D -> 1, e.g. 1D -> 100";
  parameter Concentration[specRec.nSpec] c0 "initial concentration in mol/m^3";
  parameter Time t "residence time in whole electrolyzer in s";
  parameter Area A = GeoRec.X*GeoRec.Y "cross section area to inflow";
  parameter Velocity v = GeoRec.Z*slices/t "velocity of gas for given time in electrolyzer, whole length z";
  parameter VolumeFlowRate V_flow = A*v "in m^3/s";

  // variables
  MolarFlowRate molFlow_vec "in mol/s";

  // connector
  Connectors.Material_Simple convFlow(specRec=specRec)
    annotation (Placement(transformation(extent={{-10,90},{10,110}})));

equation

  for i in 1:specRec.nSpec loop
    convFlow.molFlow_vec[i] = - molFlow_vec * c0[i]/sum(c0);
  end for;

  annotation (Icon(graphics={Bitmap(
          extent={{-108,-100},{106,100}},
          fileName="modelica://eCherry_Library/../Icons/Arrow.png")}));
end Material_Simple_InFlow_ResTime_Base;
