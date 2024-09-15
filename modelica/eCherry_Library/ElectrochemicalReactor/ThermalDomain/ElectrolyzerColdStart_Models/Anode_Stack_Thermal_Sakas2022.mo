within eCherry_Library.ElectrochemicalReactor.ThermalDomain.ElectrolyzerColdStart_Models;
model Anode_Stack_Thermal_Sakas2022
  extends Anode_Sakas2022;
  extends EnergyBalance_Base;

  redeclare model TemperatureModel =
      Properties.TemperatureModels.TemperatureVariable "Temperature is variale for energy balance";

  // Parameters
  parameter Volume V = EBRec.X_anode*Y*Z "Volume of electrode";
  parameter Area A = Y*Z "Area of electrode";
  parameter ThermalConductance Cthermal_electrolyte = EBRec.alpha_anode_electrolyte*A "Thermal conductance between electrode and electrolyte";

equation

  // Calculating total enthalpy of electrode and its derivative for calculation of electrode temperature
  H_tot = EBRec.rho_anode*V*EBRec.cp_anode*(T-Tref);
  QFlow =0;
  HFlow=0;
  WFlow = abs(sum(reactions[i].actOp.v for i in 1:nReac)*p.i);

  // Connector for heat flow
  rightHeatFlow.Q_flow =Thermal_Functions.GeneralHeatTransferRate(
    C=Cthermal_electrolyte,
    T1=rightHeatFlow.T,
    T2=T);
    leftHeatFlow.T = T;

  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end Anode_Stack_Thermal_Sakas2022;
