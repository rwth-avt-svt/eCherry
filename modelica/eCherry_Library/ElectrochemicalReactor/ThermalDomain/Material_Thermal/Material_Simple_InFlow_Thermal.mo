within eCherry_Library.ElectrochemicalReactor.ThermalDomain.Material_Thermal;
model Material_Simple_InFlow_Thermal
  extends
    eCherry_Library.ElectrochemicalReactor.MaterialDomain.Flows.Material_Simple_InFlow_Fixed;

  // Parameters
  parameter Data.DataRecords.Thermal EBRec;
  parameter Temperature T = EBRec.T0convectiveInflow;

  // Variables
  HeatFlowRate QFlow_in;

  // Connectors
  Thermal convHeatFlow
    annotation (Placement(transformation(extent={{-60,100},{-40,120}})));
equation

  convHeatFlow.T = T;
  convHeatFlow.Q_flow = QFlow_in;

  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end Material_Simple_InFlow_Thermal;
