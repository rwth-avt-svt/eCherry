within eCherry_Library.Examples.Batch.Batch0D;
model Electrolyzer_Batch_0D_GL_IsobaricFlashedEnvironment
  "Gas leaving the batch 0D electrolyte"
  extends Modelica.Icons.Example;

  Modelica.Electrical.Analog.Basic.Ground Ground
    annotation (Placement(transformation(extent={{70,54},{50,74}})));
  ElectrochemicalReactor.Electrodes.Electrode_Planar Anode(
    P=100000,
    specRec=Data.UserInput.Example_AlkalineWaterElectrolysis.AWEspec,
    GeoRec=Data.UserInput.Example_AlkalineWaterElectrolysis.GeoRec,
    CondRec=Data.UserInput.Example_AlkalineWaterElectrolysis.CondRec,
    reac={Data.UserInput.Example_AlkalineWaterElectrolysis.OERdummy},
    CathodeEl=false,
    redeclare model TemperatureModel =
      Properties.TemperatureModels.TemperatureConstant,
    Y=0.1,
    Z=0.1,
    Pi(each displayUnit="bar"))
    annotation (Placement(transformation(extent={{-84,-34},{-64,-14}})));
  ElectrochemicalReactor.Electrodes.Electrode_Planar Cathode(
    P=100000,
    specRec=Data.UserInput.Example_AlkalineWaterElectrolysis.AWEspec,
    GeoRec=Data.UserInput.Example_AlkalineWaterElectrolysis.GeoRec,
    CondRec=Data.UserInput.Example_AlkalineWaterElectrolysis.CondRec,
    reac={Data.UserInput.Example_AlkalineWaterElectrolysis.HERdummy},
    CathodeEl=true,
    redeclare model TemperatureModel =
      Properties.TemperatureModels.TemperatureConstant,
    Y=0.1,
    Z=0.1,
    Pi(each displayUnit="bar"))
    annotation (Placement(transformation(extent={{56,-34},{76,-14}})));

  ElectrochemicalReactor.Electrolytes.GasLiquid.Electrolyte_Batch_0D_GL_IsobaricFlashed
    Electrolyte_flashed(
    redeclare model TemperatureModel =
      Properties.TemperatureModels.TemperatureConstant,
    specRec=Data.UserInput.Example_AlkalineWaterElectrolysis.AWEspec,
    GSpec=Data.UserInput.Example_AlkalineWaterElectrolysis.GSpec,
    DSpec=Data.UserInput.Example_AlkalineWaterElectrolysis.DSpec,
    LSpec=Data.UserInput.Example_AlkalineWaterElectrolysis.LSpec,
    GeoRec=Data.UserInput.Example_AlkalineWaterElectrolysis.GeoRec,
    CondRec=Data.UserInput.Example_AlkalineWaterElectrolysis.CondRec,
    X=0.005,
    Y=1,
    Z=1,
    mol_vec_0={100,10,1e-4,1e-4,55e3}/1000,
    P=100000,
    redeclare model ConductivityModel =
        ElectrochemicalReactor.Properties.ConductivityModels.ConductivityElectrolyteConstant,
    kappa_const=75)
    annotation (Placement(transformation(extent={{-10,-34},{10,-14}})));

  ElectrochemicalReactor.MaterialDomain.Compartments.GasLiquid.Environment
    Environment(
    specRec=Data.UserInput.Example_AlkalineWaterElectrolysis.GSpec,
    CondRec=Data.UserInput.Example_AlkalineWaterElectrolysis.CondRec,
    mol_vec_G_0={1e-60,1e-60},
    P=100000,
    T=298.15) annotation (Placement(transformation(extent={{-10,-2},{10,18}})));
  ElectrochemicalReactor.ElectricalDomain.Source.Potential_Source.Voltage_Fixed
    imposedPotential(GeoRec=Data.UserInput.Example_AlkalineWaterElectrolysis.GeoRec,
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
  connect(Electrolyte_flashed.outFlow, Environment.inFlow)
    annotation (Line(points={{0,-14},{0,-2}}, color={0,0,0}));
  connect(Anode.p, imposedPotential.p) annotation (Line(points={{-84,-24},{-88,
          -24},{-88,50},{-10,50}}, color={0,0,255}));
  connect(imposedPotential.n, Cathode.n) annotation (Line(points={{10,50},{82,
          50},{82,-24},{76,-24}}, color={0,0,255}));
  connect(imposedPotential.n, Ground.p) annotation (Line(points={{10,50},{46,50},
          {46,74},{60,74}}, color={0,0,255}));
  annotation (experiment(__Dymola_NumberOfIntervals=2000, Tolerance=1e-12),
              Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end Electrolyzer_Batch_0D_GL_IsobaricFlashedEnvironment;
