within eCherry_Library.Examples.PhotoVoltaics;
model Electrolyzer_Conti_0D_L_PV_PPT
 extends Modelica.Icons.Example;
 import  eCherry_Library;
 parameter Temperature T=300 "in K";
 parameter Length Y=0.5;
 parameter Length Z=0.5;
 parameter String fileNameIrradiance = Modelica.Utilities.Files.loadResource("modelica://eCherry_Library/externalData/V20A.txt") "Irradiance data file name";
  Modelica.Electrical.Analog.Basic.Ground Ground
    annotation (Placement(transformation(extent={{104,60},{84,80}})));

  parameter PhotoVoltaics.Records.SHARP_NU_S5_E3E moduleData annotation (
    Placement(visible = true, transformation(origin={154,90},   extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  eCherry_Library.ElectrochemicalReactor.Electrodes.Electrode_Planar Anode(
    Y=Y,
    Z=Z,
    redeclare model ActivationOverpotentialModel =
        eCherry_Library.ElectrochemicalReactor.Electrodes.Electrochemistry.Activation_Overpotential.ActivationOverpotential,

    GeoRec=eCherry_Library.Data.UserInput.Example_AlkalineWaterElectrolysis_Overpotentials.GeoRec,

    CondRec=eCherry_Library.Data.UserInput.Example_AlkalineWaterElectrolysis_Overpotentials.CondRec,

    specRec=eCherry_Library.Data.UserInput.Example_AlkalineWaterElectrolysis_Overpotentials.AWEspec,

    reac={eCherry_Library.Data.UserInput.Example_AlkalineWaterElectrolysis_Overpotentials.OERdummy},

    T(displayUnit="K"),
    Pi(displayUnit="bar"),
    CathodeEl=false)
    annotation (Placement(transformation(extent={{-82,-20},{-62,0}})));

  eCherry_Library.ElectrochemicalReactor.Electrodes.Electrode_Planar Cathode(
    GeoRec=eCherry_Library.Data.UserInput.Example_AlkalineWaterElectrolysis_Overpotentials.GeoRec,

    CondRec=eCherry_Library.Data.UserInput.Example_AlkalineWaterElectrolysis_Overpotentials.CondRec,

    Y=Y,
    Z=Z,
    redeclare model ActivationOverpotentialModel =
        eCherry_Library.ElectrochemicalReactor.Electrodes.Electrochemistry.Activation_Overpotential.ActivationOverpotential,

    specRec=eCherry_Library.Data.UserInput.Example_AlkalineWaterElectrolysis_Overpotentials.AWEspec,

    reac={eCherry_Library.Data.UserInput.Example_AlkalineWaterElectrolysis_Overpotentials.HERdummy},

    T(displayUnit="K"),
    Pi(displayUnit="bar"),
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

  Modelica.Electrical.Analog.Basic.Ground groundDC annotation (
    Placement(visible = true, transformation(origin={-74,94},     extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PhotoVoltaics.Components.SimplePhotoVoltaics.SimpleModuleSymmetric module(
    moduleData=moduleData,
    T=298.15,
    useConstantIrradiance=false) annotation (Placement(visible=true,
        transformation(
        origin={-74,124},
        extent={{-10,10},{10,-10}},
        rotation=-90)));
  PhotoVoltaics.Components.Converters.DCConverter converter
    annotation (Placement(transformation(extent={{-14,114},{6,134}})));
  PhotoVoltaics.Components.Blocks.MPTrackerSample mpTracker(
    VmpRef=moduleData.VmpRef,
    ImpRef=moduleData.ImpRef,
    samplePeriod=10)
    annotation (Placement(transformation(extent={{-34,64},{-14,84}})));
  Modelica.Electrical.Analog.Sensors.PowerSensor powerSensor annotation (
    Placement(transformation(extent={{-54,134},{-34,154}})));
  PhotoVoltaics.Sources.Irradiance.Irradiance irradiance annotation (Placement(transformation(extent={{-124,
            114},{-104,134}})));
equation

  connect(Flow_anode.convoutFlow,env_anode. convFlow)
    annotation (Line(points={{-30,26},{-30,32}}, color={0,0,0}));
  connect(Flow_Cathode.convoutFlow,env_cathode. convFlow)
    annotation (Line(points={{50,24},{50,32}}, color={0,0,0}));
  connect(Anolyte.p,Anode. n) annotation (Line(points={{-40,-12},{-42,-12},{-42,
          -10},{-62,-10}}, color={0,0,255}));
  connect(Anolyte.n,Diaphragm. p) annotation (Line(points={{-20,-12},{-18,-12},{
          -18,-10},{0,-10}},    color={0,0,255}));
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
  connect(groundDC.p,module. n) annotation (
    Line(points={{-74,104},{-74,114}},      color = {0, 0, 255}));
  connect(mpTracker.vRef,converter. vDCRef) annotation (
    Line(points={{-13,74},{-10,74},{-10,112}},       color = {0, 0, 127}));
  connect(module.p,powerSensor. pc) annotation (
    Line(points={{-74,134},{-74,144},{-54,144}},                color = {0, 0, 255}));
  connect(mpTracker.power,powerSensor. power) annotation (
    Line(points={{-36,74},{-54,74},{-54,133}},                  color = {0, 0, 127}));
  connect(powerSensor.pc,powerSensor. pv) annotation (
    Line(points={{-54,144},{-50,144},{-50,154},{-44,154}},
                                                     color = {0, 0, 255}));
  connect(powerSensor.nv,groundDC. p) annotation (
    Line(points={{-44,134},{-44,110},{-74,110},{-74,104}},                    color = {0, 0, 255}));
  connect(irradiance.irradiance,module. variableIrradiance) annotation (Line(points={{-103,
          124},{-86,124}},                                                                             color={0,0,127}));
  connect(groundDC.p,converter. dc_n1) annotation (Line(points={{-74,104},{-74,110},
          {-20,110},{-20,118},{-14,118}},                                                                      color={0,0,255}));
  connect(converter.dc_p1,powerSensor. nc) annotation (Line(points={{-14,130},{-28,
          130},{-28,144},{-34,144}},                                                               color={0,0,255}));
  connect(converter.dc_p2, Anode.p) annotation (Line(points={{6,130},{10,130},{10,
          56},{-88,56},{-88,-10},{-82,-10}}, color={0,0,255}));
  connect(converter.dc_n2, Cathode.n) annotation (Line(points={{6,118},{110,118},
          {110,-10},{100,-10}}, color={0,0,255}));
  connect(converter.dc_n2, Ground.p)
    annotation (Line(points={{6,118},{94,118},{94,80}}, color={0,0,255}));
  annotation (experiment(
      StopTime=86400,
      __Dymola_NumberOfIntervals=2000000,
      Tolerance=1e-12,
      __Dymola_Algorithm="Dassl"));
end Electrolyzer_Conti_0D_L_PV_PPT;
