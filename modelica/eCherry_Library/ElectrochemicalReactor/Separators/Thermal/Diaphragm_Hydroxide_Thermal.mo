within eCherry_Library.ElectrochemicalReactor.Separators.Thermal;
model Diaphragm_Hydroxide_Thermal
  extends Diaphragm_Hydroxide;
  extends ThermalDomain.EnergyBalance_Base( V=V_geo,Pr=CondRec.p);

  redeclare model TemperatureModel =
      Properties.TemperatureModels.TemperatureVariable                  "Temperature is variable for energy balance";

  // Parameters
  parameter Volume V_geo = X*Y*Z "Volume of membrane";
  parameter Area A = Y*Z "Area of membrane";
  parameter ThermalConductance Cthermal_anolyte = EBRec.alpha_membrane_anolyte*A "Thermal conductance between membrane and anolyte";
  parameter ThermalConductance Cthermal_catholyte = EBRec.alpha_membrane_catholyte*A "Thermal conductance between membrane and catholyte";

equation

  // Calculating total enthalpy of electrode and its derivative for calculation of membrane temperature
  H_tot = EBRec.rho_membrane*V_geo*EBRec.cp_membrane*(T-Tref);

  // Heat dissipated due to ohmic overpotential
  WFlow = abs(v*i);
  HFlow=0;
  QFlow=0;

  // Connectors for heat flow
  rightHeatFlow.T = T;
  leftHeatFlow.T = T;

  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end Diaphragm_Hydroxide_Thermal;
