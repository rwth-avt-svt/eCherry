within eCherry_Library.ElectrochemicalReactor.ThermalDomain.ElectrolyzerColdStart_Models;
model Electrolyte_Conti_0D_Thermal_Sakas2022
  "Temperature of convective inflow is the same as outflow Temperature"
  extends Electrolytes.Liquid.Electrolyte_Conti_0D_L;
  extends ThermalDomain.EnergyBalance_base;

  redeclare model TemperatureModel =
      Properties.TemperatureModels.TemperatureVariable                                "Temperature is variale for energy balance";

  SpecificEnthalpyOfSpecies0D_Sakas2022 hSpec(specRec=specRec, T=T)
    "Calculates the specific enthalpies of components at Tempeature T";
  parameter Temperature TinFlowMax=343.15;
  SpecificEnthalpyOfSpecies0D_Sakas2022 hSpec_inFlow(specRec=specRec, T=min(T,
        TinFlowMax))
    "Calculates the specific enthalpies of components at Tempeature T";
  EnthalpyFlowRate HFlow_conv_in "Enthalpyflowrate from convective inflow";
  EnthalpyFlowRate HFlow_conv_out "Enthalpyflowrate from convective outflow";
  HeatFlowRate QFlow_housing_convection;
  HeatFlowRate QFlow_housing_radiation;
  HeatFlowRate QFlow_housing "Heat dissipating from the housing";
  Heat Qhousing "Sum of heat dissipating from the housing";
  ThermalConductance Cthermal_housing "Thermal conductance of housing";
  HeatFlowRate QFlow_shunt = 0;

  // Connectors
  Thermal heatConvInFlow
    annotation (Placement(transformation(extent={{-60,-120},{-40,-100}})));

initial equation
  Qhousing = 0;

equation

  // Calculating total enthalpy of compartment and its derivative for calculation of compartment temperature
  //For Sakas adapted as massbalance
  H_tot = sum(specRec.species[k].M*c[k]*V_geo*hSpec.h[k] for k in 1:specRec.nSpec);
  HFlow = HFlow_conv_in + HFlow_conv_out;
  QFlow = QFlow_shunt + QFlow_housing;
  WFlow = abs(v*i);
  der(Qhousing) = QFlow_housing;

  // Heat dissipated from housing
  QFlow_housing = QFlow_housing_convection + QFlow_housing_radiation;
  QFlow_housing_convection =Thermal_Functions.GeneralHeatTransferRate(
    C=Cthermal_housing,
    T1=EBRec.Tenvironment_housing,
    T2=T);
  QFlow_housing_radiation = -Modelica.Constants.sigma*2*Modelica.Constants.pi*0.92*X*1.32*1* (T^4-EBRec.Tenvironment_housing^4);
  Cthermal_housing = 2*Modelica.Constants.pi*0.92*X*1.32*((T-EBRec.Tenvironment_housing)/1.84)^0.25;


  // Connectors for heat flow
  leftHeatFlow.T = T;
  rightHeatFlow.T = T;

  // Enthalpy of convective inflow and outflow
  HFlow_conv_in = heatConvInFlow.Q_flow;
  HFlow_conv_in = sum(inFlow.molFlow_vec[k]*specRec.species[k].M*hSpec_inFlow.h[k] for k in 1:specRec.nSpec);
  HFlow_conv_out = sum(outFlow.molFlow_vec[k]*specRec.species[k].M*hSpec.h[k] for k in 1:specRec.nSpec);

  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)));
end Electrolyte_Conti_0D_Thermal_Sakas2022;
