within eCherry_Library.Examples.PhotoVoltaics;
model Electrolyzer_Conti_0D_L_PV_flex
 extends Modelica.Icons.Example;
 import  eCherry_Library;
 parameter Temperature T=300 "in K";
 parameter Length Y=0.04;
 parameter Length Z=0.04;

 parameter String fileNameIrradiance = Modelica.Utilities.Files.loadResource("modelica://eCherry_Library/externalData/V20A.txt") "Irradiance data file name";
 parameter Real eps=1e-6;

  Modelica.Electrical.Analog.Basic.Ground Ground
    annotation (Placement(transformation(extent={{104,60},{84,80}})));

  PhotoVoltaics.Components.SimplePhotoVoltaics.SimpleCell cell(
      useConstantIrradiance=false, moduleData=moduleData) annotation (Placement(
        visible=true, transformation(
        origin={-48,100},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  PhotoVoltaics.Components.SimplePhotoVoltaics.SimpleCell cell1(
      useConstantIrradiance=false, moduleData=moduleData) annotation (Placement(
        visible=true, transformation(
        origin={-28,100},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  PhotoVoltaics.Components.SimplePhotoVoltaics.SimpleCell cell2(
      useConstantIrradiance=false, moduleData=moduleData) annotation (Placement(
        visible=true, transformation(
        origin={12,100},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  PhotoVoltaics.Components.SimplePhotoVoltaics.SimpleCell cell3(
      useConstantIrradiance=false, moduleData=moduleData) annotation (Placement(
        visible=true, transformation(
        origin={32,100},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  Modelica.Electrical.Analog.Sensors.VoltageSensor voltageSensor
    annotation (Placement(transformation(extent={{-16,56},{4,76}})));
  parameter PhotoVoltaics.Records.SHARP_NU_S5_E3E moduleData annotation (
    Placement(visible = true, transformation(origin={154,90},   extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  eCherry_Library.ElectrochemicalReactor.Electrodes.Electrode_Planar Anode(
  redeclare model TemperatureModel =
      Properties.TemperatureModels.TemperatureConstant,
    Y=Y,
    Z=Z,
    redeclare model ActivationOverpotentialModel =
        eCherry_Library.ElectrochemicalReactor.Electrodes.Electrochemistry.Activation_Overpotential.ActivationOverpotential,
    GeoRec=eCherry_Library.Data.UserInput.Example_AlkalineWaterElectrolysis_Overpotentials.GeoRec,
    CondRec=eCherry_Library.Data.UserInput.Example_AlkalineWaterElectrolysis_Overpotentials.CondRec,
    specRec=eCherry_Library.Data.UserInput.Example_AlkalineWaterElectrolysis_Overpotentials.AWEspec,
    reac={eCherry_Library.Data.UserInput.Example_AlkalineWaterElectrolysis_Overpotentials.OERdummy},
    T(displayUnit="K"),
    Pi(each displayUnit="bar"),
    CathodeEl=false)
    annotation (Placement(transformation(extent={{-82,-20},{-62,0}})));

  eCherry_Library.ElectrochemicalReactor.Electrodes.Electrode_Planar Cathode(
  redeclare model TemperatureModel =
      Properties.TemperatureModels.TemperatureConstant,
    GeoRec=eCherry_Library.Data.UserInput.Example_AlkalineWaterElectrolysis_Overpotentials.GeoRec,
    CondRec=eCherry_Library.Data.UserInput.Example_AlkalineWaterElectrolysis_Overpotentials.CondRec,
    Y=Y,
    Z=Z,
    redeclare model ActivationOverpotentialModel =
        eCherry_Library.ElectrochemicalReactor.Electrodes.Electrochemistry.Activation_Overpotential.ActivationOverpotential,
    specRec=eCherry_Library.Data.UserInput.Example_AlkalineWaterElectrolysis_Overpotentials.AWEspec,
    reac={eCherry_Library.Data.UserInput.Example_AlkalineWaterElectrolysis_Overpotentials.HERdummy},
    T(displayUnit="K"),
    Pi(each displayUnit="bar"),
    CathodeEl=true)
    annotation (Placement(transformation(extent={{80,-20},{100,0}})));

  eCherry_Library.ElectrochemicalReactor.MaterialDomain.Flows.Material_Simple_InFlow_Fixed
    AnodeInflow(specRec=eCherry_Library.Data.UserInput.Example_AlkalineWaterElectrolysis_Overpotentials.AWEspec,
      molFlow_vec=eCherry_Library.Data.UserInput.Example_AlkalineWaterElectrolysis_Overpotentials.c0
        *0.00000833333)
    annotation (Placement(transformation(extent={{-40,-56},{-20,-36}})));
  eCherry_Library.ElectrochemicalReactor.MaterialDomain.Flows.Material_Simple_InFlow_Fixed
    CathodeInflow(specRec=eCherry_Library.Data.UserInput.Example_AlkalineWaterElectrolysis_Overpotentials.AWEspec,
      molFlow_vec=eCherry_Library.Data.UserInput.Example_AlkalineWaterElectrolysis_Overpotentials.c0
        *0.00000833333)
    annotation (Placement(transformation(extent={{40,-50},{60,-30}})));
  eCherry_Library.ElectrochemicalReactor.Separators.Diaphragm_Hydroxide
    Diaphragm(
    redeclare model TemperatureModel =
      Properties.TemperatureModels.TemperatureConstant,
    Y=Y,
    Z=Z,
    specRec=eCherry_Library.Data.UserInput.Example_AlkalineWaterElectrolysis_Overpotentials.AWEspec,
    GeoRec=eCherry_Library.Data.UserInput.Example_AlkalineWaterElectrolysis_Overpotentials.GeoRec,
    CondRec=eCherry_Library.Data.UserInput.Example_AlkalineWaterElectrolysis_Overpotentials.CondRec,
    X=5e-4,
    kappa=27.1) annotation (Placement(transformation(extent={{0,-20},{20,0}})));

  eCherry_Library.ElectrochemicalReactor.MaterialDomain.Flows.Material_Simple_ConnectingFlow
    Flow_anode(specRec=eCherry_Library.Data.UserInput.Example_AlkalineWaterElectrolysis_Overpotentials.AWEspec)
    annotation (Placement(transformation(extent={{-40,6},{-20,26}})));
  eCherry_Library.ElectrochemicalReactor.MaterialDomain.Flows.Environment
    env_anode(specRec=eCherry_Library.Data.UserInput.Example_AlkalineWaterElectrolysis_Overpotentials.AWEspec)
    annotation (Placement(transformation(extent={{-40,32},{-20,52}})));
  eCherry_Library.ElectrochemicalReactor.MaterialDomain.Flows.Material_Simple_ConnectingFlow
    Flow_Cathode(specRec=eCherry_Library.Data.UserInput.Example_AlkalineWaterElectrolysis_Overpotentials.AWEspec)
    annotation (Placement(transformation(extent={{40,4},{60,24}})));
  eCherry_Library.ElectrochemicalReactor.Electrolytes.GasLiquid.Electrolyte_Conti_0D_GL
    Catholyte(
    redeclare model TemperatureModel =
      Properties.TemperatureModels.TemperatureConstant,
    specRec=eCherry_Library.Data.UserInput.Example_AlkalineWaterElectrolysis_Overpotentials.AWEspec,
    GSpec=eCherry_Library.Data.UserInput.Example_AlkalineWaterElectrolysis_Overpotentials.AWE_Gspec,
    DSpec=eCherry_Library.Data.UserInput.Example_AlkalineWaterElectrolysis_Overpotentials.AWE_Dspec,
    LSpec=eCherry_Library.Data.UserInput.Example_AlkalineWaterElectrolysis_Overpotentials.AWE_Lspec,
    GeoRec=eCherry_Library.Data.UserInput.Example_AlkalineWaterElectrolysis_Overpotentials.GeoRec,
    CondRec=eCherry_Library.Data.UserInput.Example_AlkalineWaterElectrolysis_Overpotentials.CondRec,
    X=0.001,
    Y=Y,
    Z=Z,
    mol_vec_0=0.001*0.03*eCherry_Library.Data.UserInput.Example_AlkalineWaterElectrolysis_Overpotentials.c0,
    P=100000,
    redeclare model ConductivityModel_GL =
        eCherry_Library.ElectrochemicalReactor.Properties.ConductivityModels.ConductivityElectrolyteGLBruggeman)
    annotation (Placement(transformation(extent={{40,-20},{60,0}})));

  eCherry_Library.ElectrochemicalReactor.MaterialDomain.Flows.Environment
    env_cathode(specRec=eCherry_Library.Data.UserInput.Example_AlkalineWaterElectrolysis_Overpotentials.AWEspec)
    annotation (Placement(transformation(extent={{40,32},{60,52}})));
  eCherry_Library.ElectrochemicalReactor.Electrolytes.GasLiquid.Electrolyte_Conti_0D_GL
    Anolyte(
    redeclare model TemperatureModel =
      Properties.TemperatureModels.TemperatureConstant,
    specRec=eCherry_Library.Data.UserInput.Example_AlkalineWaterElectrolysis_Overpotentials.AWEspec,
    GSpec=eCherry_Library.Data.UserInput.Example_AlkalineWaterElectrolysis_Overpotentials.AWE_Gspec,
    DSpec=eCherry_Library.Data.UserInput.Example_AlkalineWaterElectrolysis_Overpotentials.AWE_Dspec,
    LSpec=eCherry_Library.Data.UserInput.Example_AlkalineWaterElectrolysis_Overpotentials.AWE_Lspec,
    GeoRec=eCherry_Library.Data.UserInput.Example_AlkalineWaterElectrolysis_Overpotentials.GeoRec,
    CondRec=eCherry_Library.Data.UserInput.Example_AlkalineWaterElectrolysis_Overpotentials.CondRec,
    X=0.001,
    Y=Y,
    Z=Z,
    mol_vec_0=0.001*0.03*eCherry_Library.Data.UserInput.Example_AlkalineWaterElectrolysis_Overpotentials.c0,
    P=100000,
    redeclare model ConductivityModel_GL =
        eCherry_Library.ElectrochemicalReactor.Properties.ConductivityModels.ConductivityElectrolyteGLBruggeman)
    annotation (Placement(transformation(extent={{-40,-22},{-20,-2}})));

  Modelica.Blocks.Sources.CombiTimeTable irradianceTable(
    tableOnFile=true,
    tableName="tab1",
    fileName=fileNameIrradiance,
    columns={2})                                                                                                                                annotation (
    Placement(transformation(extent={{-84,144},{-64,164}})));
equation
  connect(cell.n,cell1. p)
    annotation (Line(points={{-38,100},{-38,100}}, color={0,0,255}));
  connect(cell1.n,cell2. p)
    annotation (Line(points={{-18,100},{2,100}}, color={0,0,255}));
  connect(cell2.n,cell3. p)
    annotation (Line(points={{22,100},{22,100}}, color={0,0,255}));
  connect(cell2.variableIrradiance,cell. variableIrradiance) annotation (Line(
        points={{12,112},{12,120},{-48,120},{-48,112}}, color={0,0,127}));
  connect(cell3.variableIrradiance,cell. variableIrradiance) annotation (Line(
        points={{32,112},{32,126},{-48,126},{-48,112}}, color={0,0,127}));
  connect(cell3.n, Ground.p) annotation (Line(points={{42,100},{94,100},{94,80}},
                           color={0,0,255}));
  connect(voltageSensor.p,cell. p) annotation (Line(points={{-16,66},{-64,66},{-64,
          100},{-58,100}},     color={0,0,255}));
  connect(voltageSensor.n,cell3. n) annotation (Line(points={{4,66},{50,66},{50,
          100},{42,100}},    color={0,0,255}));
  connect(Flow_anode.convoutFlow,env_anode. convFlow)
    annotation (Line(points={{-30,26},{-30,32}}, color={0,0,0}));
  connect(Flow_Cathode.convoutFlow,env_cathode. convFlow)
    annotation (Line(points={{50,24},{50,32}}, color={0,0,0}));
  connect(Anolyte.p,Anode. n) annotation (Line(points={{-40,-12},{-42,-12},{-42,
          -10},{-62,-10}}, color={0,0,255}));
  connect(Anolyte.n,Diaphragm. p) annotation (Line(points={{-20,-12},{-18,-12},
          {-18,-10},{0,-10}},   color={0,0,255}));
  connect(Anolyte.outFlow,Flow_anode. convinFlow)
    annotation (Line(points={{-30,-2},{-30,6}},   color={0,0,0}));
  connect(Anolyte.inFlow,AnodeInflow. convFlow)
    annotation (Line(points={{-30,-22},{-30,-36}}, color={0,0,0}));
  connect(Anolyte.leftFlow,Anode. flowFromElectrolyte) annotation (Line(points={{-40.8,
          -7},{-40.8,0},{-72,0}},              color={0,0,0}));
  connect(Anolyte.rightFlow,Diaphragm. anCon) annotation (Line(points={{-20,-6},
          {-10,-6},{-10,4},{0,4},{0,-4}},         color={0,0,0}));
  connect(Catholyte.outFlow,Flow_Cathode. convinFlow)
    annotation (Line(points={{50,0},{50,4}},    color={0,0,0}));
  connect(Catholyte.leftFlow,Diaphragm. catCon)
    annotation (Line(points={{39.2,-5},{39.2,-4},{20,-4}},    color={0,0,0}));
  connect(Catholyte.rightFlow,Cathode. flowFromElectrolyte)
    annotation (Line(points={{60,-4},{76,-4},{76,0},{90,0}},
                                                 color={0,0,0}));
  connect(Catholyte.p,Diaphragm. n)
    annotation (Line(points={{40,-10},{20,-10}}, color={0,0,255}));
  connect(Catholyte.n,Cathode. p)
    annotation (Line(points={{60,-10},{80,-10}}, color={0,0,255}));
  connect(CathodeInflow.convFlow,Catholyte. inFlow)
    annotation (Line(points={{50,-30},{50,-20}}, color={0,0,0}));
  connect(Anode.p, cell.p) annotation (Line(points={{-82,-10},{-86,-10},{-86,
          100},{-58,100}}, color={0,0,255}));
  connect(Cathode.n, Ground.p) annotation (Line(points={{100,-10},{120,-10},{
          120,100},{94,100},{94,80}}, color={0,0,255}));
  connect(irradianceTable.y[1], cell1.variableIrradiance)
    annotation (Line(points={{-63,154},{-28,154},{-28,112}}, color={0,0,127}));
  connect(irradianceTable.y[1], cell.variableIrradiance)
    annotation (Line(points={{-63,154},{-48,154},{-48,112}}, color={0,0,127}));
  annotation (experiment(
      StopTime=86400,
      __Dymola_NumberOfIntervals=200000,
      Tolerance=1e-12,
      __Dymola_Algorithm="Dassl"));
end Electrolyzer_Conti_0D_L_PV_flex;
