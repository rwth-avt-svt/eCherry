within eCherry_Library.ElectrochemicalReactor.ThermalDomain;
connector Thermal "Connector for heat transfer between models"
  extends Modelica.Thermal.HeatTransfer.Interfaces.HeatPort;
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end Thermal;
