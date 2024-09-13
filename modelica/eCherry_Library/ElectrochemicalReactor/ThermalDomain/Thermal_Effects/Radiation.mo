within eCherry_Library.ElectrochemicalReactor.ThermalDomain.Thermal_Effects;
model Radiation
HeatFlowRate QFlow_housing_radiation;
input Temperature T;

 inner parameter Data.DataRecords.Geometry GeoRec;
 inner parameter Data.DataRecords.Conditions CondRec;
 inner parameter Length X=GeoRec.X "along discretization direction";
 inner parameter Length Y=GeoRec.Y "perpendicular to discretization direction";
 inner parameter Length Z=GeoRec.Z "perpendicular to discretization direction";
 inner parameter Data.DataRecords.Thermal EBRec;

equation

 // For consitancy, housing area of reactor also assumed as pipe
 QFlow_housing_radiation = -Modelica.Constants.sigma*(Modelica.Constants.pi*(((Y*Z)/Modelica.Constants.pi)^(0.5)+EBRec.delta_housing)*X)*EBRec.e*(T^4-CondRec.Tenvironment^4);
 annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
       coordinateSystem(preserveAspectRatio=false)));
end Radiation;
