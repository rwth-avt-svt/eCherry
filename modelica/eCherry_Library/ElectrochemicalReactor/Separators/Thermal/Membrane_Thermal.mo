within eCherry_Library.ElectrochemicalReactor.Separators.Thermal;
model Membrane_Thermal
  extends Membrane;
  extends ThermalDomain.EnergyBalance_Base(V=V_geo,Pr=CondRec.p);

  redeclare model TemperatureModel =
      Properties.TemperatureModels.TemperatureVariable "Temperature is variable for energy balance";

equation

  H_tot = EBRec.rho_membrane*X*Y*Z*EBRec.cp_membrane*(T-Tref);
  QFlow=0;
  HFlow=0;
  WFlow=abs(v*i);

  // Connectors for heat flow
  rightHeatFlow.T = T;
  leftHeatFlow.T = T;

  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end Membrane_Thermal;
