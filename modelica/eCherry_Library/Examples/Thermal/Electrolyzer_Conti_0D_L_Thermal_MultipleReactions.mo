within eCherry_Library.Examples.Thermal;
model Electrolyzer_Conti_0D_L_Thermal_MultipleReactions
 extends Modelica.Icons.Example;
 import Echery_library =
         eCherry_Library;
  Modelica.Electrical.Analog.Basic.Ground Ground
    annotation (Placement(transformation(extent={{70,54},{50,74}})));
  eCherry_Library.ElectrochemicalReactor.Electrodes.Electrode_Thermal Anode(
    redeclare model ActivationOverpotentialModel =
        eCherry_Library.ElectrochemicalReactor.Electrodes.Electrochemistry.Activation_Overpotential.ActivationOverpotential,
    P=100000,
    GeoRec=Echery_library.Data.UserInput.Pyschik2024_MultipleElectrochemicalReactions.GeoRec,
    CondRec=Echery_library.Data.UserInput.Pyschik2024_MultipleElectrochemicalReactions.CondRec,
    specRec=Echery_library.Data.UserInput.Pyschik2024_MultipleElectrochemicalReactions.CO2spec,
    reac={Echery_library.Data.UserInput.Pyschik2024_MultipleElectrochemicalReactions.OER},
    CathodeEl=false,
    EBRec=Echery_library.Data.UserInput.Example_AlkalineWaterElectrolysis.EBdummy)
    annotation (Placement(transformation(extent={{-92,-30},{-72,-10}})));

  Echery_library.ElectrochemicalReactor.ThermalDomain.Material_Thermal.FixedConvInflow_L_Thermal
    AnodeInflow(
    specRec=Echery_library.Data.UserInput.Pyschik2024_MultipleElectrochemicalReactions.CO2spec,
    molFlow_vec=Echery_library.Data.UserInput.Pyschik2024_MultipleElectrochemicalReactions.c0_an
        *0.0001,
    EBRec=Echery_library.Data.UserInput.Example_AlkalineWaterElectrolysis.EBdummy)
    annotation (Placement(transformation(extent={{-50,-60},{-30,-40}})));

  Echery_library.ElectrochemicalReactor.ThermalDomain.Material_Thermal.FixedConvInflow_L_Thermal
    CathodeInflow(
    specRec=Echery_library.Data.UserInput.Pyschik2024_MultipleElectrochemicalReactions.CO2spec,
    molFlow_vec=Echery_library.Data.UserInput.Pyschik2024_MultipleElectrochemicalReactions.c0_cat
        *0.0001,
    EBRec=Echery_library.Data.UserInput.Example_AlkalineWaterElectrolysis.EBdummy)
    annotation (Placement(transformation(extent={{30,-60},{50,-40}})));

  Echery_library.ElectrochemicalReactor.MaterialDomain.Flows.ConnectingFlowL
    Flow_anode(specRec=Echery_library.Data.UserInput.Pyschik2024_MultipleElectrochemicalReactions.CO2spec)
    annotation (Placement(transformation(extent={{-50,-4},{-30,16}})));
  Echery_library.ElectrochemicalReactor.MaterialDomain.Flows.EnvironmentL
    env_anode(specRec=Echery_library.Data.UserInput.Pyschik2024_MultipleElectrochemicalReactions.CO2spec)
    annotation (Placement(transformation(extent={{-50,22},{-30,42}})));
  Echery_library.ElectrochemicalReactor.MaterialDomain.Flows.ConnectingFlowL
    Flow_cathode(specRec=Echery_library.Data.UserInput.Pyschik2024_MultipleElectrochemicalReactions.CO2spec)
    annotation (Placement(transformation(extent={{30,-6},{50,14}})));
  Echery_library.ElectrochemicalReactor.MaterialDomain.Flows.EnvironmentL
    env_cathode(specRec=Echery_library.Data.UserInput.Pyschik2024_MultipleElectrochemicalReactions.CO2spec)
    annotation (Placement(transformation(extent={{30,22},{50,42}})));
  Echery_library.ElectrochemicalReactor.Electrolytes.Thermal.Electrolyte_Conti_0D_L_Thermal
    Anolyte(
    c0=Echery_library.Data.UserInput.Pyschik2024_MultipleElectrochemicalReactions.c0_an
         .+ 10^(-3),
    specRec=Echery_library.Data.UserInput.Pyschik2024_MultipleElectrochemicalReactions.CO2spec,
    GeoRec=Echery_library.Data.UserInput.Pyschik2024_MultipleElectrochemicalReactions.GeoRec,
    CondRec=Echery_library.Data.UserInput.Pyschik2024_MultipleElectrochemicalReactions.CondRec,
    X=0.02,
    QFlow_shunt=0,
    kappa_const=50,
    EBRec=Echery_library.Data.UserInput.Example_AlkalineWaterElectrolysis.EBdummy)
    annotation (Placement(transformation(extent={{-50,-30},{-30,-10}})));

  Echery_library.ElectrochemicalReactor.Electrolytes.Thermal.Electrolyte_Conti_0D_L_Thermal
    Catholyte(
    c0=Echery_library.Data.UserInput.Pyschik2024_MultipleElectrochemicalReactions.c0_cat,
    specRec=Echery_library.Data.UserInput.Pyschik2024_MultipleElectrochemicalReactions.CO2spec,
    GeoRec=Echery_library.Data.UserInput.Pyschik2024_MultipleElectrochemicalReactions.GeoRec,
    CondRec=Echery_library.Data.UserInput.Pyschik2024_MultipleElectrochemicalReactions.CondRec,
    X=0.02,
    QFlow_shunt=0,
    kappa_const=50,
    EBRec=Echery_library.Data.UserInput.Example_AlkalineWaterElectrolysis.EBdummy)
    annotation (Placement(transformation(extent={{30,-30},{50,-10}})));

  Echery_library.ElectrochemicalReactor.Separators.Thermal.Membrane_Thermal
    membrane(
    specRec=Echery_library.Data.UserInput.Pyschik2024_MultipleElectrochemicalReactions.CO2spec,
    GeoRec=Echery_library.Data.UserInput.Pyschik2024_MultipleElectrochemicalReactions.GeoRec,
    CondRec=Echery_library.Data.UserInput.Example_AlkalineWaterElectrolysis.CondRec,
    X=115*10^(-6),
    kappa=9.3,
    EBRec=Echery_library.Data.UserInput.Example_AlkalineWaterElectrolysis.EBdummy)
    annotation (Placement(transformation(extent={{-12,-32},{8,-12}})));

  eCherry_Library.ElectrochemicalReactor.Electrodes.Electrode_Thermal cathode(
    redeclare model ActivationOverpotentialModel =
        eCherry_Library.ElectrochemicalReactor.Electrodes.Electrochemistry.Activation_Overpotential.ActivationOverpotential,
    T0=566.3,
    P=100000,
    GeoRec=Echery_library.Data.UserInput.Pyschik2024_MultipleElectrochemicalReactions.GeoRec,
    CondRec=Echery_library.Data.UserInput.Pyschik2024_MultipleElectrochemicalReactions.CondRec,
    specRec=Echery_library.Data.UserInput.Pyschik2024_MultipleElectrochemicalReactions.CO2spec,
    reac={Echery_library.Data.UserInput.Pyschik2024_MultipleElectrochemicalReactions.HER,
        Echery_library.Data.UserInput.Pyschik2024_MultipleElectrochemicalReactions.COERAg},
    CathodeEl=true,
    EBRec=Echery_library.Data.UserInput.Example_AlkalineWaterElectrolysis.EBdummy)
    annotation (Placement(transformation(extent={{72,-30},{92,-10}})));

  Echery_library.ElectrochemicalReactor.ThermalDomain.Source.ExternalHeating
    externalHeatingAnode(EBRec=Echery_library.Data.UserInput.Example_AlkalineWaterElectrolysis.EBdummy)
    annotation (Placement(transformation(extent={{-102,-60},{-82,-40}})));
  Echery_library.ElectrochemicalReactor.ThermalDomain.Source.ExternalHeating
    externalHeatingCathode(EBRec=Echery_library.Data.UserInput.Example_AlkalineWaterElectrolysis.EBdummy)
    annotation (Placement(transformation(extent={{80,-60},{100,-40}})));
    Real FaradaicEffH2;
    Real FaradaicEffCO2;
  Echery_library.ElectrochemicalReactor.ElectricalDomain.Source.Current_Source.ConstantCurrentDensity
    constantCurrentDensity(GeoRec=eCherry_Library.Data.UserInput.Pyschik2024_MultipleElectrochemicalReactions.GeoRec,
      jFixed=50)   annotation (Placement(transformation(
        extent={{10,10},{-10,-10}},
        rotation=0,
        origin={-28,56})));
equation
  FaradaicEffH2=cathode.reactions[1].actOp.i/cathode.n.i*100;
  FaradaicEffCO2=cathode.reactions[2].actOp.i/cathode.n.i*100;

  connect(Flow_anode.convoutFlow, env_anode.convFlow)
    annotation (Line(points={{-40,16},{-40,22}}, color={0,0,0}));
  connect(Flow_cathode.convoutFlow, env_cathode.convFlow)
    annotation (Line(points={{40,14},{40,22}}, color={0,0,0}));
  connect(Flow_anode.convinFlow, Anolyte.outFlow)
    annotation (Line(points={{-40,-4},{-40,-10}}, color={0,0,0}));
  connect(Anode.n, Anolyte.p)
    annotation (Line(points={{-72,-20},{-50,-20}}, color={0,0,255}));
  connect(Anolyte.leftFlow, Anode.flowFromElectrolyte) annotation (Line(points={{-50,-14},
          {-66,-14},{-66,-2},{-82,-2},{-82,-10}},            color={0,0,0}));
  connect(Anolyte.inFlow, AnodeInflow.convFlow)
    annotation (Line(points={{-40,-30},{-40,-40}}, color={0,0,0}));
  connect(Catholyte.inFlow, CathodeInflow.convFlow)
    annotation (Line(points={{40,-30},{40,-40}}, color={0,0,0}));
  connect(Flow_cathode.convinFlow, Catholyte.outFlow)
    annotation (Line(points={{40,-6},{40,-10}}, color={0,0,0}));
  connect(membrane.catCon, Catholyte.leftFlow) annotation (Line(points={{8,-16},
          {22,-16},{22,-14},{30,-14}},          color={0,0,0}));
  connect(Catholyte.p, membrane.n) annotation (Line(points={{30,-20},{19,-20},{
          19,-22},{8,-22}},     color={0,0,255}));
  connect(membrane.anCon, Anolyte.rightFlow) annotation (Line(points={{-12,-16},
          {-20,-16},{-20,-14},{-30,-14}},          color={0,0,0}));
  connect(membrane.p, Anolyte.n) annotation (Line(points={{-12,-22},{-20.9,-22},
          {-20.9,-20},{-30,-20}},        color={0,0,255}));
  connect(Catholyte.rightFlow, cathode.flowFromElectrolyte) annotation (Line(
        points={{50,-14},{61.1,-14},{61.1,-10},{82,-10}},       color={0,0,0}));
  connect(Catholyte.n, cathode.p) annotation (Line(points={{50,-20},{61.1,-20},{
          61.1,-20},{72,-20}},       color={0,0,255}));
  connect(cathode.n, Ground.p) annotation (Line(points={{92,-20},{96,-20},{96,80},
          {60,80},{60,74}},     color={0,0,255}));
  connect(Anode.leftHeatFlow, externalHeatingAnode.heatFlow)
    annotation (Line(points={{-92,-24.6},{-92,-40}}, color={0,0,0}));
  connect(Anode.rightHeatFlow, Anolyte.leftHeatFlow) annotation (Line(points={{-72,
          -24.6},{-61.2,-24.6},{-61.2,-24.6},{-50,-24.6}},       color={0,0,0}));
  connect(AnodeInflow.convHeatFlow, Anolyte.heatConvInFlow)
    annotation (Line(points={{-45,-39},{-45,-31}}, color={0,0,0}));
  connect(membrane.leftHeatFlow, Anolyte.rightHeatFlow) annotation (Line(points={{-12,
          -26.6},{-12,-24.6},{-30,-24.6}},            color={0,0,0}));
  connect(membrane.rightHeatFlow, Catholyte.leftHeatFlow) annotation (Line(
        points={{8,-26.6},{8,-24.6},{30,-24.6}},     color={0,0,0}));
  connect(Catholyte.heatConvInFlow, CathodeInflow.convHeatFlow)
    annotation (Line(points={{35,-31},{35,-39}}, color={0,0,0}));
  connect(Catholyte.rightHeatFlow, cathode.leftHeatFlow)
    annotation (Line(points={{50,-24.6},{60,-24.6},{60,-24.6},{72,-24.6}},
                                                       color={0,0,0}));
  connect(cathode.rightHeatFlow, externalHeatingCathode.heatFlow) annotation (
      Line(points={{92,-24.6},{92,-32},{90,-32},{90,-40}},     color={0,0,0}));
  connect(constantCurrentDensity.n, Anode.p) annotation (Line(points={{-38,56},{
          -98,56},{-98,-20},{-92,-20}}, color={0,0,255}));
  connect(constantCurrentDensity.p, Ground.p) annotation (Line(points={{-18,56},
          {44,56},{44,74},{60,74}}, color={0,0,255}));
end Electrolyzer_Conti_0D_L_Thermal_MultipleReactions;
