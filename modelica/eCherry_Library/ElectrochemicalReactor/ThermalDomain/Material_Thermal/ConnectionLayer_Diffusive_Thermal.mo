within eCherry_Library.ElectrochemicalReactor.ThermalDomain.Material_Thermal;
model ConnectionLayer_Diffusive_Thermal
  extends
    eCherry_Library.ElectrochemicalReactor.MaterialDomain.ConnectionLayers.ConnectionLayer_Diffusive;
      extends EnergyBalance_Base;

  // Parameters

  //parameter ThermalConductivity lambda = 0.6 "Thermal conductivity of electrolyte";
  //parameter ThermalConductance Cthermal_electrolyte=EBRec.lambda_electrolyte/dX*A "Thermal conductance of electrolyte";
  //alpha used instead of lambda to reduce calculation time
  parameter ThermalConductance Cthermal_electrolyte=EBRec.alpha_electrolyte_electrolyte*A "Thermal conductance of electrolyte";

equation

  H_tot=0;

  QFlow=0;
  HFlow=0;
  WFlow=0;

    //leftHeatFlow.QFlow_tot + rightHeatFlow.QFlow_tot = 0;

  leftHeatFlow.Q_flow =Thermal_Functions.GeneralHeatTransferRate(
    C=Cthermal_electrolyte,
    T1=leftHeatFlow.T,
    T2=rightHeatFlow.T);

  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end ConnectionLayer_Diffusive_Thermal;
