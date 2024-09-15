within eCherry_Library.ElectrochemicalReactor.ThermalDomain.Source;
model ExternalHeating_TFixed

  // Parameters
  parameter Data.DataRecords.Thermal EBRec;
  parameter Temperature T=EBRec.T0externalHeating "Applied Temperature";

  // Connectors
  Thermal heatFlow
    annotation (Placement(transformation(extent={{-10,90},{10,110}})));

equation

  //Set temperature for calculation of heatflowrate between externalHeating and electrode
  heatFlow.T=T;

  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end ExternalHeating_TFixed;
