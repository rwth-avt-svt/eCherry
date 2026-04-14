within eCherry_Library.ElectrochemicalReactor.ThermalDomain.Thermal_Effects;
model HeatExchangeEnvironment
    HeatFlowRate QFlow_housing;
    Heat Qhousing "Sum of heat dissipating from the housing";
//     HeatFlowRate QFlow_housing_convection;
//     HeatFlowRate QFlow_housing_radiation;

 input Temperature T;

 inner parameter Data.DataRecords.Geometry GeoRec;
 inner parameter Data.DataRecords.Conditions CondRec;
  parameter Integer slices = 1 "number of compartements / discretisation steps";
  parameter Length X=GeoRec.X "along discretization direction";
  parameter Length Y=GeoRec.Y "perpendicular to discretization direction";
  parameter Length Z=GeoRec.Z/slices "perpendicular to discretization direction";
 inner parameter Data.DataRecords.Thermal EBRec;

protected
  inner Radiation RadModel(
    T=T,
    EBRec=EBRec,
    GeoRec=GeoRec,
    CondRec=CondRec);
  inner Convection ConvModel(
    T=T,
    EBRec=EBRec,
    GeoRec=GeoRec,
    CondRec=CondRec);

initial equation
Qhousing=0;

equation
    //Heat dissipated from housing due to convection and radiation
  QFlow_housing = ConvModel.QFlow_housing_convection + RadModel.QFlow_housing_radiation;
  der(Qhousing) = QFlow_housing;

  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end HeatExchangeEnvironment;
