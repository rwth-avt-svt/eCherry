within eCherry_Library.Examples.Batch.Batch0D;
model Electrolyzer_Batch_0D_L
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
  eCherry_Library.ElectrochemicalReactor.Electrodes.Electrode_Planar Anode(
    P=100000,
    redeclare model ActivationOverpotentialModel =
        eCherry_Library.ElectrochemicalReactor.Electrodes.Electrochemistry.Activation_Overpotential.ActivationOverpotential,
   redeclare model TemperatureModel =
      Properties.TemperatureModels.TemperatureConstant,
    GeoRec=Data.UserInput.Example_AlkalineWaterElectrolysis.GeoRec,
    CondRec=Data.UserInput.Example_AlkalineWaterElectrolysis.CondRec,
    specRec=Data.UserInput.Example_AlkalineWaterElectrolysis.AWEspec,
    reac={Data.UserInput.Example_AlkalineWaterElectrolysis.OERdummy},
    Y=1,
    Z=1,
    Pi(each displayUnit="bar"),
    CathodeEl=false)
    annotation (Placement(transformation(extent={{-90,-30},{-70,-10}})));

  eCherry_Library.ElectrochemicalReactor.Electrodes.Electrode_Planar Cathode(
    P=100000,
    redeclare model TemperatureModel =
      Properties.TemperatureModels.TemperatureConstant,
    GeoRec=Data.UserInput.Example_AlkalineWaterElectrolysis.GeoRec,
    CondRec=Data.UserInput.Example_AlkalineWaterElectrolysis.CondRec,
    redeclare model ActivationOverpotentialModel =
        eCherry_Library.ElectrochemicalReactor.Electrodes.Electrochemistry.Activation_Overpotential.ActivationOverpotential,
    specRec=Data.UserInput.Example_AlkalineWaterElectrolysis.AWEspec,
    reac={Data.UserInput.Example_AlkalineWaterElectrolysis.HERdummy},
    Y=1,
    Z=1,
    Pi(each displayUnit="bar"),
    CathodeEl=true)
    annotation (Placement(transformation(extent={{70,-30},{90,-10}})));

  ElectrochemicalReactor.Electrolytes.Liquid.Electrolyte_Batch_0D_L Electrolyte(
    specRec=Data.UserInput.Example_AlkalineWaterElectrolysis.AWEspec,
    GeoRec=Data.UserInput.Example_AlkalineWaterElectrolysis.GeoRec,
    CondRec=Data.UserInput.Example_AlkalineWaterElectrolysis.CondRec,
    redeclare model TemperatureModel =
      Properties.TemperatureModels.TemperatureConstant,
    X=0.01,
    Y=1,
    Z=1,
    c0=Data.UserInput.Example_AlkalineWaterElectrolysis.c0)
    annotation (Placement(transformation(extent={{-12,-30},{8,-10}})));
equation
  connect(Ground.p, Source.p) annotation (Line(points={{60,74},{36,74},{36,50},
          {10,50}},      color={0,0,255}));
  connect(Anode.p, Source.n) annotation (Line(points={{-90,-20},{-96,-20},{-96,
          50},{-10,50}},
                    color={0,0,255}));
  connect(Source.p,Cathode. n) annotation (Line(points={{10,50},{92,50},{92,-20},
          {90,-20}},       color={0,0,255}));
  connect(Anode.n, Electrolyte.p)
    annotation (Line(points={{-70,-20},{-12,-20}}, color={0,0,255}));
  connect(Electrolyte.n, Cathode.p)
    annotation (Line(points={{8,-20},{40,-20},{40,-20},{70,-20}},
                                                 color={0,0,255}));
  connect(Cathode.flowFromElectrolyte, Electrolyte.rightFlow) annotation (Line(
        points={{80,-10},{80,-2},{8,-2},{8,-14}},   color={0,0,0}));
  connect(Electrolyte.leftFlow, Anode.flowFromElectrolyte) annotation (Line(
        points={{-12,-14},{-64,-14},{-64,-2},{-80,-2},{-80,-10}}, color={0,0,0}));
  connect(Anode.n, Electrolyte.p)
    annotation (Line(points={{-70,-20},{-12,-20}}, color={0,0,255}));
  annotation (experiment(
      StopTime=50,
      __Dymola_NumberOfIntervals=2000,
      Tolerance=1e-12));
end Electrolyzer_Batch_0D_L;
