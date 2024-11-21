within eCherry_Library.Examples.Thermal;
model Electrolyzer_Conti_1D_L_Thermal
 extends Modelica.Icons.Example;
 parameter Integer n_slices = 10;
Temperature Tdistr_all[2*n_slices+2];

  ElectrochemicalReactor.ElectricalDomain.Source.Potential_Source.Voltage_Fixed
    Source(GeoRec=Data.UserInput.Example_AlkalineWaterElectrolysis.GeoRec,
      Ufixed=-2.3) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={-50,50})));
  Modelica.Electrical.Analog.Basic.Ground Ground
    annotation (Placement(transformation(extent={{70,50},{50,70}})));
  eCherry_Library.ElectrochemicalReactor.Electrodes.Electrode_Thermal Anode(
    GeoRec=Data.UserInput.Example_AlkalineWaterElectrolysis.GeoRec,
    CondRec=Data.UserInput.Example_AlkalineWaterElectrolysis.CondRec,
    specRec=Data.UserInput.Example_AlkalineWaterElectrolysis.AWEspec,
    reac={Data.UserInput.Example_AlkalineWaterElectrolysis.OERdummy},
    Pi(displayUnit="bar"),
    CathodeEl=false,
    EBRec=Data.UserInput.Example_AlkalineWaterElectrolysis.EBdummy)
    annotation (Placement(transformation(extent={{-190,-40},{-170,-20}})));

  eCherry_Library.ElectrochemicalReactor.Electrodes.Electrode_Thermal Cathode(
    GeoRec=Data.UserInput.Example_AlkalineWaterElectrolysis.GeoRec,
    CondRec=Data.UserInput.Example_AlkalineWaterElectrolysis.CondRec,
    specRec=Data.UserInput.Example_AlkalineWaterElectrolysis.AWEspec,
    reac={Data.UserInput.Example_AlkalineWaterElectrolysis.HERdummy},
    Pi(displayUnit="bar"),
    CathodeEl=true,
    EBRec=Data.UserInput.Example_AlkalineWaterElectrolysis.EBdummy)
    annotation (Placement(transformation(extent={{170,-40},{190,-20}})));

  eCherry_Library.ElectrochemicalReactor.ThermalDomain.Material_Thermal.ConnectionLayer_Diffusive_Thermal
    diffusiveConnectionLayerAnolyte(
    specRec=Data.UserInput.Example_AlkalineWaterElectrolysis.AWEspec,
    GeoRec=Data.UserInput.Example_AlkalineWaterElectrolysis.GeoRec,
    dX=1e-7) annotation (Placement(transformation(extent={{-110,-20},{-90,0}})));
  eCherry_Library.ElectrochemicalReactor.ThermalDomain.Material_Thermal.ConnectionLayer_Diffusive_Thermal
    diffusiveConnectionLayerCatholyte(
    specRec=Data.UserInput.Example_AlkalineWaterElectrolysis.AWEspec,
    GeoRec=Data.UserInput.Example_AlkalineWaterElectrolysis.GeoRec,
    dX=1e-7) annotation (Placement(transformation(extent={{90,-20},{110,0}})));
  eCherry_Library.ElectrochemicalReactor.Separators.Thermal.Diaphragm_Hydroxide_Thermal
    membraneHydroxideTransport(
    specRec=Data.UserInput.Example_AlkalineWaterElectrolysis.AWEspec,
    GeoRec=Data.UserInput.Example_AlkalineWaterElectrolysis.GeoRec,
    CondRec=Data.UserInput.Example_AlkalineWaterElectrolysis.CondRec,
    X=5e-6,
    kappa=38,
    EBRec=Data.UserInput.Example_AlkalineWaterElectrolysis.EBdummy)
    annotation (Placement(transformation(extent={{-10,-40},{10,-20}})));
  eCherry_Library.ElectrochemicalReactor.Electrolytes.Thermal.Electrolyte_Conti_0D_L_Thermal
    Anolyte(
    specRec=Data.UserInput.Example_AlkalineWaterElectrolysis.AWEspec,
    c0=Data.UserInput.Example_AlkalineWaterElectrolysis.c0,
    GeoRec=Data.UserInput.Example_AlkalineWaterElectrolysis.GeoRec,
    CondRec=Data.UserInput.Example_AlkalineWaterElectrolysis.CondRec,
    j(start=10000),
    QFlow_shunt=0,
    EBRec=Data.UserInput.Example_AlkalineWaterElectrolysis.EBdummy)
    annotation (Placement(transformation(extent={{-70,-40},{-50,-20}})));
  ElectrochemicalReactor.ThermalDomain.Material_Thermal.Material_Simple_InFlow_Thermal
    AnodeInflow(
    specRec=Data.UserInput.Example_AlkalineWaterElectrolysis.AWEspec,
    molFlow_vec=Data.UserInput.Example_AlkalineWaterElectrolysis.c0*0.05,
    EBRec=Data.UserInput.Example_AlkalineWaterElectrolysis.EBdummy)
    annotation (Placement(transformation(extent={{-70,-78},{-50,-58}})));
  ElectrochemicalReactor.MaterialDomain.Flows.Material_Simple_ConnectingFlow
    Flow_anode(specRec=Data.UserInput.Example_AlkalineWaterElectrolysis.AWEspec)
    annotation (Placement(transformation(extent={{-70,-20},{-50,0}})));
  ElectrochemicalReactor.MaterialDomain.Flows.Environment env_anode(specRec=
        Data.UserInput.Example_AlkalineWaterElectrolysis.AWEspec)
    annotation (Placement(transformation(extent={{-70,10},{-50,30}})));
  eCherry_Library.ElectrochemicalReactor.Electrolytes.Thermal.Electrolyte_Conti_0D_L_Thermal
    Catholyte(
    specRec=Data.UserInput.Example_AlkalineWaterElectrolysis.AWEspec,
    c0=Data.UserInput.Example_AlkalineWaterElectrolysis.c0,
    GeoRec=Data.UserInput.Example_AlkalineWaterElectrolysis.GeoRec,
    CondRec=Data.UserInput.Example_AlkalineWaterElectrolysis.CondRec,
    j(start=10000),
    QFlow_shunt=0,
    EBRec=Data.UserInput.Example_AlkalineWaterElectrolysis.EBdummy)
    annotation (Placement(transformation(extent={{50,-40},{70,-20}})));
  ElectrochemicalReactor.ThermalDomain.Material_Thermal.Material_Simple_InFlow_Thermal
    CathodeInflow(
    specRec=Data.UserInput.Example_AlkalineWaterElectrolysis.AWEspec,
    molFlow_vec=Data.UserInput.Example_AlkalineWaterElectrolysis.c0*0.05,
    EBRec=Data.UserInput.Example_AlkalineWaterElectrolysis.EBdummy)
    annotation (Placement(transformation(extent={{50,-76},{70,-56}})));
  ElectrochemicalReactor.MaterialDomain.Flows.Material_Simple_ConnectingFlow
    Flow_cathode(specRec=Data.UserInput.Example_AlkalineWaterElectrolysis.AWEspec)
    annotation (Placement(transformation(extent={{50,-20},{70,0}})));
  ElectrochemicalReactor.MaterialDomain.Flows.Environment env_cathode(specRec=
        Data.UserInput.Example_AlkalineWaterElectrolysis.AWEspec)
    annotation (Placement(transformation(extent={{50,10},{70,30}})));
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
    annotation (Placement(transformation(extent={{120,-40},{140,-20}})));
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
    annotation (Placement(transformation(extent={{-140,-40},{-120,-20}})));
  eCherry_Library.ElectrochemicalReactor.ThermalDomain.Source.ExternalHeating_TFixed
    externalHeatingAnode(EBRec=Data.UserInput.Example_AlkalineWaterElectrolysis.EBdummy)
    annotation (Placement(transformation(extent={{-250,-80},{-230,-60}})));
  eCherry_Library.ElectrochemicalReactor.ThermalDomain.Source.ExternalHeating_TFixed
    externalHeatingCathode(EBRec=Data.UserInput.Example_AlkalineWaterElectrolysis.EBdummy)
    annotation (Placement(transformation(extent={{250,-80},{270,-60}})));
  ElectrochemicalReactor.ThermalDomain.ConnectionLayers.ConnectionLayer_CompositeHT
    compositeConnectionLayer4(
    GeoRec=Data.UserInput.Example_AlkalineWaterElectrolysis.GeoRec,
    alpha=Data.UserInput.Example_AlkalineWaterElectrolysis.EBdummy.alpha_anode_externalHeating,
    useConvection=true)
    annotation (Placement(transformation(extent={{-220,-70},{-200,-50}})));

  ElectrochemicalReactor.ThermalDomain.ConnectionLayers.ConnectionLayer_CompositeHT
    compositeConnectionLayer(
    GeoRec=Data.UserInput.Example_AlkalineWaterElectrolysis.GeoRec,
    alpha=Data.UserInput.Example_AlkalineWaterElectrolysis.EBdummy.alpha_anode_electrolyte,
    useConvection=true)
    annotation (Placement(transformation(extent={{-160,-80},{-140,-60}})));

  ElectrochemicalReactor.ThermalDomain.ConnectionLayers.ConnectionLayer_CompositeHT
    compositeConnectionLayer2(
    GeoRec=Data.UserInput.Example_AlkalineWaterElectrolysis.GeoRec,
    alpha=Data.UserInput.Example_AlkalineWaterElectrolysis.EBdummy.alpha_membrane_anolyte,
    useConvection=true)
    annotation (Placement(transformation(extent={{-40,-60},{-20,-40}})));

  ElectrochemicalReactor.ThermalDomain.ConnectionLayers.ConnectionLayer_CompositeHT
    compositeConnectionLayer3(
    GeoRec=Data.UserInput.Example_AlkalineWaterElectrolysis.GeoRec,
    alpha=Data.UserInput.Example_AlkalineWaterElectrolysis.EBdummy.alpha_membrane_catholyte,
    useConvection=true)
    annotation (Placement(transformation(extent={{20,-60},{40,-40}})));

  ElectrochemicalReactor.ThermalDomain.ConnectionLayers.ConnectionLayer_CompositeHT
    compositeConnectionLayer1(
    GeoRec=Data.UserInput.Example_AlkalineWaterElectrolysis.GeoRec,
    alpha=Data.UserInput.Example_AlkalineWaterElectrolysis.EBdummy.alpha_cathode_electrolyte,
    useConvection=true)
    annotation (Placement(transformation(extent={{150,-80},{170,-60}})));

  ElectrochemicalReactor.ThermalDomain.ConnectionLayers.ConnectionLayer_CompositeHT
    compositeConnectionLayer5(
    GeoRec=Data.UserInput.Example_AlkalineWaterElectrolysis.GeoRec,
    alpha=Data.UserInput.Example_AlkalineWaterElectrolysis.EBdummy.alpha_cathode_externalHeating,
    useConvection=true)
    annotation (Placement(transformation(extent={{200,-70},{220,-50}})));

equation
  Tdistr_all[1:n_slices] =Anolyte1D_nLayers.slices.T;
  Tdistr_all[n_slices+1] = Anolyte.T;
  Tdistr_all[n_slices+2] = Catholyte.T;
  Tdistr_all[n_slices+3:2*n_slices+2] =Catholyte1D_nLayers.slices.T;
  connect(Ground.p, Source.p) annotation (Line(points={{60,70},{60,72},{-36,72},
          {-36,50},{-40,50}},
                         color={0,0,255}));
  connect(Anode.p, Source.n) annotation (Line(points={{-190,-30},{-197,-30},{
          -197,50},{-60,50}},
                    color={0,0,255}));
  connect(Source.p,Cathode. n) annotation (Line(points={{-40,50},{43,50},{43,33},
          {75,33},{75,-30},{190,-30}},
                           color={0,0,255}));
  connect(membraneHydroxideTransport.anCon, Anolyte.rightFlow)
    annotation (Line(points={{-10,-24},{-26,-24},{-26,-18},{-33,-18},{-33,-24},
          {-50,-24}},                              color={0,0,0}));
  connect(membraneHydroxideTransport.p, Anolyte.n)
    annotation (Line(points={{-10,-30},{-50,-30}}, color={0,0,255}));
  connect(Anolyte.outFlow,Flow_anode. convinFlow)
    annotation (Line(points={{-60,-20},{-60,-20}},color={0,0,0}));
  connect(Flow_anode.convoutFlow,env_anode. convFlow)
    annotation (Line(points={{-60,0},{-60,10}},  color={0,0,0}));
  connect(diffusiveConnectionLayerAnolyte.rightFlow, Anolyte.leftFlow)
    annotation (Line(points={{-90,-4},{-77,-4},{-77,-24},{-70,-24}},
        color={0,0,0}));
  connect(Catholyte.outFlow, Flow_cathode.convinFlow)
    annotation (Line(points={{60,-20},{60,-20}},
                                               color={0,0,0}));
  connect(Flow_cathode.convoutFlow, env_cathode.convFlow)
    annotation (Line(points={{60,0},{60,10}},  color={0,0,0}));
  connect(AnodeInflow.convFlow, Anolyte.inFlow)
    annotation (Line(points={{-60,-58},{-60,-40}},   color={0,0,0}));
  connect(membraneHydroxideTransport.n, Catholyte.p)
    annotation (Line(points={{10,-30},{50,-30}},  color={0,0,255}));
  connect(membraneHydroxideTransport.catCon, Catholyte.leftFlow) annotation (
      Line(points={{10,-24},{20,-24},{20,-17},{31,-17},{31,-24},{50,-24}},
                                                                color={0,0,0}));
  connect(Catholyte.rightFlow, diffusiveConnectionLayerCatholyte.leftFlow)
    annotation (Line(points={{70,-24},{82.2,-24},{82.2,-4.5},{89.6,-4.5}},
                                                                         color=
          {0,0,0}));
  connect(CathodeInflow.convFlow, Catholyte.inFlow)
    annotation (Line(points={{60,-56},{60,-40}},
                                               color={0,0,0}));
  connect(Catholyte1D_nLayers.rightFlow, Cathode.flowFromElectrolyte)
    annotation (Line(points={{140,-24},{160,-24},{160,-20},{180,-20}},
        color={0,0,0}));
  connect(Catholyte1D_nLayers.n, Cathode.p) annotation (Line(points={{140,-30},
          {170,-30}},                          color={0,0,255}));
  connect(Catholyte1D_nLayers.p, Catholyte.n) annotation (Line(points={{120,-30},
          {70,-30}},                   color={0,0,255}));
  connect(diffusiveConnectionLayerCatholyte.rightFlow, Catholyte1D_nLayers.leftFlow)
    annotation (Line(points={{110,-4},{120,-4},{120,-24}},
        color={0,0,0}));
  connect(Anode.n, Anolyte1D_nLayers.p) annotation (Line(points={{-170,-30},{
          -140,-30}},       color={0,0,255}));
  connect(Anolyte1D_nLayers.leftFlow, Anode.flowFromElectrolyte) annotation (
      Line(points={{-140,-24},{-160,-24},{-160,-20},{-180,-20}},
        color={0,0,0}));
  connect(Anolyte1D_nLayers.rightFlow, diffusiveConnectionLayerAnolyte.leftFlow)
    annotation (Line(points={{-120,-24},{-120,-4.5},{-110.4,-4.5}},
        color={0,0,0}));
  connect(Anolyte1D_nLayers.n, Anolyte.p) annotation (Line(points={{-120,-30},{
          -120,-31},{-70,-31},{-70,-30}},   color={0,0,255}));
  connect(Anolyte1D_nLayers.rightHeatFlow, diffusiveConnectionLayerAnolyte.leftHeatFlow)
    annotation (Line(points={{-121,-35},{-103.5,-35},{-103.5,-20.5},{-105.5,
          -20.5},{-105.5,-14},{-110,-14}},
                            color={0,0,0}));
  connect(diffusiveConnectionLayerAnolyte.rightHeatFlow, Anolyte.leftHeatFlow)
    annotation (Line(points={{-90,-14},{-90,-34.6},{-70,-34.6}},
        color={0,0,0}));
  connect(Anolyte.heatConvInFlow, AnodeInflow.convHeatFlow)
    annotation (Line(points={{-65,-41},{-64,-41},{-64,-52},{-65,-52},{-65,-57}},
                                                     color={0,0,0}));
  connect(Catholyte.heatConvInFlow, CathodeInflow.convHeatFlow)
    annotation (Line(points={{55,-41},{56,-41},{56,-50},{55,-50},{55,-55}},
                                                 color={0,0,0}));
  connect(diffusiveConnectionLayerCatholyte.leftHeatFlow, Catholyte.rightHeatFlow)
    annotation (Line(points={{90,-14},{84,-14},{84,-34.6},{70,-34.6}},   color=
          {0,0,0}));
  connect(diffusiveConnectionLayerCatholyte.rightHeatFlow, Catholyte1D_nLayers.leftHeatFlow)
    annotation (Line(points={{110,-14},{118.5,-14},{118.5,-20.5},{120.5,-20.5},
          {120.5,-35},{121,-35}},
                          color={0,0,0}));
  connect(externalHeatingAnode.heatFlow, compositeConnectionLayer4.leftHeatFlow)
    annotation (Line(points={{-240,-60},{-221,-60},{-221,-64},{-220,-64}},
        color={0,0,0}));
  connect(compositeConnectionLayer4.rightHeatFlow, Anode.leftHeatFlow)
    annotation (Line(points={{-200,-64},{-196,-64},{-196,-62},{-192,-62},{-192,
          -34.6},{-190,-34.6}},
        color={0,0,0}));
  connect(Anode.rightHeatFlow, compositeConnectionLayer.leftHeatFlow)
    annotation (Line(points={{-170,-34.6},{-166,-34.6},{-166,-74},{-160,-74}},
                                                        color={0,0,0}));
  connect(compositeConnectionLayer.rightHeatFlow, Anolyte1D_nLayers.leftHeatFlow)
    annotation (Line(points={{-140,-74},{-142,-74},{-142,-35},{-139,-35}},
        color={0,0,0}));
  connect(Cathode.rightHeatFlow, compositeConnectionLayer5.leftHeatFlow)
    annotation (Line(points={{190,-34.6},{198,-34.6},{198,-42},{200,-42},{200,
          -64}},
        color={0,0,0}));
  connect(compositeConnectionLayer5.rightHeatFlow, externalHeatingCathode.heatFlow)
    annotation (Line(points={{220,-64},{237,-64},{237,-60},{260,-60}},
        color={0,0,0}));
  connect(compositeConnectionLayer1.rightHeatFlow, Cathode.leftHeatFlow)
    annotation (Line(
      points={{170,-74},{168,-74},{168,-68},{166,-68},{166,-34.6},{170,-34.6}},
      color={0,0,0}));
  connect(compositeConnectionLayer1.leftHeatFlow, Catholyte1D_nLayers.rightHeatFlow)
    annotation (Line(points={{150,-74},{147,-74},{147,-39.5},{145,-39.5},{145,
          -35},{139,-35}},     color={0,0,0}));
  connect(Anolyte.rightHeatFlow, compositeConnectionLayer2.leftHeatFlow)
    annotation (Line(points={{-50,-34.6},{-39,-34.6},{-39,-54},{-40,-54}},
                                 color={0,0,0}));
  connect(compositeConnectionLayer2.rightHeatFlow, membraneHydroxideTransport.leftHeatFlow)
    annotation (Line(points={{-20,-54},{-10,-54},{-10,-34.6}},
                                  color={0,0,0}));
  connect(compositeConnectionLayer3.leftHeatFlow, membraneHydroxideTransport.rightHeatFlow)
    annotation (Line(points={{20,-54},{17,-54},{17,-41.7},{19,-41.7},{19,-34.6},
          {10,-34.6}},  color={0,0,0}));
  connect(compositeConnectionLayer3.rightHeatFlow, Catholyte.leftHeatFlow)
    annotation (Line(points={{40,-54},{51,-54},{51,-35.7},{49,-35.7},{49,-34.6},
          {50,-34.6}},
        color={0,0,0}));
  annotation (experiment(
      StopTime=5,
      __Dymola_NumberOfIntervals=20000,
      Tolerance=1e-05,
      __Dymola_Algorithm="Dassl"));
end Electrolyzer_Conti_1D_L_Thermal;
