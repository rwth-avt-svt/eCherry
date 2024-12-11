within eCherry_Library.Examples.Thermal;
model Electrolyzer_Batch_0D_L_Thermal_membrane
  extends Modelica.Icons.Example;
  ElectrochemicalReactor.ElectricalDomain.Source.Potential_Source.Voltage_Fixed
    Source(GeoRec=Data.UserInput.Example_AlkalineWaterElectrolysis.GeoRec,
      Ufixed=-2.5) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={0,50})));
  Modelica.Electrical.Analog.Basic.Ground Ground
    annotation (Placement(transformation(extent={{70,54},{50,74}})));
  eCherry_Library.ElectrochemicalReactor.Electrodes.Electrode_Thermal Anode(
    redeclare model ActivationOverpotentialModel =
        eCherry_Library.ElectrochemicalReactor.Electrodes.Electrochemistry.Activation_Overpotential.ActivationOverpotential,
    GeoRec=Data.UserInput.Example_AlkalineWaterElectrolysis.GeoRec,
    CondRec=Data.UserInput.Example_AlkalineWaterElectrolysis.CondRec,
    specRec=Data.UserInput.Example_AlkalineWaterElectrolysis.AWEspec,
    reac={Data.UserInput.Example_AlkalineWaterElectrolysis.OERdummy},
    Pi(each displayUnit="bar"),
    CathodeEl=false,
    EBRec=Data.UserInput.Example_AlkalineWaterElectrolysis.EBdummy)
    annotation (Placement(transformation(extent={{-120,-30},{-100,-10}})));

  eCherry_Library.ElectrochemicalReactor.Electrodes.Electrode_Thermal Cathode(
    GeoRec=Data.UserInput.Example_AlkalineWaterElectrolysis.GeoRec,
    CondRec=Data.UserInput.Example_AlkalineWaterElectrolysis.CondRec,
    redeclare model ActivationOverpotentialModel =
        eCherry_Library.ElectrochemicalReactor.Electrodes.Electrochemistry.Activation_Overpotential.ActivationOverpotential,
    specRec=Data.UserInput.Example_AlkalineWaterElectrolysis.AWEspec,
    reac={Data.UserInput.Example_AlkalineWaterElectrolysis.HERdummy},
    Pi(each displayUnit="bar"),
    CathodeEl=true,
    P=100000,
    EBRec=Data.UserInput.Example_AlkalineWaterElectrolysis.EBdummy)
    annotation (Placement(transformation(extent={{100,-30},{120,-10}})));

  eCherry_Library.ElectrochemicalReactor.Electrolytes.Thermal.Electrolyte_Batch_0D_L_Thermal
    Anolyte(
    specRec=Data.UserInput.Example_AlkalineWaterElectrolysis.AWEspec,
    GeoRec=Data.UserInput.Example_AlkalineWaterElectrolysis.GeoRec,
    CondRec=Data.UserInput.Example_AlkalineWaterElectrolysis.CondRec,
    QFlow_shunt=0,
    c0=Data.UserInput.Example_AlkalineWaterElectrolysis.c0,
    EBRec=Data.UserInput.Example_AlkalineWaterElectrolysis.EBdummy)
    annotation (Placement(transformation(extent={{-60,-30},{-40,-10}})));
  eCherry_Library.ElectrochemicalReactor.ThermalDomain.Source.ExternalHeating_TFixed
    externalHeatingAnode(EBRec=Data.UserInput.Example_AlkalineWaterElectrolysis.EBdummy)
    annotation (Placement(transformation(extent={{-178,-80},{-158,-60}})));
  eCherry_Library.ElectrochemicalReactor.ThermalDomain.Source.ExternalHeating_TFixed
    externalHeatingCathode(EBRec=Data.UserInput.Example_AlkalineWaterElectrolysis.EBdummy)
    annotation (Placement(transformation(extent={{158,-80},{178,-60}})));
  eCherry_Library.ElectrochemicalReactor.Electrolytes.Thermal.Electrolyte_Batch_0D_L_Thermal
    Catholyte(
    specRec=Data.UserInput.Example_AlkalineWaterElectrolysis.AWEspec,
    GeoRec=Data.UserInput.Example_AlkalineWaterElectrolysis.GeoRec,
    CondRec=Data.UserInput.Example_AlkalineWaterElectrolysis.CondRec,
    QFlow_shunt=0,
    c0=Data.UserInput.Example_AlkalineWaterElectrolysis.c0,
    EBRec=Data.UserInput.Example_AlkalineWaterElectrolysis.EBdummy)
    annotation (Placement(transformation(extent={{40,-30},{60,-10}})));
  eCherry_Library.ElectrochemicalReactor.Separators.Thermal.Diaphragm_Hydroxide_Thermal
    membraneHydroxideTransport(
    specRec=Data.UserInput.Example_AlkalineWaterElectrolysis.AWEspec,
    GeoRec=Data.UserInput.Example_AlkalineWaterElectrolysis.GeoRec,
    CondRec=Data.UserInput.Example_AlkalineWaterElectrolysis.CondRec,
    EBRec=Data.UserInput.Example_AlkalineWaterElectrolysis.EBdummy)
    annotation (Placement(transformation(extent={{-10,-30},{10,-10}})));
  ElectrochemicalReactor.ThermalDomain.ConnectionLayers.ConnectionLayer_CompositeHT
    compositeConnectionLayer(
    GeoRec=Data.UserInput.Example_AlkalineWaterElectrolysis.GeoRec,
    alpha=Data.UserInput.Example_AlkalineWaterElectrolysis.EBdummy.alpha_anode_electrolyte,
    useConvection=true) annotation (Placement(transformation(extent={{-10,-10},
            {10,10}}, origin={-78,-48})));

  ElectrochemicalReactor.ThermalDomain.ConnectionLayers.ConnectionLayer_CompositeHT
    compositeConnectionLayer1(
    GeoRec=Data.UserInput.Example_AlkalineWaterElectrolysis.GeoRec,
    alpha=Data.UserInput.Example_AlkalineWaterElectrolysis.EBdummy.alpha_cathode_electrolyte,
    useConvection=true) annotation (Placement(transformation(extent={{-10,-10},
            {10,10}}, origin={80,-50})));

  ElectrochemicalReactor.ThermalDomain.ConnectionLayers.ConnectionLayer_CompositeHT
    compositeConnectionLayer2(
    GeoRec=Data.UserInput.Example_AlkalineWaterElectrolysis.GeoRec,
    alpha=Data.UserInput.Example_AlkalineWaterElectrolysis.EBdummy.alpha_membrane_anolyte,
    useConvection=true) annotation (Placement(transformation(extent={{-10,-10},
            {10,10}}, origin={-22,-50})));

  ElectrochemicalReactor.ThermalDomain.ConnectionLayers.ConnectionLayer_CompositeHT
    compositeConnectionLayer3(
    GeoRec=Data.UserInput.Example_AlkalineWaterElectrolysis.GeoRec,
    alpha=Data.UserInput.Example_AlkalineWaterElectrolysis.EBdummy.alpha_membrane_catholyte,
    useConvection=true) annotation (Placement(transformation(extent={{-10,-10},
            {10,10}}, origin={26,-50})));

  ElectrochemicalReactor.ThermalDomain.ConnectionLayers.ConnectionLayer_CompositeHT
    compositeConnectionLayer4(
    GeoRec=Data.UserInput.Example_AlkalineWaterElectrolysis.GeoRec,
    alpha=Data.UserInput.Example_AlkalineWaterElectrolysis.EBdummy.alpha_anode_externalHeating,
    useConvection=true) annotation (Placement(transformation(extent={{-10,-10},
            {10,10}}, origin={-148,-50})));

  ElectrochemicalReactor.ThermalDomain.ConnectionLayers.ConnectionLayer_CompositeHT
    compositeConnectionLayer5(
    GeoRec=Data.UserInput.Example_AlkalineWaterElectrolysis.GeoRec,
    alpha=Data.UserInput.Example_AlkalineWaterElectrolysis.EBdummy.alpha_cathode_externalHeating,
    useConvection=true) annotation (Placement(transformation(extent={{-10,-10},
            {10,10}}, origin={150,-48})));

equation
  connect(Ground.p, Source.p) annotation (Line(points={{60,74},{60,76},{16,76},
          {16,50},{10,50}},
                         color={0,0,255}));
  connect(Anode.p, Source.n) annotation (Line(points={{-120,-20},{-140,-20},{
          -140,48},{-76,48},{-76,50},{-10,50}},
                    color={0,0,255}));
  connect(Source.p,Cathode. n) annotation (Line(points={{10,50},{136,50},{136,
          -20},{120,-20}}, color={0,0,255}));
  connect(Anode.n, Anolyte.p)
    annotation (Line(points={{-100,-20},{-60,-20}},color={0,0,255}));
  connect(Anolyte.leftFlow, Anode.flowFromElectrolyte) annotation (Line(points={{-60,-14},
          {-96,-14},{-96,-2},{-110,-2},{-110,-10}},        color={0,0,0}));
  connect(Anode.n, Anolyte.p)
    annotation (Line(points={{-100,-20},{-60,-20}},color={0,0,255}));
  connect(Catholyte.rightFlow, Cathode.flowFromElectrolyte) annotation (Line(
        points={{60,-14},{98,-14},{98,-2},{110,-2},{110,-10}},  color={0,0,0}));
  connect(Catholyte.n, Cathode.p) annotation (Line(points={{60,-20},{100,-20}},
                                      color={0,0,255}));
  connect(Anolyte.rightFlow, membraneHydroxideTransport.anCon) annotation (Line(
        points={{-40,-14},{-10,-14}},                     color={0,0,0}));
  connect(Anolyte.n, membraneHydroxideTransport.p) annotation (Line(points={{-40,-20},
          {-10,-20}},                              color={0,0,255}));
  connect(membraneHydroxideTransport.catCon, Catholyte.leftFlow) annotation (
      Line(points={{9,-15},{24,-15},{24,-14},{40,-14}},
                                                      color={0,0,0}));
  connect(membraneHydroxideTransport.n, Catholyte.p) annotation (Line(points={{10,-20},
          {40,-20}},                        color={0,0,255}));
  connect(externalHeatingAnode.heatFlow, compositeConnectionLayer4.leftHeatFlow)
    annotation (Line(points={{-168,-60},{-158,-60},{-158,-54}}, color={0,0,0}));
  connect(compositeConnectionLayer4.rightHeatFlow, Anode.leftHeatFlow)
    annotation (Line(points={{-138,-54},{-130,-54},{-130,-24.6},{-120,-24.6}},
        color={0,0,0}));
  connect(Anode.rightHeatFlow, compositeConnectionLayer.leftHeatFlow)
    annotation (Line(points={{-100,-24.6},{-98,-24.6},{-98,-28},{-96,-28},{-96,
          -52},{-88,-52}}, color={0,0,0}));
  connect(compositeConnectionLayer.rightHeatFlow, Anolyte.leftHeatFlow)
    annotation (Line(points={{-68,-52},{-62,-52},{-62,-34},{-64,-34},{-64,-24.6},
          {-60,-24.6}}, color={0,0,0}));
  connect(compositeConnectionLayer2.leftHeatFlow, Anolyte.rightHeatFlow)
    annotation (Line(points={{-32,-54},{-34,-54},{-34,-34},{-36,-34},{-36,-24},
          {-38,-24},{-38,-24.6},{-40,-24.6}}, color={0,0,0}));
  connect(compositeConnectionLayer2.rightHeatFlow, membraneHydroxideTransport.leftHeatFlow)
    annotation (Line(points={{-12,-54},{-4,-54},{-4,-30},{-10,-30},{-10,-24.6}},
        color={0,0,0}));
  connect(compositeConnectionLayer3.leftHeatFlow, membraneHydroxideTransport.rightHeatFlow)
    annotation (Line(points={{16,-54},{10,-54},{10,-34},{14,-34},{14,-24.6},{10,
          -24.6}}, color={0,0,0}));
  connect(compositeConnectionLayer3.rightHeatFlow, Catholyte.leftHeatFlow)
    annotation (Line(points={{36,-54},{40,-54},{40,-34},{32,-34},{32,-24.6},{40,
          -24.6}}, color={0,0,0}));
  connect(compositeConnectionLayer1.leftHeatFlow, Catholyte.rightHeatFlow)
    annotation (Line(points={{70,-54},{62,-54},{62,-34},{64,-34},{64,-24.6},{60,
          -24.6}}, color={0,0,0}));
  connect(compositeConnectionLayer1.rightHeatFlow, Cathode.leftHeatFlow)
    annotation (Line(points={{90,-54},{92,-54},{92,-50},{94,-50},{94,-36},{92,
          -36},{92,-24.6},{100,-24.6}}, color={0,0,0}));
  connect(compositeConnectionLayer5.leftHeatFlow, Cathode.rightHeatFlow)
    annotation (Line(points={{140,-52},{146,-52},{146,-30},{142,-30},{142,-24.6},
          {120,-24.6}}, color={0,0,0}));
  connect(compositeConnectionLayer5.rightHeatFlow, externalHeatingCathode.heatFlow)
    annotation (Line(points={{160,-52},{160,-60},{168,-60}}, color={0,0,0}));
  annotation (experiment(
      StopTime=50,
      __Dymola_NumberOfIntervals=2000,
      Tolerance=1e-12));
end Electrolyzer_Batch_0D_L_Thermal_membrane;
