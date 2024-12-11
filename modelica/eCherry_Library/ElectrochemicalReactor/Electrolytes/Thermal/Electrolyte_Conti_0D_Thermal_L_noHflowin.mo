within eCherry_Library.ElectrochemicalReactor.Electrolytes.Thermal;
model Electrolyte_Conti_0D_Thermal_L_noHflowin
  extends Liquid.Electrolyte_Conti_0D_L;
  extends ThermalDomain.EnergyBalance_Base(V=V_geo,Pr=CondRec.p);

  redeclare model TemperatureModel =
      Properties.TemperatureModels.TemperatureVariable                  "Temperature is variale for energy balance";

  Properties.EnthalpyModels.MolarEnthalpyOfSpecies0D hSpec(specRec=specRec, T=T)
    "Calculates the specific enthalpies of components at Tempeature T";
  Properties.EnthalpyModels.MolarEnthalpyOfSpecies0D hSpec_inFlow(specRec=
        specRec, T=EBRec.T0convectiveInflow)
    "Calculates the specific enthalpies of components at Tempeature T";
  EnthalpyFlowRate HFlow_conv_in "Enthalpyflowrate from convective inflow";
  EnthalpyFlowRate HFlow_conv_out "Enthalpyflowrate from convective outflow";
  parameter HeatFlowRate QFlow_shunt;

  //heat losses via housing
  ThermalDomain.Thermal_Effects.HeatExchangeEnvironment HeatEnv(
    T=T,
    EBRec=EBRec,
    GeoRec=GeoRec,
    CondRec=CondRec);

equation

  //Variables for energy conservation
  H_tot = sum(c[k]*V_geo*hSpec.h[k] for k in 1:specRec.nSpec);
  HFlow = HFlow_conv_in + HFlow_conv_out;
  QFlow =  HeatEnv.QFlow_housing + QFlow_shunt;
  WFlow = abs(v*i);

  // Connectors for heat flow
  leftHeatFlow.T = T;
  rightHeatFlow.T = T;

  // Enthalpy of convective inflow and outflow
  HFlow_conv_in = sum(inFlow.molFlow_vec[k]*hSpec_inFlow.h[k] for k in 1:specRec.nSpec);
  HFlow_conv_out = sum(outFlow.molFlow_vec[k]*hSpec.h[k] for k in 1:specRec.nSpec);

  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)));
end Electrolyte_Conti_0D_Thermal_L_noHflowin;
