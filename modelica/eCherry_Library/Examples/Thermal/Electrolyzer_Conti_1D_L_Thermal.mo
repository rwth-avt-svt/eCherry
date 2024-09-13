within eCherry_Library.Examples.Thermal;
model Electrolyzer_Conti_1D_L_Thermal
 extends Modelica.Icons.Example;
 parameter Integer n_slices = 10;
Temperature Tdistr_all[2*n_slices+2];

  ElectrochemicalReactor.ElectricalDomain.Source.Potential_Source.ImposedPotential
    Source(GeoRec=Data.UserInput.Example_AlkalineWaterElectrolysis.GeoRec,
      Ufixed=-2.3)   annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={-54,52})));
  Modelica.Electrical.Analog.Basic.Ground Ground
    annotation (Placement(transformation(extent={{70,54},{50,74}})));
  eCherry_Library.ElectrochemicalReactor.Electrodes.Electrode_Thermal Anode(
    GeoRec=Data.UserInput.Example_AlkalineWaterElectrolysis.GeoRec,
    CondRec=Data.UserInput.Example_AlkalineWaterElectrolysis.CondRec,
    specRec=Data.UserInput.Example_AlkalineWaterElectrolysis.AWEspec,
    reac={Data.UserInput.Example_AlkalineWaterElectrolysis.OERdummy},
    Pi(displayUnit="bar"),
    CathodeEl=false,
    EBRec=Data.UserInput.Example_AlkalineWaterElectrolysis.EBdummy)
    annotation (Placement(transformation(extent={{-246,-90},{-226,-70}})));

  eCherry_Library.ElectrochemicalReactor.Electrodes.Electrode_Thermal Cathode(
    GeoRec=Data.UserInput.Example_AlkalineWaterElectrolysis.GeoRec,
    CondRec=Data.UserInput.Example_AlkalineWaterElectrolysis.CondRec,
    specRec=Data.UserInput.Example_AlkalineWaterElectrolysis.AWEspec,
    reac={Data.UserInput.Example_AlkalineWaterElectrolysis.HERdummy},
    Pi(displayUnit="bar"),
    CathodeEl=true,
    EBRec=Data.UserInput.Example_AlkalineWaterElectrolysis.EBdummy)
    annotation (Placement(transformation(extent={{116,-96},{136,-76}})));

  eCherry_Library.ElectrochemicalReactor.ThermalDomain.Material_Thermal.DiffusiveConnectionLayer_Thermal
    diffusiveConnectionLayerAnolyte(
    specRec=Data.UserInput.Example_AlkalineWaterElectrolysis.AWEspec,
    GeoRec=Data.UserInput.Example_AlkalineWaterElectrolysis.GeoRec,
    dX=1e-7,
    EBRec=Data.UserInput.Example_AlkalineWaterElectrolysis.EBdummy)
    annotation (Placement(transformation(extent={{-166,-62},{-146,-42}})));
  eCherry_Library.ElectrochemicalReactor.ThermalDomain.Material_Thermal.DiffusiveConnectionLayer_Thermal
    diffusiveConnectionLayerCatholyte(
    specRec=Data.UserInput.Example_AlkalineWaterElectrolysis.AWEspec,
    GeoRec=Data.UserInput.Example_AlkalineWaterElectrolysis.GeoRec,
    dX=1e-7,
    EBRec=Data.UserInput.Example_AlkalineWaterElectrolysis.EBdummy)
    annotation (Placement(transformation(extent={{46,-64},{66,-44}})));
  eCherry_Library.ElectrochemicalReactor.Separators.Thermal.DiaphragmHydroxide_Thermal
    membraneHydroxideTransport(
    specRec=Data.UserInput.Example_AlkalineWaterElectrolysis.AWEspec,
    GeoRec=Data.UserInput.Example_AlkalineWaterElectrolysis.GeoRec,
    CondRec=Data.UserInput.Example_AlkalineWaterElectrolysis.CondRec,
    X=5e-6,
    kappa=38,
    EBRec=Data.UserInput.Example_AlkalineWaterElectrolysis.EBdummy)
    annotation (Placement(transformation(extent={{-64,-86},{-44,-66}})));
  eCherry_Library.ElectrochemicalReactor.Electrolytes.Thermal.Electrolyte_Conti_0D_L_Thermal
    Anolyte(
    specRec=Data.UserInput.Example_AlkalineWaterElectrolysis.AWEspec,
    c0=Data.UserInput.Example_AlkalineWaterElectrolysis.c0,
    GeoRec=Data.UserInput.Example_AlkalineWaterElectrolysis.GeoRec,
    CondRec=Data.UserInput.Example_AlkalineWaterElectrolysis.CondRec,
    j(start=10000),
    QFlow_shunt=0,
    EBRec=Data.UserInput.Example_AlkalineWaterElectrolysis.EBdummy)
    annotation (Placement(transformation(extent={{-110,-86},{-90,-66}})));
  ElectrochemicalReactor.ThermalDomain.Material_Thermal.FixedConvInflow_L_Thermal
    AnodeInflow(
    specRec=Data.UserInput.Example_AlkalineWaterElectrolysis.AWEspec,
    molFlow_vec=Data.UserInput.Example_AlkalineWaterElectrolysis.c0*0.05,
    EBRec=Data.UserInput.Example_AlkalineWaterElectrolysis.EBdummy)
    annotation (Placement(transformation(extent={{-110,-118},{-90,-98}})));
  ElectrochemicalReactor.MaterialDomain.Flows.ConnectingFlowL Flow_anode(
      specRec=Data.UserInput.Example_AlkalineWaterElectrolysis.AWEspec)
    annotation (Placement(transformation(extent={{-110,-60},{-90,-40}})));
  ElectrochemicalReactor.MaterialDomain.Flows.EnvironmentL env_anode(specRec=
        Data.UserInput.Example_AlkalineWaterElectrolysis.AWEspec)
    annotation (Placement(transformation(extent={{-110,-34},{-90,-14}})));
  eCherry_Library.ElectrochemicalReactor.Electrolytes.Thermal.Electrolyte_Conti_0D_L_Thermal
    Catholyte(
    specRec=Data.UserInput.Example_AlkalineWaterElectrolysis.AWEspec,
    c0=Data.UserInput.Example_AlkalineWaterElectrolysis.c0,
    GeoRec=Data.UserInput.Example_AlkalineWaterElectrolysis.GeoRec,
    CondRec=Data.UserInput.Example_AlkalineWaterElectrolysis.CondRec,
    j(start=10000),
    QFlow_shunt=0,
    EBRec=Data.UserInput.Example_AlkalineWaterElectrolysis.EBdummy)
    annotation (Placement(transformation(extent={{-6,-86},{14,-66}})));
  ElectrochemicalReactor.ThermalDomain.Material_Thermal.FixedConvInflow_L_Thermal
    CathodeInflow(
    specRec=Data.UserInput.Example_AlkalineWaterElectrolysis.AWEspec,
    molFlow_vec=Data.UserInput.Example_AlkalineWaterElectrolysis.c0*0.05,
    EBRec=Data.UserInput.Example_AlkalineWaterElectrolysis.EBdummy)
    annotation (Placement(transformation(extent={{-6,-118},{14,-98}})));
  ElectrochemicalReactor.MaterialDomain.Flows.ConnectingFlowL Flow_cathode(
      specRec=Data.UserInput.Example_AlkalineWaterElectrolysis.AWEspec)
    annotation (Placement(transformation(extent={{-6,-60},{14,-40}})));
  ElectrochemicalReactor.MaterialDomain.Flows.EnvironmentL env_cathode(specRec=
        Data.UserInput.Example_AlkalineWaterElectrolysis.AWEspec)
    annotation (Placement(transformation(extent={{-6,-34},{14,-14}})));
  eCherry_Library.ElectrochemicalReactor.Electrolytes.Thermal.Electrolyte_Batch_1D_L_Thermal_nLayers
    Catholyte1D_nLayers(
    EBRec=Data.UserInput.Example_AlkalineWaterElectrolysis.EBdummy,
    specRec=Data.UserInput.Example_AlkalineWaterElectrolysis.AWEspec,
    GeoRec=Data.UserInput.Example_AlkalineWaterElectrolysis.GeoRec,
    CondRec=Data.UserInput.Example_AlkalineWaterElectrolysis.CondRec,
    X_difflayer=Data.UserInput.Example_AlkalineWaterElectrolysis.X_difflayer,
    c0=Data.UserInput.Example_AlkalineWaterElectrolysis.c0,
    QFlow_shunt=0,
    kappa_con=74)
    annotation (Placement(transformation(extent={{78,-96},{98,-76}})));
  eCherry_Library.ElectrochemicalReactor.Electrolytes.Thermal.Electrolyte_Batch_1D_L_Thermal_nLayers
    Anolyte1D_nLayers(
    EBRec=Data.UserInput.Example_AlkalineWaterElectrolysis.EBdummy,
    specRec=Data.UserInput.Example_AlkalineWaterElectrolysis.AWEspec,
    GeoRec=Data.UserInput.Example_AlkalineWaterElectrolysis.GeoRec,
    CondRec=Data.UserInput.Example_AlkalineWaterElectrolysis.CondRec,
    X_difflayer=Data.UserInput.Example_AlkalineWaterElectrolysis.X_difflayer,
    c0=Data.UserInput.Example_AlkalineWaterElectrolysis.c0,
    QFlow_shunt=0,
    kappa_con=85)
    annotation (Placement(transformation(extent={{-208,-88},{-188,-68}})));
  eCherry_Library.ElectrochemicalReactor.ThermalDomain.Source.ExternalHeating
    externalHeatingAnode(EBRec=Data.UserInput.Example_AlkalineWaterElectrolysis.EBdummy)
    annotation (Placement(transformation(extent={{-266,-122},{-246,-102}})));
  eCherry_Library.ElectrochemicalReactor.ThermalDomain.Source.ExternalHeating
    externalHeatingCathode(EBRec=Data.UserInput.Example_AlkalineWaterElectrolysis.EBdummy)
    annotation (Placement(transformation(extent={{142,-118},{162,-98}})));
equation
  Tdistr_all[1:n_slices] =Anolyte1D_nLayers.slices.T;
  Tdistr_all[n_slices+1] = Anolyte.T;
  Tdistr_all[n_slices+2] = Catholyte.T;
  Tdistr_all[n_slices+3:2*n_slices+2] =Catholyte1D_nLayers.slices.T;
  connect(Ground.p, Source.p) annotation (Line(points={{60,74},{60,76},{-38,76},
          {-38,52},{-44,52}},
                         color={0,0,255}));
  connect(Anode.p, Source.n) annotation (Line(points={{-246,-80},{-252,-80},{-252,
          52},{-64,52}},
                    color={0,0,255}));
  connect(Source.p,Cathode. n) annotation (Line(points={{-44,52},{-38,52},{-38,76},
          {44,76},{44,80},{142,80},{142,-86},{136,-86}},
                           color={0,0,255}));
  connect(membraneHydroxideTransport.anCon, Anolyte.rightFlow)
    annotation (Line(points={{-64,-70},{-90,-70}}, color={0,0,0}));
  connect(membraneHydroxideTransport.p, Anolyte.n)
    annotation (Line(points={{-64,-76},{-90,-76}}, color={0,0,255}));
  connect(Anolyte.outFlow,Flow_anode. convinFlow)
    annotation (Line(points={{-100,-66},{-100,-60}},
                                                  color={0,0,0}));
  connect(Flow_anode.convoutFlow,env_anode. convFlow)
    annotation (Line(points={{-100,-40},{-100,-34}},
                                                 color={0,0,0}));
  connect(diffusiveConnectionLayerAnolyte.rightFlow, Anolyte.leftFlow)
    annotation (Line(points={{-146,-46},{-120,-46},{-120,-70},{-110,-70}},
        color={0,0,0}));
  connect(Catholyte.outFlow, Flow_cathode.convinFlow)
    annotation (Line(points={{4,-66},{4,-60}}, color={0,0,0}));
  connect(Flow_cathode.convoutFlow, env_cathode.convFlow)
    annotation (Line(points={{4,-40},{4,-34}}, color={0,0,0}));
  connect(AnodeInflow.convFlow, Anolyte.inFlow)
    annotation (Line(points={{-100,-98},{-100,-86}}, color={0,0,0}));
  connect(membraneHydroxideTransport.n, Catholyte.p)
    annotation (Line(points={{-44,-76},{-6,-76}}, color={0,0,255}));
  connect(membraneHydroxideTransport.catCon, Catholyte.leftFlow) annotation (
      Line(points={{-44,-70},{-25.4,-70},{-25.4,-70},{-6,-70}}, color={0,0,0}));
  connect(Catholyte.rightFlow, diffusiveConnectionLayerCatholyte.leftFlow)
    annotation (Line(points={{14,-70},{42,-70},{42,-48.5},{45.6,-48.5}}, color=
          {0,0,0}));
  connect(CathodeInflow.convFlow, Catholyte.inFlow)
    annotation (Line(points={{4,-98},{4,-86}}, color={0,0,0}));
  connect(Catholyte1D_nLayers.rightFlow, Cathode.flowFromElectrolyte)
    annotation (Line(points={{98,-80},{110,-80},{110,-66},{126,-66},{126,-76}},
        color={0,0,0}));
  connect(Catholyte1D_nLayers.n, Cathode.p) annotation (Line(points={{98,-86},{108,
          -86},{108,-86},{116,-86}},           color={0,0,255}));
  connect(Catholyte1D_nLayers.p, Catholyte.n) annotation (Line(points={{78,-86},
          {20,-86},{20,-76},{14,-76}}, color={0,0,255}));
  connect(diffusiveConnectionLayerCatholyte.rightFlow, Catholyte1D_nLayers.leftFlow)
    annotation (Line(points={{66,-48},{76,-48},{76,-70},{70,-70},{70,-80},{78,-80}},
        color={0,0,0}));
  connect(Anode.n, Anolyte1D_nLayers.p) annotation (Line(points={{-226,-80},{-226,
          -78},{-208,-78}}, color={0,0,255}));
  connect(Anolyte1D_nLayers.leftFlow, Anode.flowFromElectrolyte) annotation (
      Line(points={{-208,-72},{-220,-72},{-220,-60},{-236,-60},{-236,-70}},
        color={0,0,0}));
  connect(Anolyte1D_nLayers.rightFlow, diffusiveConnectionLayerAnolyte.leftFlow)
    annotation (Line(points={{-188,-72},{-172,-72},{-172,-46.5},{-166.4,-46.5}},
        color={0,0,0}));
  connect(Anolyte1D_nLayers.n, Anolyte.p) annotation (Line(points={{-188,-78},{
          -148,-78},{-148,-76},{-110,-76}}, color={0,0,255}));
  connect(externalHeatingAnode.heatFlow, Anode.leftHeatFlow) annotation (Line(
        points={{-256,-102},{-260,-102},{-260,-84},{-254,-84},{-254,-84.6},{-246,
          -84.6}}, color={0,0,0}));
  connect(Anode.rightHeatFlow, Anolyte1D_nLayers.leftHeatFlow) annotation (Line(
        points={{-226,-84.6},{-226,-83},{-207,-83}},     color={0,0,0}));
  connect(Anolyte1D_nLayers.rightHeatFlow, diffusiveConnectionLayerAnolyte.leftHeatFlow)
    annotation (Line(points={{-189,-83},{-184,-83},{-184,-84},{-178,-84},{-178,-56.6},
          {-166,-56.6}},    color={0,0,0}));
  connect(diffusiveConnectionLayerAnolyte.rightHeatFlow, Anolyte.leftHeatFlow)
    annotation (Line(points={{-146,-56.6},{-118,-56.6},{-118,-80.6},{-110,-80.6}},
        color={0,0,0}));
  connect(Anolyte.heatConvInFlow, AnodeInflow.convHeatFlow)
    annotation (Line(points={{-105,-87},{-105,-97}}, color={0,0,0}));
  connect(Catholyte.heatConvInFlow, CathodeInflow.convHeatFlow)
    annotation (Line(points={{-1,-87},{-1,-97}}, color={0,0,0}));
  connect(Anolyte.rightHeatFlow, membraneHydroxideTransport.leftHeatFlow)
    annotation (Line(points={{-90,-80.6},{-88,-80.6},{-88,-80.6},{-64,-80.6}},
        color={0,0,0}));
  connect(membraneHydroxideTransport.rightHeatFlow, Catholyte.leftHeatFlow)
    annotation (Line(points={{-44,-80.6},{-44,-80.6},{-6,-80.6}},     color={0,
          0,0}));
  connect(diffusiveConnectionLayerCatholyte.leftHeatFlow, Catholyte.rightHeatFlow)
    annotation (Line(points={{46,-58.6},{44,-58.6},{44,-80.6},{14,-80.6}},
                                                                         color=
          {0,0,0}));
  connect(diffusiveConnectionLayerCatholyte.rightHeatFlow, Catholyte1D_nLayers.leftHeatFlow)
    annotation (Line(points={{66,-58.6},{66,-56},{70,-56},{70,-68},{68,-68},{68,
          -91},{79,-91}}, color={0,0,0}));
  connect(Catholyte1D_nLayers.rightHeatFlow, Cathode.leftHeatFlow) annotation (
      Line(points={{97,-91},{106.5,-91},{106.5,-90.6},{116,-90.6}}, color={0,0,
          0}));
  connect(Cathode.rightHeatFlow, externalHeatingCathode.heatFlow) annotation (
      Line(points={{136,-90.6},{144.8,-90.6},{144.8,-98},{152,-98}},   color={0,
          0,0}));
  annotation (experiment(
      StopTime=5,
      __Dymola_NumberOfIntervals=20000,
      Tolerance=1e-05,
      __Dymola_Algorithm="Dassl"));
end Electrolyzer_Conti_1D_L_Thermal;
