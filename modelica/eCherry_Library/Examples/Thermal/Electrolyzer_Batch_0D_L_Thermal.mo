within eCherry_Library.Examples.Thermal;
model Electrolyzer_Batch_0D_L_Thermal
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
    annotation (Placement(transformation(extent={{-90,-30},{-70,-10}})));

  eCherry_Library.ElectrochemicalReactor.Electrodes.Electrode_Thermal Cathode(
    GeoRec=Data.UserInput.Example_AlkalineWaterElectrolysis.GeoRec,
    CondRec=Data.UserInput.Example_AlkalineWaterElectrolysis.CondRec,
    redeclare model ActivationOverpotentialModel =
        eCherry_Library.ElectrochemicalReactor.Electrodes.Electrochemistry.Activation_Overpotential.ActivationOverpotential,
    specRec=Data.UserInput.Example_AlkalineWaterElectrolysis.AWEspec,
    reac={Data.UserInput.Example_AlkalineWaterElectrolysis.HERdummy},
    Pi(each displayUnit="bar"),
    CathodeEl=true,
    EBRec=Data.UserInput.Example_AlkalineWaterElectrolysis.EBdummy)
    annotation (Placement(transformation(extent={{70,-30},{90,-10}})));

  eCherry_Library.ElectrochemicalReactor.Electrolytes.Thermal.Electrolyte_Batch_0D_L_Thermal
    Electrolyte(
    specRec=Data.UserInput.Example_AlkalineWaterElectrolysis.AWEspec,
    GeoRec=Data.UserInput.Example_AlkalineWaterElectrolysis.GeoRec,
    CondRec=Data.UserInput.Example_AlkalineWaterElectrolysis.CondRec,
    QFlow_shunt=0,
    c0=Data.UserInput.Example_AlkalineWaterElectrolysis.c0,
    EBRec=Data.UserInput.Example_AlkalineWaterElectrolysis.EBdummy)
    annotation (Placement(transformation(extent={{-10,-30},{10,-10}})));
  ElectrochemicalReactor.ThermalDomain.ConnectionLayers.ConnectionLayer_CompositeHT
    compositeConnectionLayerAnode(
    GeoRec=Data.UserInput.Example_AlkalineWaterElectrolysis.GeoRec,
    alpha=Data.UserInput.Example_AlkalineWaterElectrolysis.EBdummy.alpha_anode_electrolyte,
    epsilon1=1,
    epsilon2=1,
    useConvection=true,
    useConduction=false,
    useRadiation=false)
    annotation (Placement(transformation(extent={{-50,-50},{-30,-30}})));

  ElectrochemicalReactor.ThermalDomain.ConnectionLayers.ConnectionLayer_CompositeHT
    compositeConnectionLayerCathode(
    GeoRec=Data.UserInput.Example_AlkalineWaterElectrolysis.GeoRec,
    alpha=Data.UserInput.Example_AlkalineWaterElectrolysis.EBdummy.alpha_cathode_electrolyte,
    useConvection=true,
    useConduction=false,
    useRadiation=false)
    annotation (Placement(transformation(extent={{30,-50},{50,-30}})));

equation
  connect(Ground.p, Source.p) annotation (Line(points={{60,74},{36,74},{36,50},
          {10,50}},      color={0,0,255}));
  connect(Anode.p, Source.n) annotation (Line(points={{-90,-20},{-94,-20},{-94,
          50},{-10,50}},
                    color={0,0,255}));
  connect(Source.p,Cathode. n) annotation (Line(points={{10,50},{96,50},{96,-20},
          {90,-20}},       color={0,0,255}));
  connect(Electrolyte.n, Cathode.p)
    annotation (Line(points={{10,-20},{10,-24},{62,-24},{62,-20},{70,-20}},
                                                 color={0,0,255}));
  connect(Cathode.flowFromElectrolyte, Electrolyte.rightFlow) annotation (Line(
        points={{80,-10},{80,-4},{18,-4},{18,-14},{10,-14}},
                                                    color={0,0,0}));
  connect(Anode.n, Electrolyte.p)
    annotation (Line(points={{-70,-20},{-10,-20}}, color={0,0,255}));
  connect(Anode.rightHeatFlow, compositeConnectionLayerAnode.leftHeatFlow)
    annotation (Line(points={{-70,-24.6},{-70,-22},{-56,-22},{-56,-44},{-50,-44}},
        color={0,0,0}));
  connect(compositeConnectionLayerAnode.rightHeatFlow, Electrolyte.leftHeatFlow)
    annotation (Line(points={{-30,-44},{-18,-44},{-18,-24.6},{-10,-24.6}},
        color={0,0,0}));
  connect(Electrolyte.rightHeatFlow, compositeConnectionLayerCathode.leftHeatFlow)
    annotation (Line(points={{10,-24.6},{22,-24.6},{22,-44},{30,-44}},color={0,0,
          0}));
  connect(compositeConnectionLayerCathode.rightHeatFlow, Cathode.leftHeatFlow)
    annotation (Line(points={{50,-44},{62,-44},{62,-24.6},{70,-24.6}}, color={0,
          0,0}));
  connect(Anode.flowFromElectrolyte, Electrolyte.leftFlow) annotation (Line(
        points={{-80,-10},{-80,-4},{-18,-4},{-18,-14},{-10,-14}}, color={0,0,0}));
  annotation (experiment(
      StopTime=50,
      __Dymola_NumberOfIntervals=2000,
      Tolerance=1e-12));
end Electrolyzer_Batch_0D_L_Thermal;
