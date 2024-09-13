within eCherry_Library.ElectrochemicalReactor.ThermalDomain.Thermal_Functions;
function GeneralHeatTransferRate
  input ThermalConductance C;
  input Temperature T1;
  input Temperature T2;
  output HeatFlowRate QFlow;

algorithm

  QFlow := C*(T1 - T2);

end GeneralHeatTransferRate;
