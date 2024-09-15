within eCherry_Library.ElectrochemicalReactor.Electrolytes.Thermal;
model Electrolyte_Batch_0D_L_Thermal
  "Compartment with diffusive transport in zero dimension and Ohmic overpotential"
  extends Liquid.Electrolyte_Batch_0D_L;
  extends ThermalDomain.EnergyBalance_Base;

  redeclare model TemperatureModel =
      Properties.TemperatureModels.TemperatureVariable                  "Temperature is variale for energy balance";

  Properties.EnthalpyModels.MolarEnthalpyOfSpecies0D hSpec(specRec=specRec, T=T)
    "Calculates the specific enthalpies of components at tempeature T";

   parameter HeatFlowRate QFlow_shunt;
   Heat Qhousing "Sum of heat dissipating from the housing";
   //heat losses via housing
  ThermalDomain.Thermal_Effects.HeatExchangeEnvironment HeatEnv(
    T=T,
    EBRec=EBRec,
    GeoRec=GeoRec,
    CondRec=CondRec);

equation

  // Calculating total enthalpy of compartment and its derivative for calculation of compartment temperature
  H_tot = sum(c[k]*V_geo*hSpec.h[k] for k in 1:specRec.nSpec);

  HFlow=0;
  WFlow = abs(v*i);
  QFlow =  HeatEnv.QFlow_housing + QFlow_shunt;
  Qhousing = HeatEnv.Qhousing;

  leftHeatFlow.T = T;
  rightHeatFlow.T = T;

     annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)));
end Electrolyte_Batch_0D_L_Thermal;
