within eCherry_Library.Examples.Batch.Batch0D;
model Electrolyzer_Batch_0D_GL_NonIsobaric
  extends Modelica.Icons.Example;

  ElectrochemicalReactor.ElectricalDomain.Source.Potential_Source.ImposedPotential
                                                                Source(GeoRec=
        Data.UserInput.Example_AlkalineWaterElectrolysis.GeoRec, Ufixed=-2.3)
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={0,50})));
  Modelica.Electrical.Analog.Basic.Ground Ground
    annotation (Placement(transformation(extent={{70,54},{50,74}})));
  eCherry_Library.ElectrochemicalReactor.Electrodes.Electrode Anode(
    P=100000,
    specRec=Data.UserInput.Example_AlkalineWaterElectrolysis.AWEspec,
    GeoRec=Data.UserInput.Example_AlkalineWaterElectrolysis.GeoRec,
    CondRec=Data.UserInput.Example_AlkalineWaterElectrolysis.CondRec,
    reac={Data.UserInput.Example_AlkalineWaterElectrolysis.OERdummy},
    CathodeEl=false,
    Y=0.1,
    Z=0.1,
    Pi(displayUnit="bar"))
    annotation (Placement(transformation(extent={{-84,-34},{-64,-14}})));
  eCherry_Library.ElectrochemicalReactor.Electrodes.Electrode
    Cathode(
    P=100000,
    specRec=Data.UserInput.Example_AlkalineWaterElectrolysis.AWEspec,
    GeoRec=Data.UserInput.Example_AlkalineWaterElectrolysis.GeoRec,
    CondRec=Data.UserInput.Example_AlkalineWaterElectrolysis.CondRec,
    reac={Data.UserInput.Example_AlkalineWaterElectrolysis.HERdummy},
    CathodeEl=true,
    Y=0.1,
    Z=0.1,
    Pi(displayUnit="bar"))
    annotation (Placement(transformation(extent={{56,-34},{76,-14}})));
  ElectrochemicalReactor.Electrolytes.GasLiquid.Electrolyte_Batch_0D_GL_NonIsobaric
    Electrolyte(
    specRec=Data.UserInput.Example_AlkalineWaterElectrolysis.AWEspec,
    GSpec=Data.UserInput.Example_AlkalineWaterElectrolysis.GSpec,
    DSpec=Data.UserInput.Example_AlkalineWaterElectrolysis.DSpec,
    LSpec=Data.UserInput.Example_AlkalineWaterElectrolysis.LSpec,
    GeoRec=Data.UserInput.Example_AlkalineWaterElectrolysis.GeoRec,
    CondRec=Data.UserInput.Example_AlkalineWaterElectrolysis.CondRec,
    X=0.005,
    Y=1,
    Z=1,
    mol_vec_0={10,10,1e-4,1e-4,50e2}/100,
    redeclare model ConductivityModel_GL =
        ElectrochemicalReactor.Properties.ConductivityModels.ConductivityElectrolyteGLBruggeman,
    j(start=500))
    annotation (Placement(transformation(extent={{-10,-34},{10,-14}})));

equation
  connect(Ground.p, Source.p) annotation (Line(points={{60,74},{36,74},{36,50},
          {10,50}},      color={0,0,255}));
  connect(Anode.p, Source.n) annotation (Line(points={{-84,-24},{-94,-24},{-94,
          50},{-10,50}},
                    color={0,0,255}));
  connect(Source.p,Cathode. n) annotation (Line(points={{10,50},{92,50},{92,-24},
          {76,-24}},       color={0,0,255}));
  connect(Anode.n, Electrolyte.p)
    annotation (Line(points={{-64,-24},{-10,-24}}, color={0,0,255}));
  connect(Electrolyte.n, Cathode.p)
    annotation (Line(points={{10,-24},{56,-24}},color={0,0,255}));
  connect(Anode.flowFromElectrolyte, Electrolyte.leftFlow) annotation (Line(
        points={{-74,-14},{-44,-14},{-44,-19},{-10.8,-19}}, color={0,0,0}));
  connect(Electrolyte.rightFlow, Cathode.flowFromElectrolyte) annotation (Line(
        points={{10,-18},{38,-18},{38,-14},{66,-14}},color={0,0,0}));
  annotation (experiment(__Dymola_NumberOfIntervals=2000, Tolerance=1e-12));
end Electrolyzer_Batch_0D_GL_NonIsobaric;
