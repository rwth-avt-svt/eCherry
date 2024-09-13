within eCherry_Library.ElectrochemicalReactor.Separators.Thermal;
model DiaphragmHydroxide_Thermal
  extends DiaphragmHydroxide;
  extends ThermalDomain.EnergyBalance_base;

  redeclare model TemperatureModel =
      Properties.TemperatureModels.TemperatureVariable                  "Temperature is variable for energy balance";

  // Parameters
  parameter Volume V = X*Y*Z "Volume of membrane";
  parameter Area A = Y*Z "Area of membrane";
  parameter ThermalConductance Cthermal_anolyte = EBRec.alpha_membrane_anolyte*A "Thermal conductance between membrane and anolyte";
  parameter ThermalConductance Cthermal_catholyte = EBRec.alpha_membrane_catholyte*A "Thermal conductance between membrane and catholyte";

equation

  // Calculating total enthalpy of electrode and its derivative for calculation of membrane temperature
  H_tot = EBRec.rho_membrane*V*EBRec.cp_membrane*(T-Tref);

  // Heat dissipated due to ohmic overpotential
  WFlow = abs(v*i);
  HFlow=0;
  QFlow=0;

  // Connectors for heat flow
  leftHeatFlow.Q_flow =ThermalDomain.Thermal_Functions.GeneralHeatTransferRate(
    C=Cthermal_anolyte,
    T1=leftHeatFlow.T,
    T2=T);
  rightHeatFlow.Q_flow =ThermalDomain.Thermal_Functions.GeneralHeatTransferRate(
    C=Cthermal_catholyte,
    T1=rightHeatFlow.T,
    T2=T);

  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end DiaphragmHydroxide_Thermal;
