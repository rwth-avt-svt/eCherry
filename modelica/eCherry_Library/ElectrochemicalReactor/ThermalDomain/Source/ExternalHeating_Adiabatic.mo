within eCherry_Library.ElectrochemicalReactor.ThermalDomain.Source;
model ExternalHeating_Adiabatic

  // Parameters
  parameter eCherry_Library.Data.DataRecords.Thermal EBRec;
  parameter Temperature T=EBRec.T0externalHeating "Temperature of fluid";

  // Connectors
  Thermal heatFlow
    annotation (Placement(transformation(extent={{-10,90},{10,110}})));

equation
  heatFlow.Q_flow=0;

  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end ExternalHeating_Adiabatic;
