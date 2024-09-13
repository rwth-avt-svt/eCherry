within eCherry_Library.ElectrochemicalReactor.Electrodes;
model Electrode_Thermal
  extends eCherry_Library.ElectrochemicalReactor.Electrodes.Electrode;
  extends ThermalDomain.EnergyBalance_base;

  redeclare model TemperatureModel =
      Properties.TemperatureModels.TemperatureVariable                  "Temperature is variale for energy balance";

  // Parameters
  parameter Volume V = EBRec.X_anode*Y*Z "Volume of electrode";
  parameter Area A = Y*Z "Area of electrode";
  parameter ThermalConductance Cthermal_externalHeating = EBRec.alpha_anode_externalHeating*A "Thermal conductance between electrode and externalHeating";
  parameter ThermalConductance Cthermal_electrolyte = EBRec.alpha_anode_electrolyte*A "Thermal conductance between electrode and electrolyte";

equation

  // Calculating total enthalpy of electrode and its derivative for calculation of electrode temperature
  H_tot = EBRec.rho_anode*V*EBRec.cp_anode*(T-Tref);
  QFlow=0;
  HFlow=0;

  // Heat dissipated due to reaction
  WFlow = sum(abs(reactions[i].actOp.v*reactions[i].actOp.i) for i in 1:nReac);

  // Connectors for heat flow
  leftHeatFlow.Q_flow =ThermalDomain.Thermal_Functions.GeneralHeatTransferRate(
    C=Cthermal_externalHeating,
    T1=leftHeatFlow.T,
    T2=T);
  rightHeatFlow.Q_flow =ThermalDomain.Thermal_Functions.GeneralHeatTransferRate(
    C=Cthermal_electrolyte,
    T1=rightHeatFlow.T,
    T2=T);

  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end Electrode_Thermal;
