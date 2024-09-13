within eCherry_Library.ElectrochemicalReactor.ThermalDomain.ElectrolyzerColdStart_Models;
model Cell_Conti_0D_L_Thermal_Sakas2022

  parameter
    eCherry_Library.Data.DataRecords.Thermal
    EBRec;
  parameter Data.DataRecords.Species.SpeciesRecord specRec(nSpec=0);
  parameter Data.DataRecords.Geometry GeoRec;
  parameter Data.DataRecords.Conditions CondRec;
  parameter Concentration c0[specRec.nSpec];
  parameter MolarFlowRate[specRec.nSpec] molFlow_vec_inFlow;
  parameter Conductivity kappa_const;
  parameter Pressure[specRec.nSpec] Pi;
  HeatFlowRate QFlow_shunt = 0;

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

  Anode_Stack_Thermal_Sakas2022 Anode(
    redeclare model ActivationOverpotentialModel =
        ActivationOverpotential_Sakas2022,
    GeoRec=GeoRec,
    CondRec=CondRec,
    specRec=specRec,
    reac={eCherry_Library.Data.UserInput.Pyschik2024_ElectrolyzerColdStart.OERdummy},
    EBRec=EBRec,
    Pi=Pi) annotation (Placement(transformation(extent={{-80,-10},{-60,10}})));

  Cathode_Stack_Thermal_Sakas2022 Cathode(
    redeclare model ActivationOverpotentialModel =
        ActivationOverpotential_Sakas2022,
    GeoRec=GeoRec,
    CondRec=CondRec,
    specRec=specRec,
    reac={eCherry_Library.Data.UserInput.Pyschik2024_ElectrolyzerColdStart.HERdummy},
    EBRec=EBRec,
    Pi=Pi) annotation (Placement(transformation(extent={{60,-10},{80,10}})));

  Separators.Thermal.DiaphragmHydroxide_Thermal Membrane(
    specRec=specRec,
    GeoRec=GeoRec,
    CondRec=CondRec,
    X=0.0005,
    kappa=kappa_const,
    EBRec=EBRec)
    annotation (Placement(transformation(extent={{-10,-12},{10,8}})));
  Electrolyte_Conti_0D_Thermal_Sakas2022 Anolyte(
    c0=c0,
    specRec=specRec,
    GeoRec=GeoRec,
    CondRec=CondRec,
    redeclare model ConductivityModel =
        ConductivityElectrolyteCalc_KOH_Sakas2022,
    EBRec=EBRec,
    QFlow_shunt=QFlow_shunt)
    annotation (Placement(transformation(extent={{-42,-10},{-22,10}})));
  Electrolyte_Conti_0D_Thermal_Sakas2022 Catholyte(
    c0=c0,
    specRec=specRec,
    GeoRec=GeoRec,
    CondRec=CondRec,
    redeclare model ConductivityModel =
        ConductivityElectrolyteCalc_KOH_Sakas2022,
    EBRec=EBRec,
    QFlow_shunt=QFlow_shunt)
    annotation (Placement(transformation(extent={{20,-10},{40,10}})));
  Material_Thermal.FixedConvInflow_L_Thermal fixedConvInflow_L_Anode(
    specRec=specRec,
    molFlow_vec=molFlow_vec_inFlow,
    EBRec=EBRec)
    annotation (Placement(transformation(extent={{-40,-40},{-20,-20}})));
  Material_Thermal.FixedConvInflow_L_Thermal fixedConvInflow_L_Cathode(
    specRec=specRec,
    molFlow_vec=molFlow_vec_inFlow,
    EBRec=EBRec)
    annotation (Placement(transformation(extent={{20,-40},{40,-20}})));
  MaterialDomain.Flows.ConnectingFlowL connectingFlow_L_Anolyte(specRec=specRec)
    annotation (Placement(transformation(extent={{-40,20},{-20,40}})));
  MaterialDomain.Flows.ConnectingFlowL connectingFlow_L_Catholyte(specRec=
        specRec)
    annotation (Placement(transformation(extent={{20,20},{40,40}})));
  MaterialDomain.Flows.EnvironmentL environment_L_Anolyte(specRec=specRec)
    annotation (Placement(transformation(extent={{-40,50},{-20,70}})));
  MaterialDomain.Flows.EnvironmentL environment_L_Catholyte(specRec=specRec)
    annotation (Placement(transformation(extent={{20,50},{40,70}})));
equation
  connect(Catholyte.inFlow, fixedConvInflow_L_Cathode.convFlow)
    annotation (Line(points={{30,-10},{30,-20}}, color={0,0,0}));
  connect(Catholyte.heatConvInFlow, fixedConvInflow_L_Cathode.convHeatFlow)
    annotation (Line(points={{25,-11},{25,-19}}, color={0,0,0}));
  connect(Anolyte.inFlow, fixedConvInflow_L_Anode.convFlow)
    annotation (Line(points={{-32,-10},{-32,-16},{-30,-16},{-30,-20}},
                                                   color={0,0,0}));
  connect(Anolyte.heatConvInFlow, fixedConvInflow_L_Anode.convHeatFlow)
    annotation (Line(points={{-37,-11},{-37,-16},{-35,-16},{-35,-19}},
                                                   color={0,0,0}));
  connect(Anolyte.outFlow, connectingFlow_L_Anolyte.convinFlow)
    annotation (Line(points={{-32,10},{-32,16},{-30,16},{-30,20}},
                                                 color={0,0,0}));
  connect(Anode.flowFromElectrolyte, Anolyte.leftFlow) annotation (Line(points={{-59.8,5},
          {-52,5},{-52,4},{-46,4},{-46,6},{-42,6}},
                                                  color={0,0,0}));
  connect(Anode.n, Anolyte.p)
    annotation (Line(points={{-60,0},{-42,0}}, color={0,0,255}));
  connect(Anode.rightHeatFlow, Anolyte.leftHeatFlow) annotation (Line(points={{-60,
          -4.6},{-48,-4.6},{-48,-4},{-44,-4},{-44,-4.6},{-42,-4.6}},
                                                       color={0,0,0}));
  connect(environment_L_Anolyte.convFlow, connectingFlow_L_Anolyte.convoutFlow)
    annotation (Line(points={{-30,50},{-30,40}}, color={0,0,0}));
  connect(environment_L_Catholyte.convFlow, connectingFlow_L_Catholyte.convoutFlow)
    annotation (Line(points={{30,50},{30,40}}, color={0,0,0}));
  connect(connectingFlow_L_Catholyte.convinFlow, Catholyte.outFlow)
    annotation (Line(points={{30,20},{30,10}}, color={0,0,0}));
  connect(Catholyte.rightFlow, Cathode.flowFromElectrolyte) annotation (Line(
        points={{40,6},{54,6},{54,5.6},{60.2,5.6}},     color={0,0,0}));
  connect(Catholyte.n, Cathode.p) annotation (Line(points={{40,0},{52,0},{52,-0.6},
          {60.2,-0.6}},       color={0,0,255}));
  connect(Catholyte.rightHeatFlow, Cathode.leftHeatFlow)
    annotation (Line(points={{40,-4.6},{50,-4.6},{50,-4.6},{60,-4.6}},
                                                     color={0,0,0}));
  connect(Membrane.catCon, Catholyte.leftFlow)
    annotation (Line(points={{10,4},{14,4},{14,6},{20,6}},
                                             color={0,0,0}));
  connect(Membrane.n, Catholyte.p)
    annotation (Line(points={{10,-2},{14,-2},{14,0},{20,0}},
                                             color={0,0,255}));
  connect(Membrane.rightHeatFlow, Catholyte.leftHeatFlow)
    annotation (Line(points={{10,-6.6},{10,-4.6},{20,-4.6}},   color={0,0,0}));
  connect(Anolyte.rightHeatFlow, Membrane.leftHeatFlow) annotation (Line(points={{-22,
          -4.6},{-18,-4.6},{-18,-6.6},{-10,-6.6}},         color={0,0,0}));
  connect(Anolyte.n, Membrane.p)
    annotation (Line(points={{-22,0},{-8,0},{-8,-2},{-10,-2}},
                                               color={0,0,255}));
  connect(Anolyte.rightFlow, Membrane.anCon)
    annotation (Line(points={{-22,6},{-8,6},{-8,4},{-10,4}},
                                               color={0,0,0}));
  connect(Cathode.n, n) annotation (Line(points={{80,-0.6},{90,-0.6},{90,0},{100,
          0}}, color={0,0,255}));
  connect(p, Anode.p) annotation (Line(points={{-100,0},{-89.9,0},{-89.9,0.2},{-79.8,
          0.2}}, color={0,0,255}));
  connect(Anode.leftHeatFlow, leftHeatFlow) annotation (Line(points={{-80,-4.6},
          {-86,-4.6},{-86,-36},{-90,-36},{-90,-50}}, color={0,0,0}));
  connect(Cathode.rightHeatFlow, rightHeatFlow) annotation (Line(points={{80,-4.6},
          {86,-4.6},{86,-36},{90,-36},{90,-50}}, color={0,0,0}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end Cell_Conti_0D_L_Thermal_Sakas2022;
