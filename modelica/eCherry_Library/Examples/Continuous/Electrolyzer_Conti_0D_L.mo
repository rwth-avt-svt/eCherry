within eCherry_Library.Examples.Continuous;
model Electrolyzer_Conti_0D_L
 extends Modelica.Icons.Example;
 import Echery_library =
         eCherry_Library;

  Echery_library.ElectrochemicalReactor.ElectricalDomain.Source.Potential_Source.Voltage_Fixed
    Source(GeoRec=Echery_library.Data.UserInput.Example_AlkalineWaterElectrolysis.GeoRec,
      Ufixed=-2.5) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={0,50})));
  Modelica.Electrical.Analog.Basic.Ground Ground
    annotation (Placement(transformation(extent={{70,54},{50,74}})));
  eCherry_Library.ElectrochemicalReactor.Electrodes.Electrode_Planar Anode(
    P=100000,
    redeclare model TemperatureModel =
      Properties.TemperatureModels.TemperatureConstant,
    GeoRec=Echery_library.Data.UserInput.Example_AlkalineWaterElectrolysis.GeoRec,
    CondRec=Echery_library.Data.UserInput.Example_AlkalineWaterElectrolysis.CondRec,
    specRec=Echery_library.Data.UserInput.Example_AlkalineWaterElectrolysis.AWEspec,
    reac={Echery_library.Data.UserInput.Example_AlkalineWaterElectrolysis.OERdummy},
    Pi(each displayUnit="bar"),
    CathodeEl=false)
    annotation (Placement(transformation(extent={{-92,-30},{-72,-10}})));

  eCherry_Library.ElectrochemicalReactor.Electrodes.Electrode_Planar Cathode(
    P=100000,
    redeclare model TemperatureModel =
      Properties.TemperatureModels.TemperatureConstant,
    GeoRec=Echery_library.Data.UserInput.Example_AlkalineWaterElectrolysis.GeoRec,
    CondRec=Echery_library.Data.UserInput.Example_AlkalineWaterElectrolysis.CondRec,
    redeclare model ActivationOverpotentialModel =
        Echery_library.ElectrochemicalReactor.Electrodes.Electrochemistry.Activation_Overpotential.ActivationOverpotential,
    specRec=Echery_library.Data.UserInput.Example_AlkalineWaterElectrolysis.AWEspec,
    reac={Echery_library.Data.UserInput.Example_AlkalineWaterElectrolysis.HERdummy},
    Pi(each displayUnit="bar"),
    CathodeEl=true)
    annotation (Placement(transformation(extent={{70,-30},{90,-10}})));

  Echery_library.ElectrochemicalReactor.MaterialDomain.Flows.Material_Simple_InFlow_Fixed
    AnodeInflow(specRec=Echery_library.Data.UserInput.Example_AlkalineWaterElectrolysis.AWEspec,
      molFlow_vec=Echery_library.Data.UserInput.Example_AlkalineWaterElectrolysis.c0
        *0.005)
    annotation (Placement(transformation(extent={{-50,-60},{-30,-40}})));
  Echery_library.ElectrochemicalReactor.MaterialDomain.Flows.Material_Simple_InFlow_Fixed
    CathodeInflow(specRec=Echery_library.Data.UserInput.Example_AlkalineWaterElectrolysis.AWEspec,
      molFlow_vec=Echery_library.Data.UserInput.Example_AlkalineWaterElectrolysis.c0
        *0.005)
    annotation (Placement(transformation(extent={{30,-60},{50,-40}})));
  Echery_library.ElectrochemicalReactor.Separators.Diaphragm_Hydroxide
    Diaphragm(
    redeclare model TemperatureModel =
      Properties.TemperatureModels.TemperatureConstant,
    specRec=Echery_library.Data.UserInput.Example_AlkalineWaterElectrolysis.AWEspec,
    GeoRec=Echery_library.Data.UserInput.Example_AlkalineWaterElectrolysis.GeoRec,
    CondRec=Echery_library.Data.UserInput.Example_AlkalineWaterElectrolysis.CondRec,
    X=5e-4,
    kappa=38)
    annotation (Placement(transformation(extent={{-10,-30},{10,-10}})));

  Echery_library.ElectrochemicalReactor.MaterialDomain.Flows.Material_Simple_ConnectingFlow
    Flow_anode(specRec=Echery_library.Data.UserInput.Example_AlkalineWaterElectrolysis.AWEspec)
    annotation (Placement(transformation(extent={{-50,-4},{-30,16}})));
  Echery_library.ElectrochemicalReactor.MaterialDomain.Flows.Environment
    env_anode(specRec=Echery_library.Data.UserInput.Example_AlkalineWaterElectrolysis.AWEspec)
    annotation (Placement(transformation(extent={{-50,22},{-30,42}})));
  Echery_library.ElectrochemicalReactor.MaterialDomain.Flows.Material_Simple_ConnectingFlow
    Flow_Cathode(specRec=Echery_library.Data.UserInput.Example_AlkalineWaterElectrolysis.AWEspec)
    annotation (Placement(transformation(extent={{30,-6},{50,14}})));
  Echery_library.ElectrochemicalReactor.MaterialDomain.Flows.Environment
    env_cathode(specRec=Echery_library.Data.UserInput.Example_AlkalineWaterElectrolysis.AWEspec)
    annotation (Placement(transformation(extent={{30,22},{50,42}})));
  Echery_library.ElectrochemicalReactor.Electrolytes.Liquid.Electrolyte_Conti_0D_L
    Anolyte(
    redeclare model TemperatureModel =
      Properties.TemperatureModels.TemperatureConstant,
    c0=Echery_library.Data.UserInput.Example_AlkalineWaterElectrolysis.c0,
    specRec=Echery_library.Data.UserInput.Example_AlkalineWaterElectrolysis.AWEspec,
    GeoRec=Echery_library.Data.UserInput.Example_AlkalineWaterElectrolysis.GeoRec,
    CondRec=Echery_library.Data.UserInput.Example_AlkalineWaterElectrolysis.CondRec,
    kappa_const=75)
    annotation (Placement(transformation(extent={{-50,-30},{-30,-10}})));

  Echery_library.ElectrochemicalReactor.Electrolytes.Liquid.Electrolyte_Conti_0D_L
    Catholyte(
    redeclare model TemperatureModel =
      Properties.TemperatureModels.TemperatureConstant,
    c0=Echery_library.Data.UserInput.Example_AlkalineWaterElectrolysis.c0,
    specRec=Echery_library.Data.UserInput.Example_AlkalineWaterElectrolysis.AWEspec,
    GeoRec=Echery_library.Data.UserInput.Example_AlkalineWaterElectrolysis.GeoRec,
    CondRec=Echery_library.Data.UserInput.Example_AlkalineWaterElectrolysis.CondRec,
    kappa_const=85)
    annotation (Placement(transformation(extent={{30,-30},{50,-10}})));

equation
  connect(Ground.p, Source.p) annotation (Line(points={{60,74},{36,74},{36,50},
          {10,50}},      color={0,0,255}));
  connect(Anode.p, Source.n) annotation (Line(points={{-92,-20},{-96,-20},{-96,
          50},{-10,50}},
                    color={0,0,255}));
  connect(Source.p,Cathode. n) annotation (Line(points={{10,50},{96,50},{96,-20},
          {90,-20}},       color={0,0,255}));

  connect(Flow_anode.convoutFlow, env_anode.convFlow)
    annotation (Line(points={{-40,16},{-40,22}}, color={0,0,0}));
  connect(Flow_Cathode.convoutFlow, env_cathode.convFlow)
    annotation (Line(points={{40,14},{40,22}}, color={0,0,0}));
  connect(Flow_anode.convinFlow, Anolyte.outFlow)
    annotation (Line(points={{-40,-4},{-40,-10}}, color={0,0,0}));
  connect(Anode.n, Anolyte.p)
    annotation (Line(points={{-72,-20},{-50,-20}}, color={0,0,255}));
  connect(Anolyte.leftFlow, Anode.flowFromElectrolyte) annotation (Line(points={{-50,-14},
          {-66,-14},{-66,-2},{-82,-2},{-82,-10}},            color={0,0,0}));
  connect(Anolyte.inFlow, AnodeInflow.convFlow)
    annotation (Line(points={{-40,-30},{-40,-40}}, color={0,0,0}));
  connect(Anolyte.rightFlow, Diaphragm.anCon)
    annotation (Line(points={{-30,-14},{-10,-14}}, color={0,0,0}));
  connect(Anolyte.n, Diaphragm.p)
    annotation (Line(points={{-30,-20},{-10,-20}}, color={0,0,255}));
  connect(Catholyte.rightFlow, Cathode.flowFromElectrolyte) annotation (Line(
        points={{50,-14},{66,-14},{66,-2},{80,-2},{80,-10}}, color={0,0,0}));
  connect(Catholyte.n, Cathode.p)
    annotation (Line(points={{50,-20},{60,-20},{60,-20},{70,-20}},
                                                 color={0,0,255}));
  connect(Catholyte.inFlow, CathodeInflow.convFlow)
    annotation (Line(points={{40,-30},{40,-40}}, color={0,0,0}));
  connect(Flow_Cathode.convinFlow, Catholyte.outFlow)
    annotation (Line(points={{40,-6},{40,-10}}, color={0,0,0}));
  connect(Catholyte.leftFlow, Diaphragm.catCon)
    annotation (Line(points={{30,-14},{10,-14}}, color={0,0,0}));
  connect(Diaphragm.n, Catholyte.p)
    annotation (Line(points={{10,-20},{30,-20}}, color={0,0,255}));
  annotation (experiment(
      StopTime=50,
      __Dymola_NumberOfIntervals=2000,
      Tolerance=1e-12));
end Electrolyzer_Conti_0D_L;
