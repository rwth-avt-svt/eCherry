within eCherry_Library.ElectrochemicalReactor.Separators.Thermal;
model Membrane_Thermal
  extends Membrane;
  extends ThermalDomain.EnergyBalance_Base;

  redeclare model TemperatureModel =
      Properties.TemperatureModels.TemperatureVariable "Temperature is variable for energy balance";

equation

  H_tot = EBRec.rho_membrane*X*Y*Z*EBRec.cp_membrane*(T-Tref);
  QFlow=0;
  HFlow=0;
  WFlow=abs(v*i);

  // Connectors for heat flow
  leftHeatFlow.Q_flow =ThermalDomain.Thermal_Functions.GeneralHeatTransferRate(
    C=EBRec.alpha_membrane_anolyte*Y*Z,
    T1=leftHeatFlow.T,
    T2=T);
  rightHeatFlow.Q_flow =ThermalDomain.Thermal_Functions.GeneralHeatTransferRate(
    C=EBRec.alpha_membrane_catholyte*Y*Z,
    T1=rightHeatFlow.T,
    T2=T);

  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end Membrane_Thermal;
