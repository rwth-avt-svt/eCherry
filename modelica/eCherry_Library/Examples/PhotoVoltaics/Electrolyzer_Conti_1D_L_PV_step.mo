within eCherry_Library.Examples.PhotoVoltaics;
model Electrolyzer_Conti_1D_L_PV_step "AWE Electrolyzer + PV + Step-profile irradiance
  IF YOU SEE CROSSED OUT BOXES -> PV LIBRARY NOT LOADED"
 extends Modelica.Icons.Example;
 parameter Temperature T=300 "in K";
 parameter Length X_difflayer=100e-6;
 parameter Length Y=0.05;
 parameter Length Z=0.05;

  Modelica.Electrical.Analog.Basic.Ground Ground
    annotation (Placement(transformation(extent={{70,54},{50,74}})));
  eCherry_Library.ElectrochemicalReactor.Electrodes.Electrode_Planar Anode(
  redeclare model TemperatureModel =
      Properties.TemperatureModels.TemperatureConstant,
    GeoRec=Data.UserInput.Example_AlkalineWaterElectrolysis.GeoRec,
    CondRec=Data.UserInput.Example_AlkalineWaterElectrolysis.CondRec,
    specRec=Data.UserInput.Example_AlkalineWaterElectrolysis.AWEspec,
    Y=Y,
    Z=Z,
    reac={Data.UserInput.Example_AlkalineWaterElectrolysis.OERdummy},
    Pi(each displayUnit="bar"),
    CathodeEl=false)
    annotation (Placement(transformation(extent={{-246,-90},{-226,-70}})));
  eCherry_Library.ElectrochemicalReactor.Electrodes.Electrode_Planar Cathode(
  redeclare model TemperatureModel =
      Properties.TemperatureModels.TemperatureConstant,
    GeoRec=Data.UserInput.Example_AlkalineWaterElectrolysis.GeoRec,
    CondRec=Data.UserInput.Example_AlkalineWaterElectrolysis.CondRec,
    specRec=Data.UserInput.Example_AlkalineWaterElectrolysis.AWEspec,
    Y=Y,
    Z=Z,
    reac={Data.UserInput.Example_AlkalineWaterElectrolysis.HERdummy},
    Pi(each displayUnit="bar"),
    CathodeEl=true)
    annotation (Placement(transformation(extent={{116,-96},{136,-76}})));

  ElectrochemicalReactor.MaterialDomain.ConnectionLayers.ConnectionLayer_Diffusive
    diffusiveConnectionLayer(
    specRec=Data.UserInput.Example_AlkalineWaterElectrolysis.AWEspec,
    GeoRec=Data.UserInput.Example_AlkalineWaterElectrolysis.GeoRec,
    dX=1e-7)
    annotation (Placement(transformation(extent={{-166,-62},{-146,-42}})));
  ElectrochemicalReactor.MaterialDomain.ConnectionLayers.ConnectionLayer_Diffusive
    diffusiveConnectionLayer1(
    specRec=Data.UserInput.Example_AlkalineWaterElectrolysis.AWEspec,
    GeoRec=Data.UserInput.Example_AlkalineWaterElectrolysis.GeoRec,
    dX=1e-7) annotation (Placement(transformation(extent={{46,-64},{66,-44}})));
  ElectrochemicalReactor.Separators.Diaphragm_Hydroxide Diaphragm(
    Y=Y,
    Z=Z,
    specRec=Data.UserInput.Example_AlkalineWaterElectrolysis.AWEspec,
    GeoRec=Data.UserInput.Example_AlkalineWaterElectrolysis.GeoRec,
    CondRec=Data.UserInput.Example_AlkalineWaterElectrolysis.CondRec,
    X=5e-6,
    kappa=38)
    annotation (Placement(transformation(extent={{-64,-86},{-44,-66}})));
  ElectrochemicalReactor.Electrolytes.Liquid.Electrolyte_Conti_0D_L Anolyte(
  redeclare model TemperatureModel =
      Properties.TemperatureModels.TemperatureConstant,
    specRec=Data.UserInput.Example_AlkalineWaterElectrolysis.AWEspec,
    c0=Data.UserInput.Example_AlkalineWaterElectrolysis.c0,
    GeoRec=Data.UserInput.Example_AlkalineWaterElectrolysis.GeoRec,
    CondRec=Data.UserInput.Example_AlkalineWaterElectrolysis.CondRec,
    Y=Y,
    Z=Z,
    j(start=10000))
    annotation (Placement(transformation(extent={{-110,-86},{-90,-66}})));
  ElectrochemicalReactor.MaterialDomain.Flows.Material_Simple_InFlow_Fixed
    AnodeInflow(specRec=Data.UserInput.Example_AlkalineWaterElectrolysis.AWEspec,
      molFlow_vec=Data.UserInput.Example_AlkalineWaterElectrolysis.c0*0.05)
    annotation (Placement(transformation(extent={{-110,-118},{-90,-98}})));
  ElectrochemicalReactor.MaterialDomain.Flows.Material_Simple_ConnectingFlow
    Flow_anode(specRec=Data.UserInput.Example_AlkalineWaterElectrolysis.AWEspec)
    annotation (Placement(transformation(extent={{-110,-60},{-90,-40}})));
  ElectrochemicalReactor.MaterialDomain.Flows.Environment env_anode(specRec=
        Data.UserInput.Example_AlkalineWaterElectrolysis.AWEspec)
    annotation (Placement(transformation(extent={{-110,-34},{-90,-14}})));
  ElectrochemicalReactor.Electrolytes.Liquid.Electrolyte_Conti_0D_L Catholyte(
  redeclare model TemperatureModel =
      Properties.TemperatureModels.TemperatureConstant,
    specRec=Data.UserInput.Example_AlkalineWaterElectrolysis.AWEspec,
    c0=Data.UserInput.Example_AlkalineWaterElectrolysis.c0,
    GeoRec=Data.UserInput.Example_AlkalineWaterElectrolysis.GeoRec,
    CondRec=Data.UserInput.Example_AlkalineWaterElectrolysis.CondRec,
    Y=Y,
    Z=Z,
    j(start=10000))
    annotation (Placement(transformation(extent={{-6,-86},{14,-66}})));
  ElectrochemicalReactor.MaterialDomain.Flows.Material_Simple_InFlow_Fixed
    AnodeInflow1(specRec=Data.UserInput.Example_AlkalineWaterElectrolysis.AWEspec,
      molFlow_vec=Data.UserInput.Example_AlkalineWaterElectrolysis.c0*0.05)
    annotation (Placement(transformation(extent={{-6,-118},{14,-98}})));
  ElectrochemicalReactor.MaterialDomain.Flows.Material_Simple_ConnectingFlow
    Flow_anode1(specRec=Data.UserInput.Example_AlkalineWaterElectrolysis.AWEspec)
    annotation (Placement(transformation(extent={{-6,-60},{14,-40}})));
  ElectrochemicalReactor.MaterialDomain.Flows.Environment env_anode1(specRec=
        Data.UserInput.Example_AlkalineWaterElectrolysis.AWEspec)
    annotation (Placement(transformation(extent={{-6,-34},{14,-14}})));
  ElectrochemicalReactor.Electrolytes.Liquid.Electrolyte_Batch_1D_L_nLayers
    Diff_Catholyte(
    specRec=Data.UserInput.Example_AlkalineWaterElectrolysis.AWEspec,
    GeoRec=Data.UserInput.Example_AlkalineWaterElectrolysis.GeoRec,
    CondRec=Data.UserInput.Example_AlkalineWaterElectrolysis.CondRec,
    X_difflayer=X_difflayer,
    Y=Y,
    Z=Z,
    c0=Data.UserInput.Example_AlkalineWaterElectrolysis.c0,
    kappa_con=74)
    annotation (Placement(transformation(extent={{80,-96},{100,-76}})));
  ElectrochemicalReactor.Electrolytes.Liquid.Electrolyte_Batch_1D_L_nLayers
    Diff_Anolyte1(
    specRec=Data.UserInput.Example_AlkalineWaterElectrolysis.AWEspec,
    GeoRec=Data.UserInput.Example_AlkalineWaterElectrolysis.GeoRec,
    CondRec=Data.UserInput.Example_AlkalineWaterElectrolysis.CondRec,
    X_difflayer=X_difflayer,
    Y=Y,
    Z=Z,
    c0=Data.UserInput.Example_AlkalineWaterElectrolysis.c0,
    kappa_con=85)
    annotation (Placement(transformation(extent={{-208,-88},{-188,-68}})));
  PhotoVoltaics.Components.SimplePhotoVoltaics.SimpleCell cell(
      useConstantIrradiance=false, moduleData=moduleData) annotation (Placement(
        visible=true, transformation(
        origin={-110,30},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  PhotoVoltaics.Sources.Blocks.TriangleAndStep triangleAndStep(
    T=1,
    stepHeight=1000,
    triangleHeight=8,
    triangleOffset=-4)                                                                                                            annotation (
    Placement(visible = true, transformation(origin={-170,90},  extent={{-10,-10},
            {10,10}},                                                                            rotation = 0)));
  PhotoVoltaics.Components.SimplePhotoVoltaics.SimpleCell cell1(
      useConstantIrradiance=false, moduleData=moduleData) annotation (Placement(
        visible=true, transformation(
        origin={-90,30},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  PhotoVoltaics.Components.SimplePhotoVoltaics.SimpleCell cell2(
      useConstantIrradiance=false, moduleData=moduleData) annotation (Placement(
        visible=true, transformation(
        origin={-50,30},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  PhotoVoltaics.Components.SimplePhotoVoltaics.SimpleCell cell3(
      useConstantIrradiance=false, moduleData=moduleData) annotation (Placement(
        visible=true, transformation(
        origin={-30,30},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  Modelica.Electrical.Analog.Sensors.VoltageSensor voltageSensor
    annotation (Placement(transformation(extent={{-78,-14},{-58,6}})));
  parameter PhotoVoltaics.Records.SHARP_NU_S5_E3E moduleData annotation (
    Placement(visible = true, transformation(origin={144,80},   extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(Diaphragm.anCon,Anolyte. rightFlow)
    annotation (Line(points={{-64,-70},{-90,-70}}, color={0,0,0}));
  connect(Diaphragm.p,Anolyte. n)
    annotation (Line(points={{-64,-76},{-90,-76}}, color={0,0,255}));
  connect(Anolyte.outFlow,Flow_anode. convinFlow)
    annotation (Line(points={{-100,-66},{-100,-60}},
                                                  color={0,0,0}));
  connect(Flow_anode.convoutFlow,env_anode. convFlow)
    annotation (Line(points={{-100,-40},{-100,-34}},
                                                 color={0,0,0}));
  connect(diffusiveConnectionLayer.rightFlow, Anolyte.leftFlow) annotation (
      Line(points={{-146,-46},{-120,-46},{-120,-70},{-110,-70}},   color={0,0,0}));
  connect(Catholyte.outFlow, Flow_anode1.convinFlow)
    annotation (Line(points={{4,-66},{4,-60}}, color={0,0,0}));
  connect(Flow_anode1.convoutFlow, env_anode1.convFlow)
    annotation (Line(points={{4,-40},{4,-34}}, color={0,0,0}));
  connect(AnodeInflow.convFlow, Anolyte.inFlow)
    annotation (Line(points={{-100,-98},{-100,-86}}, color={0,0,0}));
  connect(Diaphragm.n, Catholyte.p)
    annotation (Line(points={{-44,-76},{-6,-76}}, color={0,0,255}));
  connect(Diaphragm.catCon, Catholyte.leftFlow) annotation (Line(points={{-44,
          -70},{-25.4,-70},{-25.4,-70},{-6,-70}}, color={0,0,0}));
  connect(Catholyte.rightFlow, diffusiveConnectionLayer1.leftFlow) annotation (
      Line(points={{14,-70},{42,-70},{42,-48.5},{45.6,-48.5}}, color={0,0,0}));
  connect(AnodeInflow1.convFlow, Catholyte.inFlow)
    annotation (Line(points={{4,-98},{4,-86}}, color={0,0,0}));
  connect(Diff_Catholyte.rightFlow, Cathode.flowFromElectrolyte) annotation (
      Line(points={{100,-80},{110,-80},{110,-66},{126,-66},{126,-76}},color={0,
          0,0}));
  connect(Diff_Catholyte.n, Cathode.p)
    annotation (Line(points={{100,-86},{116,-86}},color={0,0,255}));
  connect(Diff_Catholyte.p, Catholyte.n) annotation (Line(points={{80,-86},{20,-86},
          {20,-76},{14,-76}},      color={0,0,255}));
  connect(diffusiveConnectionLayer1.rightFlow, Diff_Catholyte.leftFlow)
    annotation (Line(points={{66,-48},{76,-48},{76,-70},{70,-70},{70,-80},{80,-80}},
                 color={0,0,0}));
  connect(Anode.n, Diff_Anolyte1.p) annotation (Line(points={{-226,-80},{-226,
          -78},{-208,-78}}, color={0,0,255}));
  connect(Diff_Anolyte1.leftFlow, Anode.flowFromElectrolyte) annotation (Line(
        points={{-208,-72},{-220,-72},{-220,-60},{-236,-60},{-236,-70}}, color=
          {0,0,0}));
  connect(Diff_Anolyte1.rightFlow, diffusiveConnectionLayer.leftFlow)
    annotation (Line(points={{-188,-72},{-172,-72},{-172,-46.5},{-166.4,-46.5}},
                                  color={0,0,0}));
  connect(Diff_Anolyte1.n, Anolyte.p) annotation (Line(points={{-188,-78},{-148,
          -78},{-148,-76},{-110,-76}}, color={0,0,255}));
  connect(triangleAndStep.step,cell. variableIrradiance) annotation (
    Line(points={{-159,96},{-110,96},{-110,42}},            color = {0, 0, 127}));
  connect(cell.n, cell1.p)
    annotation (Line(points={{-100,30},{-100,30}}, color={0,0,255}));
  connect(cell1.n, cell2.p)
    annotation (Line(points={{-80,30},{-60,30}}, color={0,0,255}));
  connect(cell2.n, cell3.p)
    annotation (Line(points={{-40,30},{-40,30}}, color={0,0,255}));
  connect(cell3.n, Cathode.n) annotation (Line(points={{-20,30},{142,30},{142,-86},
          {136,-86}}, color={0,0,255}));
  connect(cell.p, Anode.p) annotation (Line(points={{-120,30},{-252,30},{-252,-80},
          {-246,-80}}, color={0,0,255}));
  connect(triangleAndStep.step, cell1.variableIrradiance)
    annotation (Line(points={{-159,96},{-90,96},{-90,42}}, color={0,0,127}));
  connect(cell2.variableIrradiance, cell.variableIrradiance) annotation (Line(
        points={{-50,42},{-50,50},{-110,50},{-110,42}}, color={0,0,127}));
  connect(cell3.variableIrradiance, cell.variableIrradiance) annotation (Line(
        points={{-30,42},{-30,50},{-110,50},{-110,42}}, color={0,0,127}));
  connect(cell3.n, Ground.p) annotation (Line(points={{-20,30},{76,30},{76,80},{
          60,80},{60,74}}, color={0,0,255}));
  connect(voltageSensor.p, cell.p) annotation (Line(points={{-78,-4},{-126,-4},{
          -126,30},{-120,30}}, color={0,0,255}));
  connect(voltageSensor.n, cell3.n) annotation (Line(points={{-58,-4},{-14,-4},{
          -14,30},{-20,30}}, color={0,0,255}));
  annotation (experiment(
      __Dymola_NumberOfIntervals=20000,
      Tolerance=1e-12,
      __Dymola_Algorithm="Dassl"));
end Electrolyzer_Conti_1D_L_PV_step;
