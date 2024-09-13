within eCherry_Library.ElectrochemicalReactor.Electrolytes.Thermal;
model Electrolyte_Batch_0D_GL_Thermal_IsobaricFlashed
  extends GasLiquid.Electrolyte_Batch_0D_GL_IsobaricFlashed;
  extends ThermalDomain.EnergyBalance_base;

  redeclare model TemperatureModel =
      Properties.TemperatureModels.TemperatureVariable                  "Temperature is variale for energy balance";

  Properties.EnthalpyModels.MolarEnthalpyOfSpecies0D hSpec(specRec=specRec, T=T)
    "Calculates the specific enthalpies of components at tempeature T";

   parameter HeatFlowRate QFlow_shunt;
    //heat losses via housing
  ThermalDomain.Thermal_Effects.HeatExchangeEnvironment HeatEnv(
    T=T,
    EBRec=EBRec,
    GeoRec=GeoRec,
    CondRec=CondRec);

equation

  H_tot = sum(c[k]*V_geo*hSpec.h[k] for k in 1:AllSpec);
  WFlow = abs(v*i);
  QFlow= HeatEnv.QFlow_housing + QFlow_shunt;
  HFlow=0;

  leftHeatFlow.T = T;
  rightHeatFlow.T = T;

  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)));
end Electrolyte_Batch_0D_GL_Thermal_IsobaricFlashed;
