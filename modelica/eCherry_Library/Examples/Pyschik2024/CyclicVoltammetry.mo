within eCherry_Library.Examples.Pyschik2024;
model CyclicVoltammetry
  "Cyclic voltammetry example model, to decrease the computational time, number of discretization elements was set to 100 instead of 500 as in Pyschick2024"

    extends Modelica.Icons.Example;

  Modelica.Electrical.Analog.Basic.Ground Ground
    annotation (Placement(transformation(extent={{70,54},{50,74}})));
  eCherry_Library.ElectrochemicalReactor.Electrodes.Electrode_Planar Anode(
    T0(displayUnit="K"),
    redeclare model ActivationOverpotentialModel =
        eCherry_Library.ElectrochemicalReactor.Electrodes.Electrochemistry.Activation_Overpotential.ActivationOverpotential,
    redeclare model TemperatureModel =
      Properties.TemperatureModels.TemperatureConstant,
    GeoRec=Data.UserInput.Pyschik2024_CyclicVoltammetry.GeoRec,
    CondRec=Data.UserInput.Pyschik2024_CyclicVoltammetry.CondRec,
    specRec=Data.UserInput.Pyschik2024_CyclicVoltammetry.FRRspec,
    reac={Data.UserInput.Pyschik2024_CyclicVoltammetry.FCOR},
    Pi(each displayUnit="bar"),
    CathodeEl=false,
    reactions(actOp(etaRef(start={-0.014342580163325295}))))
    annotation (Placement(transformation(extent={{-84,-34},{-64,-14}})));

  ElectrochemicalReactor.Electrolytes.Liquid.Electrolyte_Batch_0D_L electrolyte(
    GeoRec=Data.UserInput.Pyschik2024_CyclicVoltammetry.GeoRec,
    CondRec=Data.UserInput.Pyschik2024_CyclicVoltammetry.CondRec,
    redeclare model TemperatureModel =
      Properties.TemperatureModels.TemperatureConstant,
    X=0.1,
    specRec=Data.UserInput.Pyschik2024_CyclicVoltammetry.FRRspec,
    kappa_const=30000,
    c0=Data.UserInput.Pyschik2024_CyclicVoltammetry.c0)
    annotation (Placement(transformation(extent={{26,-32},{46,-12}})));
  ElectrochemicalReactor.MaterialDomain.ConnectionLayers.ConnectionLayer_Diffusive
    diffusiveConnectionLayer(
    specRec=Data.UserInput.Pyschik2024_CyclicVoltammetry.FRRspec,
    GeoRec=Data.UserInput.Pyschik2024_CyclicVoltammetry.GeoRec,
    dX=1e-5) annotation (Placement(transformation(extent={{8,-4},{28,16}})));
  ElectrochemicalReactor.Electrolytes.Liquid.Electrolyte_Batch_1D_L_nLayers
    Anolyte(
    specRec=Data.UserInput.Pyschik2024_CyclicVoltammetry.FRRspec,
    GeoRec=Data.UserInput.Pyschik2024_CyclicVoltammetry.GeoRec,
    CondRec=Data.UserInput.Pyschik2024_CyclicVoltammetry.CondRec,
    X_difflayer=0.0001,
    n_slices=100,
    c0=Data.UserInput.Pyschik2024_CyclicVoltammetry.c0,
    kappa_con=30000)
    annotation (Placement(transformation(extent={{-18,-36},{2,-16}})));
  ElectrochemicalReactor.ElectricalDomain.Source.Potential_Source.Voltage_CyclicVoltammetry
    source(
    GeoRec=Data.UserInput.Pyschik2024_CyclicVoltammetry.GeoRec,
    Scanrate=10,
    Uaux=0.35,
    Ubase=0.05)
    annotation (Placement(transformation(extent={{-30,26},{-50,46}})));
equation
  connect(diffusiveConnectionLayer.rightFlow, electrolyte.leftFlow) annotation (
     Line(points={{28,12},{36,12},{36,-8},{26,-8},{26,-16}}, color={0,0,0}));
  connect(Anolyte.rightFlow, diffusiveConnectionLayer.leftFlow)
    annotation (Line(points={{2,-20},{2,11.5},{7.6,11.5}}, color={0,0,0}));
  connect(Anolyte.n, electrolyte.p) annotation (Line(points={{2,-26},{20,-26},{
          20,-22},{26,-22}}, color={0,0,255}));
  connect(source.n, Anode.p) annotation (Line(points={{-50,36},{-90,36},{-90,
          -24},{-84,-24}},color={0,0,255}));
  connect(source.p, electrolyte.n) annotation (Line(points={{-30,36},{-24,36},{
          -24,34},{56,34},{56,-22},{46,-22}}, color={0,0,255}));
  connect(source.p, Ground.p) annotation (Line(points={{-30,36},{-24,36},{-24,
          34},{44,34},{44,74},{60,74}}, color={0,0,255}));
  connect(Anolyte.leftFlow, Anode.flowFromElectrolyte) annotation (Line(points=
          {{-18,-20},{-22,-20},{-22,-14},{-74,-14}}, color={0,0,0}));
  connect(Anode.n, Anolyte.p) annotation (Line(points={{-64,-24},{-26,-24},{-26,
          -26},{-18,-26}}, color={0,0,255}));
  annotation (experiment(
      StopTime=0.5,
      __Dymola_NumberOfIntervals=2000,
      Tolerance=1e-12,
      __Dymola_Algorithm="Dassl"));
end CyclicVoltammetry;
