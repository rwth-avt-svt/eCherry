within eCherry_Library.ElectrochemicalReactor.ThermalDomain;
partial model EnergyBalance_base

  parameter Temperature Tref = 298.15 "Refrence temperature for calculation of heat capacity";
  inner parameter Pressure P=10^5;
  inner parameter Volume V_geo=1;
  inner parameter Data.DataRecords.Thermal EBRec;

// Variables
  Enthalpy H_tot "Total enthalpy of system";
  InternalEnergy U_tot "Total inner energy of system";
  HeatFlowRate QFlow "Heat flow entering the system";
  EnthalpyFlowRate HFlow "Enthalpy flow entering the system";
  Power WFlow "Work flow entering the system";
  replaceable model TemperatureModel =
      Properties.TemperatureModels.TemperatureConstant
   annotation(choices(
    choice=Thermodynamics.TemperatureConstant
    "Constant Temperature",
    choice=Thermodynamics.TemperatureVariable
    "Variable Temperature"));

  // Connectors
  Thermal leftHeatFlow
    annotation (Placement(transformation(extent={{-110,-56},{-90,-36}})));
  Thermal rightHeatFlow
    annotation (Placement(transformation(extent={{90,-56},{110,-36}})));

equation
   U_tot = H_tot- P*V_geo;
   der(U_tot) = leftHeatFlow.Q_flow+ rightHeatFlow.Q_flow +QFlow + HFlow + WFlow;

  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end EnergyBalance_base;
