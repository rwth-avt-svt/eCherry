within eCherry_Library.Examples.Pyschik2024;
model AlkalineWaterElectrolyzer
 extends Modelica.Icons.Example;
 parameter Temperature T=300 "in K";

  Modelica.Electrical.Analog.Basic.Ground Ground
    annotation (Placement(transformation(extent={{70,54},{50,74}})));
  eCherry_Library.ElectrochemicalReactor.Electrodes.Electrode Anode(
    P=100000,
    GeoRec=eCherry_Library.Data.UserInput.Pyschik2024_AlkalineWaterElectrolyzer.GeoRec,
    CondRec=eCherry_Library.Data.UserInput.Pyschik2024_AlkalineWaterElectrolyzer.CondRec,
    specRec=eCherry_Library.Data.UserInput.Pyschik2024_AlkalineWaterElectrolyzer.AWEspec,
    redeclare model ActivationOverpotentialModel =
        eCherry_Library.ElectrochemicalReactor.Electrodes.Electrochemistry.Activation_Overpotential.ActivationOverpotentialTafelAnodic,
    reac={eCherry_Library.Data.UserInput.Pyschik2024_AlkalineWaterElectrolyzer.OERdummy},
    T(displayUnit="K"),
    Pi(displayUnit="bar"),
    CathodeEl=false)
    annotation (Placement(transformation(extent={{-92,-30},{-72,-10}})));

  eCherry_Library.ElectrochemicalReactor.Electrodes.Electrode Cathode(
    P=100000,
    GeoRec=eCherry_Library.Data.UserInput.Pyschik2024_AlkalineWaterElectrolyzer.GeoRec,
    CondRec=eCherry_Library.Data.UserInput.Pyschik2024_AlkalineWaterElectrolyzer.CondRec,
    redeclare model ActivationOverpotentialModel =
        eCherry_Library.ElectrochemicalReactor.Electrodes.Electrochemistry.Activation_Overpotential.ActivationOverpotentialTafelCathodic,
    specRec=eCherry_Library.Data.UserInput.Pyschik2024_AlkalineWaterElectrolyzer.AWEspec,
    reac={eCherry_Library.Data.UserInput.Pyschik2024_AlkalineWaterElectrolyzer.HERdummy},
    T(displayUnit="K"),
    Pi(displayUnit="bar"),
    CathodeEl=true)
    annotation (Placement(transformation(extent={{70,-30},{90,-10}})));

  eCherry_Library.ElectrochemicalReactor.MaterialDomain.Flows.FixedConvInFlowL
    AnodeInflow(specRec=eCherry_Library.Data.UserInput.Pyschik2024_AlkalineWaterElectrolyzer.AWEspec,
      molFlow_vec=eCherry_Library.Data.UserInput.Pyschik2024_AlkalineWaterElectrolyzer.c0
        *0.00000833333)
    annotation (Placement(transformation(extent={{-50,-66},{-30,-46}})));
  eCherry_Library.ElectrochemicalReactor.MaterialDomain.Flows.FixedConvInFlowL
    CathodeInflow(specRec=eCherry_Library.Data.UserInput.Pyschik2024_AlkalineWaterElectrolyzer.AWEspec,
      molFlow_vec=eCherry_Library.Data.UserInput.Pyschik2024_AlkalineWaterElectrolyzer.c0
        *0.00000833333)
    annotation (Placement(transformation(extent={{30,-66},{50,-46}})));
  eCherry_Library.ElectrochemicalReactor.Separators.DiaphragmHydroxide
    Diaphragm(
    specRec=eCherry_Library.Data.UserInput.Pyschik2024_AlkalineWaterElectrolyzer.AWEspec,
    GeoRec=eCherry_Library.Data.UserInput.Pyschik2024_AlkalineWaterElectrolyzer.GeoRec,
    CondRec=eCherry_Library.Data.UserInput.Pyschik2024_AlkalineWaterElectrolyzer.CondRec,
    X=5e-4,
    kappa=27.1)
    annotation (Placement(transformation(extent={{-10,-30},{10,-10}})));

  eCherry_Library.ElectrochemicalReactor.Electrolytes.GasLiquid.Electrolyte_Conti_0D_GL
    Catholyte(
    specRec=eCherry_Library.Data.UserInput.Pyschik2024_AlkalineWaterElectrolyzer.AWEspec,
    GSpec=eCherry_Library.Data.UserInput.Pyschik2024_AlkalineWaterElectrolyzer.AWE_Gspec,
    DSpec=eCherry_Library.Data.UserInput.Pyschik2024_AlkalineWaterElectrolyzer.AWE_Dspec,
    LSpec=eCherry_Library.Data.UserInput.Pyschik2024_AlkalineWaterElectrolyzer.AWE_Lspec,
    GeoRec=eCherry_Library.Data.UserInput.Pyschik2024_AlkalineWaterElectrolyzer.GeoRec,
    CondRec=eCherry_Library.Data.UserInput.Pyschik2024_AlkalineWaterElectrolyzer.CondRec,
    mol_vec_0=0.001*0.03*eCherry_Library.Data.UserInput.Pyschik2024_AlkalineWaterElectrolyzer.c0,
    P=100000,
    redeclare model ConductivityModel =
        eCherry_Library.ElectrochemicalReactor.Properties.ConductivityModels.ConductivityElectrolyteCalcKOH,
    redeclare model ConductivityModel_GL =
        eCherry_Library.ElectrochemicalReactor.Properties.ConductivityModels.ConductivityElectrolyteGLBruggeman)
    annotation (Placement(transformation(extent={{30,-30},{50,-10}})));

  eCherry_Library.ElectrochemicalReactor.ElectricalDomain.Source.Current_Source.LinearCurrentDensity
    source(
    GeoRec=eCherry_Library.Data.UserInput.Pyschik2024_AlkalineWaterElectrolyzer.GeoRec,
    j0=1,
    dj=0.01)
          annotation (Placement(transformation(extent={{16,48},{-4,68}})));

  eCherry_Library.ElectrochemicalReactor.Electrolytes.GasLiquid.Electrolyte_Conti_0D_GL
    Anolyte(
    specRec=eCherry_Library.Data.UserInput.Pyschik2024_AlkalineWaterElectrolyzer.AWEspec,
    GSpec=eCherry_Library.Data.UserInput.Pyschik2024_AlkalineWaterElectrolyzer.AWE_Gspec,
    DSpec=eCherry_Library.Data.UserInput.Pyschik2024_AlkalineWaterElectrolyzer.AWE_Dspec,
    LSpec=eCherry_Library.Data.UserInput.Pyschik2024_AlkalineWaterElectrolyzer.AWE_Lspec,
    GeoRec=eCherry_Library.Data.UserInput.Pyschik2024_AlkalineWaterElectrolyzer.GeoRec,
    CondRec=eCherry_Library.Data.UserInput.Pyschik2024_AlkalineWaterElectrolyzer.CondRec,
    mol_vec_0=0.001*0.03*eCherry_Library.Data.UserInput.Pyschik2024_AlkalineWaterElectrolyzer.c0,
    P=100000,
    redeclare model ConductivityModel =
        eCherry_Library.ElectrochemicalReactor.Properties.ConductivityModels.ConductivityElectrolyteCalcKOH,
    redeclare model ConductivityModel_GL =
        eCherry_Library.ElectrochemicalReactor.Properties.ConductivityModels.ConductivityElectrolyteGLBruggeman)
    annotation (Placement(transformation(extent={{-50,-32},{-30,-12}})));

  ElectrochemicalReactor.MaterialDomain.Flows.ConvectiveOutFlowL anodeOutflow(
      specRec=eCherry_Library.Data.UserInput.Pyschik2024_AlkalineWaterElectrolyzer.AWEspec)
    annotation (Placement(transformation(extent={{-50,0},{-30,20}})));
  ElectrochemicalReactor.MaterialDomain.Flows.ConvectiveOutFlowL CathodeOutflow(
      specRec=eCherry_Library.Data.UserInput.Pyschik2024_AlkalineWaterElectrolyzer.AWEspec)
    annotation (Placement(transformation(extent={{30,0},{50,20}})));
equation

  connect(Anode.p, source.n) annotation (Line(points={{-92,-20},{-96,-20},{-96,
          58},{-4,58}},      color={0,0,255}));
  connect(source.p, Cathode.n) annotation (Line(points={{16,58},{44,58},{44,46},
          {96,46},{96,-20},{90,-20}},     color={0,0,255}));
  connect(Ground.p, source.p) annotation (Line(points={{60,74},{60,76},{26,76},
          {26,58},{16,58}}, color={0,0,255}));
  connect(Anolyte.p, Anode.n) annotation (Line(points={{-50,-22},{-52,-22},{-52,
          -20},{-72,-20}}, color={0,0,255}));
  connect(Anolyte.n, Diaphragm.p) annotation (Line(points={{-30,-22},{-28,-22},
          {-28,-20},{-10,-20}}, color={0,0,255}));
  connect(Anolyte.inFlow, AnodeInflow.convFlow)
    annotation (Line(points={{-40,-32},{-40,-46}}, color={0,0,0}));
  connect(Anolyte.leftFlow, Anode.flowFromElectrolyte) annotation (Line(points={{-50.8,
          -17},{-50.8,-10},{-82,-10}},         color={0,0,0}));
  connect(Anolyte.rightFlow, Diaphragm.anCon) annotation (Line(points={{-30,-16},
          {-20,-16},{-20,-6},{-10,-6},{-10,-14}}, color={0,0,0}));
  connect(Catholyte.leftFlow, Diaphragm.catCon)
    annotation (Line(points={{29.2,-15},{29.2,-14},{10,-14}}, color={0,0,0}));
  connect(Catholyte.rightFlow, Cathode.flowFromElectrolyte)
    annotation (Line(points={{50,-14},{66,-14},{66,-10},{80,-10}},
                                                 color={0,0,0}));
  connect(Catholyte.p, Diaphragm.n)
    annotation (Line(points={{30,-20},{10,-20}}, color={0,0,255}));
  connect(Catholyte.n, Cathode.p)
    annotation (Line(points={{50,-20},{70,-20}}, color={0,0,255}));
  connect(CathodeInflow.convFlow, Catholyte.inFlow)
    annotation (Line(points={{40,-46},{40,-30}}, color={0,0,0}));
  connect(anodeOutflow.convFlow, Anolyte.outFlow)
    annotation (Line(points={{-40,0},{-40,-12}}, color={0,0,0}));
  connect(Catholyte.outFlow, CathodeOutflow.convFlow)
    annotation (Line(points={{40,-10},{40,0}}, color={0,0,0}));
  annotation (experiment(
      StopTime=300000,
      __Dymola_NumberOfIntervals=2000,
      Tolerance=1e-12,
      __Dymola_Algorithm="Dassl"));
end AlkalineWaterElectrolyzer;
