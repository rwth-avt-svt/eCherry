within eCherry_Library.Examples.Batch.Batch0D;
model Electrolyzer_Batch_0D_GL_KOH_IsobaricFlashed
  "Gas leaving the batch 0D electrolyte"
  extends Modelica.Icons.Example;

  Modelica.Electrical.Analog.Basic.Ground Ground
    annotation (Placement(transformation(extent={{70,54},{50,74}})));
  ElectrochemicalReactor.Electrodes.Electrode Anode(
    P=100000,
    specRec=Data.UserInput.Example_AlkalineWaterElectrolysis_KOH_GL.AWEKOHspec,
    GeoRec=Data.UserInput.Example_AlkalineWaterElectrolysis_KOH_GL.GeoRec,
    CondRec=Data.UserInput.Example_AlkalineWaterElectrolysis_KOH_GL.CondRec,
    CathodeEl=false,
    reac={Data.UserInput.Example_AlkalineWaterElectrolysis_KOH_GL.OERdummy},
    Pi(displayUnit="bar"))
    annotation (Placement(transformation(extent={{-84,-34},{-64,-14}})));

  ElectrochemicalReactor.Electrodes.Electrode Cathode(
    P=100000,
    specRec=Data.UserInput.Example_AlkalineWaterElectrolysis_KOH_GL.AWEKOHspec,
    GeoRec=Data.UserInput.Example_AlkalineWaterElectrolysis_KOH_GL.GeoRec,
    CondRec=Data.UserInput.Example_AlkalineWaterElectrolysis_KOH_GL.CondRec,
    CathodeEl=true,
    reac={Data.UserInput.Example_AlkalineWaterElectrolysis_KOH_GL.HERdummy},
    Pi(displayUnit="bar"))
    annotation (Placement(transformation(extent={{56,-34},{76,-14}})));

  ElectrochemicalReactor.Electrolytes.GasLiquid.Electrolyte_Batch_0D_GL_IsobaricFlashed
    Electrolyte_flashed(
    specRec=Data.UserInput.Example_AlkalineWaterElectrolysis_KOH_GL.AWEKOHspec,
    GSpec=Data.UserInput.Example_AlkalineWaterElectrolysis_KOH_GL.GSpec,
    DSpec=Data.UserInput.Example_AlkalineWaterElectrolysis_KOH_GL.DSpec,
    LSpec=Data.UserInput.Example_AlkalineWaterElectrolysis_KOH_GL.LSpec,
    GeoRec=Data.UserInput.Example_AlkalineWaterElectrolysis.GeoRec,
    CondRec=Data.UserInput.Example_AlkalineWaterElectrolysis.CondRec,
    X=0.005,
    Y=1,
    Z=1,
    mol_vec_0={10,10,1e-4,6000,6000,55e3}/250,
    P=100000,
    redeclare model ConductivityModel =
        ElectrochemicalReactor.Properties.ConductivityModels.ConductivityElectrolyteCalcKOH,
    redeclare model ConductivityModel_GL =
        ElectrochemicalReactor.Properties.ConductivityModels.ConductivityElectrolyteGLBruggeman)
    annotation (Placement(transformation(extent={{-10,-34},{10,-14}})));

  ElectrochemicalReactor.MaterialDomain.Flows.Material_Simple_OutFlow
    convectiveOutflow(specRec=Data.UserInput.Example_AlkalineWaterElectrolysis_KOH_GL.GSpec)
    annotation (Placement(transformation(extent={{-10,0},{10,20}})));
  ElectrochemicalReactor.ElectricalDomain.Source.Potential_Source.Voltage_Fixed
    imposedPotential(GeoRec=Data.UserInput.Example_AlkalineWaterElectrolysis_KOH_GL.GeoRec,
      Ufixed=-2.3)
    annotation (Placement(transformation(extent={{-10,40},{10,60}})));
equation
  connect(Anode.n, Electrolyte_flashed.p)
    annotation (Line(points={{-64,-24},{-10,-24}}, color={0,0,255}));
  connect(Electrolyte_flashed.n, Cathode.p)
    annotation (Line(points={{10,-24},{56,-24}}, color={0,0,255}));
  connect(Anode.flowFromElectrolyte, Electrolyte_flashed.leftFlow) annotation (
      Line(points={{-74,-14},{-42,-14},{-42,-19},{-10.8,-19}}, color={0,0,0}));
  connect(Electrolyte_flashed.rightFlow, Cathode.flowFromElectrolyte)
    annotation (Line(points={{10,-18},{38,-18},{38,-14},{66,-14}}, color={0,0,0}));
  connect(Electrolyte_flashed.outFlow, convectiveOutflow.convFlow)
    annotation (Line(points={{0,-14},{0,0}}, color={0,0,0}));
  connect(imposedPotential.n, Cathode.n) annotation (Line(points={{10,50},{82,
          50},{82,-24},{76,-24}}, color={0,0,255}));
  connect(imposedPotential.n, Ground.p) annotation (Line(points={{10,50},{46,50},
          {46,74},{60,74}}, color={0,0,255}));
  connect(imposedPotential.p, Anode.p) annotation (Line(points={{-10,50},{-90,
          50},{-90,-24},{-84,-24}}, color={0,0,255}));
  annotation (experiment(__Dymola_NumberOfIntervals=2000, Tolerance=1e-12),
              Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end Electrolyzer_Batch_0D_GL_KOH_IsobaricFlashed;
