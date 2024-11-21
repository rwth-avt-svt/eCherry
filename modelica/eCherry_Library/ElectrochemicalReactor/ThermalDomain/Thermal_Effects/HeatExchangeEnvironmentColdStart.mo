within eCherry_Library.ElectrochemicalReactor.ThermalDomain.Thermal_Effects;
model HeatExchangeEnvironmentColdStart
    HeatFlowRate QFlow_housing;
    Heat Qhousing "Sum of heat dissipating from the housing";
//     HeatFlowRate QFlow_housing_convection;
//     HeatFlowRate QFlow_housing_radiation;
  /*inner Radiation RadModel(
    T=T,
    EBRec=EBRec,
    GeoRec=GeoRec,
    CondRec=CondRec);
  inner Convection ConvModel(
    T=T,
    EBRec=EBRec,
    GeoRec=GeoRec,
    CondRec=CondRec);*/

 input Temperature T;

 inner parameter Data.DataRecords.Geometry GeoRec;
 inner parameter Data.DataRecords.Conditions CondRec;
 inner parameter Length X=GeoRec.X "along discretization direction";
 inner parameter Length Y=GeoRec.Y "perpendicular to discretization direction";
 inner parameter Length Z=GeoRec.Z "perpendicular to discretization direction";
 inner parameter Data.DataRecords.Thermal EBRec;

 HeatFlowRate QFlow_housing_convection;
 HeatFlowRate QFlow_housing_radiation;

initial equation
Qhousing=0;

equation

 QFlow_housing_convection = -Modelica.Constants.sigma*2*Modelica.Constants.pi*0.92*X*1.32*1* (T^4-EBRec.Tenvironment_housing^4);
 QFlow_housing_radiation = -2*Modelica.Constants.pi*0.92*X*1.32*((T-EBRec.Tenvironment_housing)/1.84)^0.25*(T-EBRec.Tenvironment_housing);

    //Heat dissipated from housing due to convection and radiation
  QFlow_housing = QFlow_housing_convection + QFlow_housing_radiation;
  der(Qhousing) = QFlow_housing;

  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end HeatExchangeEnvironmentColdStart;
