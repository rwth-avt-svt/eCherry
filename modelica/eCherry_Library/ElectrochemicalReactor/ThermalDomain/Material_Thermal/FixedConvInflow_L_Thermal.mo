within eCherry_Library.ElectrochemicalReactor.ThermalDomain.Material_Thermal;
model FixedConvInflow_L_Thermal
  extends
    eCherry_Library.ElectrochemicalReactor.MaterialDomain.Flows.FixedConvInFlowL;

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
end FixedConvInflow_L_Thermal;
