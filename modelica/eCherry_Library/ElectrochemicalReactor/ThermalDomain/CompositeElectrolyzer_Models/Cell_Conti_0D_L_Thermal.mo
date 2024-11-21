within eCherry_Library.ElectrochemicalReactor.ThermalDomain.CompositeElectrolyzer_Models;
model Cell_Conti_0D_L_Thermal

  parameter
    eCherry_Library.Data.DataRecords.Thermal
    EBRec;
  parameter Data.DataRecords.Species.SpeciesRecord specRec(nSpec=0);
  parameter Data.DataRecords.Geometry GeoRec;
  parameter Data.DataRecords.Conditions CondRec;
  parameter Concentration c0[specRec.nSpec];
  parameter MolarFlowRate[specRec.nSpec] molFlow_vec_inFlow;
  parameter Conductivity kappa_membrane;
  parameter Pressure[specRec.nSpec] Pi;
  parameter HeatFlowRate QFlow_shunt = 0;
  parameter Data.DataRecords.ElecReaction.Reaction reac_anode[:];
  parameter Data.DataRecords.ElecReaction.Reaction reac_cathode[:];
  parameter Boolean ConvInflowTempreatureIsCompartmentTemperature annotation(Evaluate=true, HideResult=false, choices(checkBox=true));

  // Replaceable submodel
  replaceable model ActivationOverpotentialModel =
    eCherry_Library.ElectrochemicalReactor.Electrodes.Electrochemistry.Activation_Overpotential.ActivationOverpotential
    annotation (choices(
   choice=eCherry_Library.ElectrochemicalReactor.Electrodes.Electrochemistry.Activation_Overpotential.ActivationOverpotential
    "BV equation with concentration dependence",
    choice=eCherry_Library.ElectrochemicalReactor.Electrodes.Electrochemistry.Activation_Overpotential.ActivationOverpotentialSpecRec
    "BV equation with concentration dependence (SpecRec)",
    choice=eCherry_Library.ElectrochemicalReactor.Electrodes.Electrochemistry.Activation_Overpotential.ActivationOverpotentialTafel
    "Tafel approach",
    choice=eCherry_Library.ElectrochemicalReactor.Electrodes.Electrochemistry.Activation_Overpotential.ActivationOverpotentialColdStart
    "Approach from Sakas2022 used for ColdStart example"));
  replaceable model EquilibriumPotentialModel =
    eCherry_Library.ElectrochemicalReactor.Electrodes.Electrochemistry.Equilibrium_Potential.EquilibriumPotential
    annotation (choices(
    choice=eCherry_Library.ElectrochemicalReactor.Electrodes.Electrochemistry.Equilibrium_Potential.EquilibriumPotential
    "Nernst equation",
    choice=eCherry_Library.ElectrochemicalReactor.Electrodes.Electrochemistry.Equilibrium_Potential.EquilibriumPotentialSpecRec
    "Nernst equation for SpecRec",
    choice=eCherry_Library.ElectrochemicalReactor.Electrodes.Electrochemistry.Equilibrium_Potential.EquilibriumPotentialColdStart
    "Approach from Sakas2022 used for ColdStart example"));
  replaceable model DensityModel =
      Properties.DensityModels.DensityWaterTdependent(T=T)
      annotation(choices(
    choice=eCherry_Library.ElectrochemicalReactor.Properties.DensityModels.DensityConstant
    "Constant density",
    choice=eCherry_Library.ElectrochemicalReactor.Properties.DensityModels.DensityWaterTdependent
    "Temperature dependent water density",
    choice=eCherry_Library.ElectrochemicalReactor.Properties.DensityModels.DensityMix
    "Temperature dependent mixture density",
    choice=eCherry_Library.ElectrochemicalReactor.Properties.DensityModels.DensityGas
    "Density of gaseous phase using ideal gas law"));
  replaceable model ConductivityModelElectrolyte =
      eCherry_Library.ElectrochemicalReactor.Properties.ConductivityModels.ConductivityElectrolyteConstant
    annotation(choices(
    choice=eCherry_Library.ElectrochemicalReactor.Properties.ConductivityModels.ConductivityElectrolyteCalcKOH
    "KOH: Calculation of Conductivity",
    choice=eCherry_Library.ElectrochemicalReactor.Properties.ConductivityModels.ConductivityElectrolyteConstant
    "Constant Conductivity",
    choice=eCherry_Library.ElectrochemicalReactor.Properties.ConductivityModels.ConductivityElectrolyteCalcKOHColdStart
    "Approach from Sakas2022 used for ColdStart example"));

  replaceable model HeatEnvModelElectrolyte =
      eCherry_Library.ElectrochemicalReactor.ThermalDomain.Thermal_Effects.HeatExchangeEnvironment
      (
    T=T,
    EBRec=EBRec,
    GeoRec=GeoRec,
    CondRec=CondRec)
    annotation(choices(
    choice=eCherry_Library.ElectrochemicalReactor.ThermalDomain.Thermal_Effects.HeatExchangeEnvironment
    "Standard model for heat exchange with environment",
    choice=eCherry_Library.ElectrochemicalReactor.ThermalDomain.Thermal_Effects.HeatExchangeEnvironmentColdStart
    "Approach from Sakas2022 used for ColdStart example"));

  Modelica.Electrical.Analog.Interfaces.PositivePin p "Positive electrical pin"
  annotation (Placement(
        transformation(extent={{-110,-10},{-90,10}})));
  Modelica.Electrical.Analog.Interfaces.NegativePin n "Negative electrical pin"
  annotation (Placement(transformation(extent={{
            110,-10},{90,10}})));
  Thermal leftHeatFlow
    annotation (Placement(transformation(extent={{-100,-60},{-80,-40}})));
  Thermal rightHeatFlow
    annotation (Placement(transformation(extent={{80,-60},{100,-40}})));

  eCherry_Library.ElectrochemicalReactor.Electrodes.Electrode_Thermal Anode(
    redeclare model ActivationOverpotentialModel =
        ActivationOverpotentialModel,
    redeclare model EquilibriumPotentialModel =
        EquilibriumPotentialModel,
    GeoRec=GeoRec,
    CondRec=CondRec,
    specRec=specRec,
    reac=reac_anode,
    EBRec=EBRec,
    Pi(displayUnit="bar"),
    CathodeEl=false) annotation (Placement(transformation(extent={{-90,-10},{
            -70,10}})));

  eCherry_Library.ElectrochemicalReactor.Electrodes.Electrode_Thermal Cathode(
    redeclare model ActivationOverpotentialModel =
        ActivationOverpotentialModel,
    redeclare model EquilibriumPotentialModel =
        EquilibriumPotentialModel,
    GeoRec=GeoRec,
    CondRec=CondRec,
    specRec=specRec,
    reac=reac_cathode,
    EBRec=EBRec,
    Pi(displayUnit="bar"),
    CathodeEl=true) annotation (Placement(transformation(extent={{70,-10},{90,
            10}})));

  Separators.Thermal.Diaphragm_Hydroxide_Thermal Membrane(
    specRec=specRec,
    GeoRec=GeoRec,
    CondRec=CondRec,
    kappa=kappa_membrane,
    EBRec=EBRec)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}})));
  eCherry_Library.ElectrochemicalReactor.Electrolytes.Thermal.Electrolyte_Conti_0D_L_Thermal Anolyte(
    c0=c0,
    specRec=specRec,
    GeoRec=GeoRec,
    CondRec=CondRec,
    redeclare model ConductivityModel =
        ConductivityModelElectrolyte,
    redeclare model DensityModel =
        DensityModel,
    redeclare model HeatEnvModel =
        HeatEnvModelElectrolyte,
    EBRec=EBRec,
    QFlow_shunt=QFlow_shunt,
    ConvInflowTempreatureIsCompartmentTemperature=ConvInflowTempreatureIsCompartmentTemperature)
    annotation (Placement(transformation(extent={{-50,-10},{-30,10}})));
  eCherry_Library.ElectrochemicalReactor.Electrolytes.Thermal.Electrolyte_Conti_0D_L_Thermal Catholyte(
    c0=c0,
    specRec=specRec,
    GeoRec=GeoRec,
    CondRec=CondRec,
    redeclare model ConductivityModel =
        ConductivityModelElectrolyte,
    redeclare model DensityModel =
        DensityModel,
    redeclare model HeatEnvModel =
        HeatEnvModelElectrolyte,
    EBRec=EBRec,
    QFlow_shunt=QFlow_shunt,
    ConvInflowTempreatureIsCompartmentTemperature=ConvInflowTempreatureIsCompartmentTemperature)
    annotation (Placement(transformation(extent={{30,-10},{50,10}})));
  Material_Thermal.Material_Simple_InFlow_Thermal fixedConvInflow_L_Anode(
    specRec=specRec,
    molFlow_vec=molFlow_vec_inFlow,
    EBRec=EBRec)
    annotation (Placement(transformation(extent={{-50,-60},{-30,-40}})));
  Material_Thermal.Material_Simple_InFlow_Thermal fixedConvInflow_L_Cathode(
    specRec=specRec,
    molFlow_vec=molFlow_vec_inFlow,
    EBRec=EBRec)
    annotation (Placement(transformation(extent={{30,-60},{50,-40}})));
  MaterialDomain.Flows.Material_Simple_ConnectingFlow connectingFlow_L_Anolyte(
      specRec=specRec)
    annotation (Placement(transformation(extent={{-50,20},{-30,40}})));
  MaterialDomain.Flows.Material_Simple_ConnectingFlow
    connectingFlow_L_Catholyte(specRec=specRec)
    annotation (Placement(transformation(extent={{30,20},{50,40}})));
  MaterialDomain.Flows.Environment environment_L_Anolyte(specRec=specRec)
    annotation (Placement(transformation(extent={{-50,50},{-30,70}})));
  MaterialDomain.Flows.Environment environment_L_Catholyte(specRec=specRec)
    annotation (Placement(transformation(extent={{30,50},{50,70}})));
  ConnectionLayers.ConnectionLayer_CompositeHT compositeConnectionLayer(
    GeoRec=GeoRec,
    alpha=EBRec.alpha_anode_electrolyte,
    useConvection=true) annotation (Placement(transformation(extent={{-10,-10},
            {10,10}}, origin={-60,-20})));
  ConnectionLayers.ConnectionLayer_CompositeHT compositeConnectionLayer1(
    GeoRec=GeoRec,
    alpha=EBRec.alpha_cathode_electrolyte,
    useConvection=true) annotation (Placement(transformation(extent={{-10,-10},
            {10,10}}, origin={60,-20})));
  ConnectionLayers.ConnectionLayer_CompositeHT compositeConnectionLayer2(
    GeoRec=GeoRec,
    alpha=EBRec.alpha_membrane_anolyte,
    useConvection=true) annotation (Placement(transformation(extent={{-10,-10},
            {10,10}}, origin={-20,-20})));
  ConnectionLayers.ConnectionLayer_CompositeHT compositeConnectionLayer3(
    GeoRec=GeoRec,
    alpha=EBRec.alpha_membrane_catholyte,
    useConvection=true) annotation (Placement(transformation(extent={{-10,-10},
            {10,10}}, origin={20,-20})));
equation
  connect(Catholyte.inFlow, fixedConvInflow_L_Cathode.convFlow)
    annotation (Line(points={{40,-10},{40,-40}}, color={0,0,0}));
  connect(Catholyte.heatConvInFlow, fixedConvInflow_L_Cathode.convHeatFlow)
    annotation (Line(points={{35,-11},{35,-39}}, color={0,0,0}));
  connect(Anolyte.inFlow, fixedConvInflow_L_Anode.convFlow)
    annotation (Line(points={{-40,-10},{-40,-40}}, color={0,0,0}));
  connect(Anolyte.heatConvInFlow, fixedConvInflow_L_Anode.convHeatFlow)
    annotation (Line(points={{-45,-11},{-45,-39}}, color={0,0,0}));
  connect(Anolyte.outFlow, connectingFlow_L_Anolyte.convinFlow)
    annotation (Line(points={{-40,10},{-40,20}}, color={0,0,0}));
  connect(Anode.flowFromElectrolyte, Anolyte.leftFlow) annotation (Line(points={{-80,10},
          {-60,10},{-60,8},{-50,8},{-50,6}},      color={0,0,0}));
  connect(Anode.n, Anolyte.p)
    annotation (Line(points={{-70,0},{-50,0}}, color={0,0,255}));
  connect(environment_L_Anolyte.convFlow, connectingFlow_L_Anolyte.convoutFlow)
    annotation (Line(points={{-40,50},{-40,40}}, color={0,0,0}));
  connect(environment_L_Catholyte.convFlow, connectingFlow_L_Catholyte.convoutFlow)
    annotation (Line(points={{40,50},{40,40}}, color={0,0,0}));
  connect(connectingFlow_L_Catholyte.convinFlow, Catholyte.outFlow)
    annotation (Line(points={{40,20},{40,10}}, color={0,0,0}));
  connect(Catholyte.rightFlow, Cathode.flowFromElectrolyte) annotation (Line(
        points={{50,6},{60,6},{60,10},{80,10}},         color={0,0,0}));
  connect(Catholyte.n, Cathode.p) annotation (Line(points={{50,0},{70,0}},
                              color={0,0,255}));
  connect(Membrane.catCon, Catholyte.leftFlow)
    annotation (Line(points={{10,6},{30,6}}, color={0,0,0}));
  connect(Membrane.n, Catholyte.p)
    annotation (Line(points={{10,0},{30,0}}, color={0,0,255}));
  connect(Anolyte.n, Membrane.p)
    annotation (Line(points={{-30,0},{-10,0}}, color={0,0,255}));
  connect(Anolyte.rightFlow, Membrane.anCon)
    annotation (Line(points={{-30,6},{-10,6}}, color={0,0,0}));
  connect(Cathode.n, n) annotation (Line(points={{90,0},{100,0}},
               color={0,0,255}));
  connect(p, Anode.p) annotation (Line(points={{-100,0},{-90,0}},
                 color={0,0,255}));
  connect(Anode.leftHeatFlow, leftHeatFlow) annotation (Line(points={{-90,
          -4.6},{-90,-50}},                          color={0,0,0}));
  connect(Cathode.rightHeatFlow, rightHeatFlow) annotation (Line(points={{90,-4.6},
          {90,-50}},                             color={0,0,0}));
  connect(Anode.rightHeatFlow, compositeConnectionLayer.leftHeatFlow)
    annotation (Line(points={{-70,-4.6},{-70,-24}}, color={0,0,0}));
  connect(compositeConnectionLayer.rightHeatFlow, Anolyte.leftHeatFlow)
    annotation (Line(points={{-50,-24},{-50,-4.6}}, color={0,0,0}));
  connect(Anolyte.rightHeatFlow, compositeConnectionLayer2.leftHeatFlow)
    annotation (Line(points={{-30,-4.6},{-30,-24}}, color={0,0,0}));
  connect(Membrane.leftHeatFlow, compositeConnectionLayer2.rightHeatFlow)
    annotation (Line(points={{-10,-4.6},{-10,-24}}, color={0,0,0}));
  connect(compositeConnectionLayer1.rightHeatFlow, Cathode.leftHeatFlow)
    annotation (Line(points={{70,-24},{70,-4.6}}, color={0,0,0}));
  connect(compositeConnectionLayer1.leftHeatFlow, Catholyte.rightHeatFlow)
    annotation (Line(points={{50,-24},{50,-4.6}}, color={0,0,0}));
  connect(Catholyte.leftHeatFlow, compositeConnectionLayer3.rightHeatFlow)
    annotation (Line(points={{30,-4.6},{30,-24}}, color={0,0,0}));
  connect(Membrane.rightHeatFlow, compositeConnectionLayer3.leftHeatFlow)
    annotation (Line(points={{10,-4.6},{10,-24}}, color={0,0,0}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end Cell_Conti_0D_L_Thermal;
