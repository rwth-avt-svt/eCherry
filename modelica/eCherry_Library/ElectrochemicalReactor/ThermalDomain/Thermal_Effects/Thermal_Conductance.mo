within eCherry_Library.ElectrochemicalReactor.ThermalDomain.Thermal_Effects;
model Thermal_Conductance
ThermalConductance Cthermal_housing;
 inner parameter Data.DataRecords.Geometry GeoRec;
 inner parameter Length X=GeoRec.X "along discretization direction";
 inner parameter Length Y=GeoRec.Y "perpendicular to discretization direction";
 inner parameter Length Z=GeoRec.Z "perpendicular to discretization direction";
 inner parameter Data.DataRecords.Thermal EBRec;

equation

  // Thermal conductance of housing
  Cthermal_housing =Thermal_Functions.ThermalConductance_Pipe(
    alpha_a=EBRec.alpha_housing_environment,
    alpha_i=EBRec.alpha_housing_electrolyte,
    lambda=EBRec.lambda_housing,
    delta=EBRec.delta_housing,
    X=X,
    Y=Y,
    Z=Z);
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end Thermal_Conductance;
