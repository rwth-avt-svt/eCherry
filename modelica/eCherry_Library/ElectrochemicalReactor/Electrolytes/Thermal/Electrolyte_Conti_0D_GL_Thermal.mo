within eCherry_Library.ElectrochemicalReactor.Electrolytes.Thermal;
model Electrolyte_Conti_0D_GL_Thermal
    extends GasLiquid.Electrolyte_Conti_0D_GL;
  extends ThermalDomain.EnergyBalance_Base(V=V_L);//,Pr=CondRec.p);

  redeclare model TemperatureModel =
      Properties.TemperatureModels.TemperatureVariable                  "Temperature is variale for energy balance";
  Properties.EnthalpyModels.MolarEnthalpyOfSpecies0D hSpec(specRec=specRec, T=T)
    "Calculates the specific enthalpies of components at Tempeature T";
  Properties.EnthalpyModels.MolarEnthalpyOfSpecies0D hSpec_inFlow(specRec=
        specRec, T=Tinflow)
    "Calculates the specific enthalpies of components at Tempeature T";
    Temperature Tinflow;
  parameter Boolean ConvInflowTempreatureIsCompartmentTemperature=false annotation(Evaluate=true, HideResult=false, choices(checkBox=true));
  EnthalpyFlowRate HFlow_conv_in "Enthalpyflowrate from convective inflow";
  EnthalpyFlowRate HFlow_conv_out "Enthalpyflowrate from convective outflow";
  parameter HeatFlowRate QFlow_shunt;

   //heat losses via housing
  replaceable model HeatEnvModel =
      ThermalDomain.Thermal_Effects.HeatExchangeEnvironment (
    T=T,
    EBRec=EBRec,
    GeoRec=GeoRec,
    CondRec=CondRec);
  HeatEnvModel HeatEnv;

  ThermalDomain.Thermal heatConvInFlow
    annotation (Placement(transformation(extent={{-60,-120},{-40,-100}})));

  ThermalDomain.Thermal heatConvOutFlow
    annotation (Placement(transformation(extent={{-60,100},{-40,120}})));
equation
 //Variables for energy conservation
  H_tot = sum(c[k]*V_L*hSpec.h[k] for k in 1:specRec.nSpec);
  HFlow = HFlow_conv_in + HFlow_conv_out;
  QFlow =  0; //HeatEnv.QFlow_housing + QFlow_shunt;
  WFlow = abs(v*i);

  // Connectors for heat flow
  leftHeatFlow.T = T;
  rightHeatFlow.T = T;
  heatConvOutFlow.T = T;

  // Enthalpy of convective inflow and outflow
  HFlow_conv_in = heatConvInFlow.Q_flow;
  //HFlow_conv_in = sum(inFlow.molFlow_vec[k]*hSpec_inFlow.h[k] for k in 1:specRec.nSpec);
  HFlow_conv_out = heatConvOutFlow.Q_flow;
  HFlow_conv_out = sum(outFlow.molFlow_vec[k]*hSpec.h[k] for k in 1:specRec.nSpec);

  if ConvInflowTempreatureIsCompartmentTemperature then
    Tinflow = min(T,EBRec.TinflowMax);
  else
    Tinflow = heatConvInFlow.T;
  end if;

  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end Electrolyte_Conti_0D_GL_Thermal;
