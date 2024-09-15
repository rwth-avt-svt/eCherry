within eCherry_Library.ElectrochemicalReactor.ThermalDomain.ElectrolyzerColdStart_Models;
model Cathode_Stack_Thermal_Sakas2022
  extends Cathode_Sakas2022;
  extends EnergyBalance_Base;

  redeclare model TemperatureModel =
      Properties.TemperatureModels.TemperatureVariable "Temperature is variale for energy balance";

  // Parameters
  parameter Volume V = EBRec.X_cathode*Y*Z "Volume of electrode";
  parameter Area A = Y*Z "Area of electrode";
  parameter ThermalConductance Cthermal_electrolyte = EBRec.alpha_cathode_electrolyte*A "Thermal conductance between electrode and electrolyte";

equation

  // Calculating total enthalpy of electrode and its derivative for calculation of electrode temperature
  H_tot = EBRec.rho_cathode*V*EBRec.cp_cathode*(T-Tref);
  QFlow=0;
  HFlow=0;
  WFlow = abs(sum(reactions[i].actOp.v for i in 1:nReac)*p.i);

  // Connectors for heat flow
  leftHeatFlow.Q_flow =Thermal_Functions.GeneralHeatTransferRate(
    C=Cthermal_electrolyte,
    T1=leftHeatFlow.T,
    T2=T);
    rightHeatFlow.T = T;

  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end Cathode_Stack_Thermal_Sakas2022;
