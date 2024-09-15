within eCherry_Library.Examples.Pyschik2024;
model MultipleElectrochemicalReactions
 extends Modelica.Icons.Example;

  Modelica.Electrical.Analog.Basic.Ground Ground
    annotation (Placement(transformation(extent={{70,54},{50,74}})));
  eCherry_Library.ElectrochemicalReactor.Electrodes.Electrode Anode(
    P=100000,
    GeoRec=eCherry_Library.Data.UserInput.Pyschik2024_MultipleElectrochemicalReactions.GeoRec,
    CondRec=eCherry_Library.Data.UserInput.Pyschik2024_MultipleElectrochemicalReactions.CondRec,
    specRec=eCherry_Library.Data.UserInput.Pyschik2024_MultipleElectrochemicalReactions.CO2spec,
    reac={eCherry_Library.Data.UserInput.Pyschik2024_MultipleElectrochemicalReactions.OER},
    Pi(displayUnit="bar"),
    CathodeEl=false)
    annotation (Placement(transformation(extent={{-92,-30},{-72,-10}})));

  eCherry_Library.ElectrochemicalReactor.MaterialDomain.Flows.Material_Simple_InFlow_Fixed
    AnodeInflow(specRec=eCherry_Library.Data.UserInput.Pyschik2024_MultipleElectrochemicalReactions.CO2spec,
      molFlow_vec=eCherry_Library.Data.UserInput.Pyschik2024_MultipleElectrochemicalReactions.c0_an
        *0.0001)
    annotation (Placement(transformation(extent={{-50,-60},{-30,-40}})));

  eCherry_Library.ElectrochemicalReactor.MaterialDomain.Flows.Material_Simple_InFlow_Fixed
    CathodeInflow(specRec=eCherry_Library.Data.UserInput.Pyschik2024_MultipleElectrochemicalReactions.CO2spec,
      molFlow_vec=eCherry_Library.Data.UserInput.Pyschik2024_MultipleElectrochemicalReactions.c0_cat
        *0.0001)
    annotation (Placement(transformation(extent={{30,-60},{50,-40}})));
  eCherry_Library.ElectrochemicalReactor.MaterialDomain.Flows.Material_Simple_ConnectingFlow
    Flow_anode(specRec=eCherry_Library.Data.UserInput.Pyschik2024_MultipleElectrochemicalReactions.CO2spec)
    annotation (Placement(transformation(extent={{-50,-4},{-30,16}})));
  eCherry_Library.ElectrochemicalReactor.MaterialDomain.Flows.Environment
    env_anode(specRec=eCherry_Library.Data.UserInput.Pyschik2024_MultipleElectrochemicalReactions.CO2spec)
    annotation (Placement(transformation(extent={{-50,22},{-30,42}})));
  eCherry_Library.ElectrochemicalReactor.MaterialDomain.Flows.Material_Simple_ConnectingFlow
    Flow_Cathode(specRec=eCherry_Library.Data.UserInput.Pyschik2024_MultipleElectrochemicalReactions.CO2spec)
    annotation (Placement(transformation(extent={{30,-4},{50,16}})));
  eCherry_Library.ElectrochemicalReactor.MaterialDomain.Flows.Environment
    env_cathode(specRec=eCherry_Library.Data.UserInput.Pyschik2024_MultipleElectrochemicalReactions.CO2spec)
    annotation (Placement(transformation(extent={{30,22},{50,42}})));
  eCherry_Library.ElectrochemicalReactor.Electrolytes.Liquid.Electrolyte_Conti_0D_L
    Anolyte(
    c0=eCherry_Library.Data.UserInput.Pyschik2024_MultipleElectrochemicalReactions.c0_an,
    specRec=eCherry_Library.Data.UserInput.Pyschik2024_MultipleElectrochemicalReactions.CO2spec,
    GeoRec=eCherry_Library.Data.UserInput.Pyschik2024_MultipleElectrochemicalReactions.GeoRec,
    CondRec=eCherry_Library.Data.UserInput.Pyschik2024_MultipleElectrochemicalReactions.CondRec,
    X=0.02,
    kappa_const=50)
    annotation (Placement(transformation(extent={{-50,-30},{-30,-10}})));

  eCherry_Library.ElectrochemicalReactor.Electrolytes.Liquid.Electrolyte_Conti_0D_L
    Catholyte(
    c0=eCherry_Library.Data.UserInput.Pyschik2024_MultipleElectrochemicalReactions.c0_cat,
    specRec=eCherry_Library.Data.UserInput.Pyschik2024_MultipleElectrochemicalReactions.CO2spec,
    GeoRec=eCherry_Library.Data.UserInput.Pyschik2024_MultipleElectrochemicalReactions.GeoRec,
    CondRec=eCherry_Library.Data.UserInput.Pyschik2024_MultipleElectrochemicalReactions.CondRec,
    X=0.02,
    kappa_const=50)
    annotation (Placement(transformation(extent={{30,-30},{50,-10}})));

  eCherry_Library.ElectrochemicalReactor.Separators.Membrane membrane(
    specRec=eCherry_Library.Data.UserInput.Pyschik2024_MultipleElectrochemicalReactions.CO2spec,
    GeoRec=eCherry_Library.Data.UserInput.Pyschik2024_MultipleElectrochemicalReactions.GeoRec,
    CondRec=eCherry_Library.Data.UserInput.Example_AlkalineWaterElectrolysis.CondRec,
    X=115*10^(-6),
    kappa=9.3)
    annotation (Placement(transformation(extent={{-10,-30},{10,-10}})));

  eCherry_Library.ElectrochemicalReactor.Electrodes.Electrode cathode(
    T0=566.3,
    P=100000,
    GeoRec=eCherry_Library.Data.UserInput.Pyschik2024_MultipleElectrochemicalReactions.GeoRec,
    CondRec=eCherry_Library.Data.UserInput.Pyschik2024_MultipleElectrochemicalReactions.CondRec,
    specRec=eCherry_Library.Data.UserInput.Pyschik2024_MultipleElectrochemicalReactions.CO2spec,
    reac={eCherry_Library.Data.UserInput.Pyschik2024_MultipleElectrochemicalReactions.HER,eCherry_Library.Data.UserInput.Pyschik2024_MultipleElectrochemicalReactions.COERAg},
    CathodeEl=true)
    annotation (Placement(transformation(extent={{72,-30},{92,-10}})));

  eCherry_Library.ElectrochemicalReactor.ElectricalDomain.Source.Current_Source.CurrentDensity_Fixed
    constantCurrentDensity(GeoRec=eCherry_Library.Data.UserInput.Pyschik2024_MultipleElectrochemicalReactions.GeoRec,
      jFixed=50) annotation (Placement(transformation(
        extent={{10,10},{-10,-10}},
        rotation=0,
        origin={0,70})));

    Real FaradaicEffH2;
    Real FaradaicEffCO2;
equation
  FaradaicEffH2=cathode.reactions[1].actOp.i/cathode.n.i*100;
  FaradaicEffCO2=cathode.reactions[2].actOp.i/cathode.n.i*100;

  connect(Flow_anode.convoutFlow, env_anode.convFlow)
    annotation (Line(points={{-40,16},{-40,22}}, color={0,0,0}));
  connect(Flow_Cathode.convoutFlow, env_cathode.convFlow)
    annotation (Line(points={{40,16},{40,22}}, color={0,0,0}));
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
  connect(Flow_Cathode.convinFlow, Catholyte.outFlow)
    annotation (Line(points={{40,-4},{40,-10}}, color={0,0,0}));
  connect(membrane.catCon, Catholyte.leftFlow) annotation (Line(points={{10,-14},
          {30,-14}},                            color={0,0,0}));
  connect(Catholyte.p, membrane.n) annotation (Line(points={{30,-20},{10,-20}},
                                color={0,0,255}));
  connect(membrane.anCon, Anolyte.rightFlow) annotation (Line(points={{-10,-14},
          {-30,-14}},                              color={0,0,0}));
  connect(membrane.p, Anolyte.n) annotation (Line(points={{-10,-20},{-30,-20}},
                                         color={0,0,255}));
  connect(Catholyte.rightFlow, cathode.flowFromElectrolyte) annotation (Line(
        points={{50,-14},{61.1,-14},{61.1,-10},{82,-10}},       color={0,0,0}));
  connect(Catholyte.n, cathode.p) annotation (Line(points={{50,-20},{72,-20}},
                                     color={0,0,255}));
  connect(cathode.n, Ground.p) annotation (Line(points={{92,-20},{96,-20},{96,
          80},{60,80},{60,74}}, color={0,0,255}));
  connect(Anode.p, constantCurrentDensity.n) annotation (Line(points={{-92,-20},
          {-96,-20},{-96,70},{-10,70}},
                                      color={0,0,255}));
  connect(constantCurrentDensity.p, Ground.p) annotation (Line(points={{10,70},
          {44,70},{44,74},{60,74}},color={0,0,255}));
    annotation (Placement(transformation(extent={{70,-30},{90,-10}})),
              experiment(
      StopTime=5,
      __Dymola_NumberOfIntervals=2000,
      Tolerance=1e-12,
      __Dymola_Algorithm="Dassl"));
end MultipleElectrochemicalReactions;
