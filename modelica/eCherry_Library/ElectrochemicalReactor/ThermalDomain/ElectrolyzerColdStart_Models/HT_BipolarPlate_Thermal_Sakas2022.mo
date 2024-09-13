within eCherry_Library.ElectrochemicalReactor.ThermalDomain.ElectrolyzerColdStart_Models;
model HT_BipolarPlate_Thermal_Sakas2022
  // Parameters
  parameter eCherry_Library.Data.DataRecords.Thermal EBRec;
  parameter ThermalConductance Cthermal_BipolarPlate=100000 "Thermal conductance of electrolyte";

  // Connectors
  Thermal leftHeatFlow
    annotation (Placement(transformation(extent={{-110,-50},{-90,-30}})));
  Thermal rightHeatFlow
    annotation (Placement(transformation(extent={{90,-48},{110,-28}})));

equation

    leftHeatFlow.Q_flow + rightHeatFlow.Q_flow = 0;
    leftHeatFlow.Q_flow =Thermal_Functions.GeneralHeatTransferRate(
    C=Cthermal_BipolarPlate,
    T1=leftHeatFlow.T,
    T2=rightHeatFlow.T);

  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end HT_BipolarPlate_Thermal_Sakas2022;
