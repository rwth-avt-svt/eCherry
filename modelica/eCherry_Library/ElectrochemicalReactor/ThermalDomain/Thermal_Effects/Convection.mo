within eCherry_Library.ElectrochemicalReactor.ThermalDomain.Thermal_Effects;
model Convection
  HeatFlowRate QFlow_housing_convection;
  input Temperature T;
  ThermalConductance Cthermal_housing "Thermal conductance of housing";
  Thermal_Effects.Thermal_Conductance C(GeoRec=GeoRec, EBRec=EBRec);

 inner parameter Data.DataRecords.Geometry GeoRec;
 inner parameter Data.DataRecords.Conditions CondRec;
 inner parameter Length X=GeoRec.X "along discretization direction";
 inner parameter Length Y=GeoRec.Y "perpendicular to discretization direction";
 inner parameter Length Z=GeoRec.Z "perpendicular to discretization direction";
 inner parameter Data.DataRecords.Thermal EBRec;

equation
Cthermal_housing = C.Cthermal_housing;
QFlow_housing_convection = Cthermal_housing*(CondRec.Tenvironment-T);

  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end Convection;
