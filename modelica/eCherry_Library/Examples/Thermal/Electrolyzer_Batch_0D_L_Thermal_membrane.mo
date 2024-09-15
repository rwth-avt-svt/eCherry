within eCherry_Library.Examples.Thermal;
model Electrolyzer_Batch_0D_L_Thermal_membrane
  extends Modelica.Icons.Example;
  ElectrochemicalReactor.ElectricalDomain.Source.Potential_Source.Voltage_Fixed
    Source(
    GeoRec=Data.UserInput.Example_AlkalineWaterElectrolysis.GeoRec,
    Ufixed=-2.5,
    Y=1,
    Z=1) annotation (Placement(transformation(
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
    Y=1,
    Z=1,
    Pi(displayUnit="bar"),
    CathodeEl=false,
    EBRec=Data.UserInput.Example_AlkalineWaterElectrolysis.EBdummy)
    annotation (Placement(transformation(extent={{-90,-30},{-70,-10}})));

  eCherry_Library.ElectrochemicalReactor.Electrodes.Electrode_Thermal Cathode(
    GeoRec=Data.UserInput.Example_AlkalineWaterElectrolysis.GeoRec,
    CondRec=Data.UserInput.Example_AlkalineWaterElectrolysis.CondRec,
    redeclare model ActivationOverpotentialModel =
        eCherry_Library.ElectrochemicalReactor.Electrodes.Electrochemistry.Activation_Overpotential.ActivationOverpotential,
    specRec=Data.UserInput.Example_AlkalineWaterElectrolysis.AWEspec,
    reac={Data.UserInput.Example_AlkalineWaterElectrolysis.HERdummy},
    Y=1,
    Z=1,
    Pi(displayUnit="bar"),
    CathodeEl=true,
    P=100000,
    EBRec=Data.UserInput.Example_AlkalineWaterElectrolysis.EBdummy)
    annotation (Placement(transformation(extent={{70,-30},{90,-10}})));

  eCherry_Library.ElectrochemicalReactor.Electrolytes.Thermal.Electrolyte_Batch_0D_L_Thermal
    Anolyte(
    specRec=Data.UserInput.Example_AlkalineWaterElectrolysis.AWEspec,
    GeoRec=Data.UserInput.Example_AlkalineWaterElectrolysis.GeoRec,
    CondRec=Data.UserInput.Example_AlkalineWaterElectrolysis.CondRec,
    X=0.01,
    Y=1,
    Z=1,
    QFlow_shunt=0,
    c0=Data.UserInput.Example_AlkalineWaterElectrolysis.c0,
    EBRec=Data.UserInput.Example_AlkalineWaterElectrolysis.EBdummy)
    annotation (Placement(transformation(extent={{-54,-30},{-34,-10}})));
  eCherry_Library.ElectrochemicalReactor.ThermalDomain.Source.ExternalHeating_TFixed
    externalHeatingAnode(EBRec=Data.UserInput.Example_AlkalineWaterElectrolysis.EBdummy)
    annotation (Placement(transformation(extent={{-98,-60},{-78,-40}})));
  eCherry_Library.ElectrochemicalReactor.ThermalDomain.Source.ExternalHeating_TFixed
    externalHeatingCathode(EBRec=Data.UserInput.Example_AlkalineWaterElectrolysis.EBdummy)
    annotation (Placement(transformation(extent={{76,-60},{96,-40}})));
  eCherry_Library.ElectrochemicalReactor.Electrolytes.Thermal.Electrolyte_Batch_0D_L_Thermal
    Catholyte(
    specRec=Data.UserInput.Example_AlkalineWaterElectrolysis.AWEspec,
    GeoRec=Data.UserInput.Example_AlkalineWaterElectrolysis.GeoRec,
    CondRec=Data.UserInput.Example_AlkalineWaterElectrolysis.CondRec,
    X=0.01,
    Y=1,
    Z=1,
    QFlow_shunt=0,
    c0=Data.UserInput.Example_AlkalineWaterElectrolysis.c0,
    EBRec=Data.UserInput.Example_AlkalineWaterElectrolysis.EBdummy)
    annotation (Placement(transformation(extent={{26,-30},{46,-10}})));
  eCherry_Library.ElectrochemicalReactor.Separators.Thermal.DiaphragmHydroxide_Thermal
    membraneHydroxideTransport(
    specRec=Data.UserInput.Example_AlkalineWaterElectrolysis.AWEspec,
    GeoRec=Data.UserInput.Example_AlkalineWaterElectrolysis.GeoRec,
    CondRec=Data.UserInput.Example_AlkalineWaterElectrolysis.CondRec,
    EBRec=Data.UserInput.Example_AlkalineWaterElectrolysis.EBdummy)
    annotation (Placement(transformation(extent={{-14,-28},{6,-8}})));
equation
  connect(Ground.p, Source.p) annotation (Line(points={{60,74},{36,74},{36,50},
          {10,50}},      color={0,0,255}));
  connect(Anode.p, Source.n) annotation (Line(points={{-90,-20},{-96,-20},{-96,
          50},{-10,50}},
                    color={0,0,255}));
  connect(Source.p,Cathode. n) annotation (Line(points={{10,50},{92,50},{92,-20},
          {90,-20}},       color={0,0,255}));
  connect(Anode.n, Anolyte.p)
    annotation (Line(points={{-70,-20},{-54,-20}}, color={0,0,255}));
  connect(Anolyte.leftFlow, Anode.flowFromElectrolyte) annotation (Line(points={{-54,-14},
          {-61.9,-14},{-61.9,-10},{-80,-10}},              color={0,0,0}));
  connect(Anode.n, Anolyte.p)
    annotation (Line(points={{-70,-20},{-54,-20}}, color={0,0,255}));
  connect(Anode.rightHeatFlow, Anolyte.leftHeatFlow) annotation (Line(points={{-70,
          -24.6},{-62.2,-24.6},{-62.2,-24.6},{-54,-24.6}},       color={0,0,0}));
  connect(externalHeatingAnode.heatFlow, Anode.leftHeatFlow) annotation (Line(
        points={{-88,-40},{-88,-34},{-90,-34},{-90,-24.6}}, color={0,0,0}));
  connect(externalHeatingCathode.heatFlow, Cathode.rightHeatFlow) annotation (
      Line(points={{86,-40},{86,-34},{90,-34},{90,-24.6}},     color={0,0,0}));
  connect(Catholyte.rightFlow, Cathode.flowFromElectrolyte) annotation (Line(
        points={{46,-14},{58.1,-14},{58.1,-10},{80,-10}},       color={0,0,0}));
  connect(Catholyte.n, Cathode.p) annotation (Line(points={{46,-20},{58.1,-20},
          {58.1,-20},{70,-20}},       color={0,0,255}));
  connect(Catholyte.rightHeatFlow, Cathode.leftHeatFlow)
    annotation (Line(points={{46,-24.6},{58,-24.6},{58,-24.6},{70,-24.6}},
                                                       color={0,0,0}));
  connect(Anolyte.rightFlow, membraneHydroxideTransport.anCon) annotation (Line(
        points={{-34,-14},{-32,-14},{-32,-12},{-14,-12}}, color={0,0,0}));
  connect(Anolyte.n, membraneHydroxideTransport.p) annotation (Line(points={{
          -34,-20},{-32,-20},{-32,-18},{-14,-18}}, color={0,0,255}));
  connect(Anolyte.rightHeatFlow, membraneHydroxideTransport.leftHeatFlow)
    annotation (Line(points={{-34,-24.6},{-24,-24.6},{-24,-22.6},{-14,-22.6}},
        color={0,0,0}));
  connect(membraneHydroxideTransport.catCon, Catholyte.leftFlow) annotation (
      Line(points={{6,-12},{8,-12},{8,-14},{26,-14}}, color={0,0,0}));
  connect(membraneHydroxideTransport.n, Catholyte.p) annotation (Line(points={{
          6,-18},{8,-18},{8,-20},{26,-20}}, color={0,0,255}));
  connect(membraneHydroxideTransport.rightHeatFlow, Catholyte.leftHeatFlow)
    annotation (Line(points={{6,-22.6},{15.8,-22.6},{15.8,-24.6},{26,-24.6}},
        color={0,0,0}));
  annotation (experiment(
      StopTime=50,
      __Dymola_NumberOfIntervals=2000,
      Tolerance=1e-12));
end Electrolyzer_Batch_0D_L_Thermal_membrane;
