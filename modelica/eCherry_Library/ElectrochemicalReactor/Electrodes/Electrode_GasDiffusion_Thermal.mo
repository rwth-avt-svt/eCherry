within eCherry_Library.ElectrochemicalReactor.Electrodes;
model Electrode_GasDiffusion_Thermal
  extends eCherry_Library.ElectrochemicalReactor.Electrodes.Electrode_GasDiffusion;
  extends ThermalDomain.EnergyBalance_Base(V=V_geo);//,Pr=CondRec.p);

  // Parameter
  parameter Length X = if CathodeEl then EBRec.X_cathode else EBRec.X_anode;
  parameter SpecificHeatCapacity cp = if CathodeEl then EBRec.cp_cathode else EBRec.cp_anode;
  parameter Density rho = if CathodeEl then EBRec.rho_cathode else EBRec.rho_anode;

  inner parameter Volume V_geo = X*Y*Z "Volume of electrode";
  parameter Area A = Y*Z "Area of electrode";

equation

  rightHeatFlow.T = T;
  leftHeatFlow.T = T;

  H_tot = rho*V_geo*cp*(T-Tref);
  QFlow=0;
  HFlow=0;

  // Heat dissipated due to reaction
  WFlow = sum(abs(reactions[i].actOp.v*reactions[i].actOp.i) for i in 1:nReac);

  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end Electrode_GasDiffusion_Thermal;
