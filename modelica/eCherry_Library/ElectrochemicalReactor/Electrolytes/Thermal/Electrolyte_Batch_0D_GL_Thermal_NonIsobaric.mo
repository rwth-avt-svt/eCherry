within eCherry_Library.ElectrochemicalReactor.Electrolytes.Thermal;
model Electrolyte_Batch_0D_GL_Thermal_NonIsobaric
  extends GasLiquid.Electrolyte_Batch_0D_GL_NonIsobaric;
extends ThermalDomain.EnergyBalance_Base;

  redeclare model TemperatureModel =
      Properties.TemperatureModels.TemperatureVariable                  "Temperature is variale for energy balance";

  Properties.EnthalpyModels.MolarEnthalpyOfSpecies0D uSpec(specRec=specRec, T=T)
    "For nonisobaric case, internal energy is assumed Tempeature T";
    //Heat Qhousing "Sum of heat dissipating from the housing";
   parameter HeatFlowRate QFlow_shunt;

   //heat losses via housing
  ThermalDomain.Thermal_Effects.HeatExchangeEnvironment HeatEnv(
    T=T,
    EBRec=EBRec,
    GeoRec=GeoRec,
    CondRec=CondRec);

equation

  H_tot = sum(c[k]*V_geo*uSpec.h[k] for k in 1:AllSpec);
  QFlow =  HeatEnv.QFlow_housing + QFlow_shunt;
  WFlow = abs(v*i)+ V_geo*der(P);
  HFlow=0;

  leftHeatFlow.T = T;
  rightHeatFlow.T = T;

  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)));
end Electrolyte_Batch_0D_GL_Thermal_NonIsobaric;
