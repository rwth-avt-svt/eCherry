within eCherry_Library.Examples.Continuous;
model Electrolyzer_Conti_0D_L_KOH
  "Example model showing the influence of calculating the conductivity depending on the electrolyte concentration."
 extends Modelica.Icons.Example;
 import  eCherry_Library;
  eCherry_Library.ElectrochemicalReactor.ElectricalDomain.Source.Potential_Source.Voltage_Fixed
    Source(GeoRec=eCherry_Library.Data.UserInput.Example_AlkalineWaterElectrolysis_KOH.GeoRec,
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
    redeclare model ActivationOverpotentialModel =
        eCherry_Library.ElectrochemicalReactor.Electrodes.Electrochemistry.Activation_Overpotential.ActivationOverpotential,
    GeoRec=eCherry_Library.Data.UserInput.Example_AlkalineWaterElectrolysis_KOH.GeoRec,
    CondRec=eCherry_Library.Data.UserInput.Example_AlkalineWaterElectrolysis_KOH.CondRec,
    specRec=eCherry_Library.Data.UserInput.Example_AlkalineWaterElectrolysis_KOH.AWEKOHspec,
    reac={eCherry_Library.Data.UserInput.Example_AlkalineWaterElectrolysis_KOH.OERdummy},
    Pi(each displayUnit="bar"),
    CathodeEl=false)
    annotation (Placement(transformation(extent={{-90,-30},{-70,-10}})));

  eCherry_Library.ElectrochemicalReactor.Electrodes.Electrode_Planar Cathode(
    P=100000,
    redeclare model TemperatureModel =
      Properties.TemperatureModels.TemperatureConstant,
    GeoRec=eCherry_Library.Data.UserInput.Example_AlkalineWaterElectrolysis_KOH.GeoRec,
    CondRec=eCherry_Library.Data.UserInput.Example_AlkalineWaterElectrolysis_KOH.CondRec,
    redeclare model ActivationOverpotentialModel =
        eCherry_Library.ElectrochemicalReactor.Electrodes.Electrochemistry.Activation_Overpotential.ActivationOverpotential,
    specRec=eCherry_Library.Data.UserInput.Example_AlkalineWaterElectrolysis_KOH.AWEKOHspec,
    reac={eCherry_Library.Data.UserInput.Example_AlkalineWaterElectrolysis_KOH.HERdummy},
    Pi(each displayUnit="bar"),
    CathodeEl=true)
    annotation (Placement(transformation(extent={{70,-30},{90,-10}})));

  eCherry_Library.ElectrochemicalReactor.MaterialDomain.Flows.Material_Simple_InFlow_Fixed
    AnodeInflow(specRec=eCherry_Library.Data.UserInput.Example_AlkalineWaterElectrolysis_KOH.AWEKOHspec,
      molFlow_vec={0,1.45e-12,1e-4,50,50,55e3}*0.000001)
    annotation (Placement(transformation(extent={{-50,-60},{-30,-40}})));
  eCherry_Library.ElectrochemicalReactor.MaterialDomain.Flows.Material_Simple_InFlow_Fixed
    CathodeInflow(specRec=eCherry_Library.Data.UserInput.Example_AlkalineWaterElectrolysis_KOH.AWEKOHspec,
      molFlow_vec={0,1.45e-12,1e-4,6000,6000,55e3}*0.000001)
    annotation (Placement(transformation(extent={{30,-60},{50,-40}})));
  eCherry_Library.ElectrochemicalReactor.Separators.Diaphragm_Hydroxide
    Diaphragm(
    redeclare model TemperatureModel =
      Properties.TemperatureModels.TemperatureConstant,
    specRec=eCherry_Library.Data.UserInput.Example_AlkalineWaterElectrolysis_KOH.AWEKOHspec,
    GeoRec=eCherry_Library.Data.UserInput.Example_AlkalineWaterElectrolysis_KOH.GeoRec,
    CondRec=eCherry_Library.Data.UserInput.Example_AlkalineWaterElectrolysis.CondRec,
    X=5e-4,
    kappa=38)
    annotation (Placement(transformation(extent={{-10,-30},{10,-10}})));

  eCherry_Library.ElectrochemicalReactor.MaterialDomain.Flows.Material_Simple_ConnectingFlow
    Flow_anode(specRec=eCherry_Library.Data.UserInput.Example_AlkalineWaterElectrolysis_KOH.AWEKOHspec)
    annotation (Placement(transformation(extent={{-50,-4},{-30,16}})));
  eCherry_Library.ElectrochemicalReactor.MaterialDomain.Flows.Environment
    env_anode(specRec=eCherry_Library.Data.UserInput.Example_AlkalineWaterElectrolysis_KOH.AWEKOHspec)
    annotation (Placement(transformation(extent={{-50,26},{-30,46}})));
  eCherry_Library.ElectrochemicalReactor.MaterialDomain.Flows.Material_Simple_ConnectingFlow
    Flow_Cathode(specRec=eCherry_Library.Data.UserInput.Example_AlkalineWaterElectrolysis_KOH.AWEKOHspec)
    annotation (Placement(transformation(extent={{30,-4},{50,16}})));
  eCherry_Library.ElectrochemicalReactor.MaterialDomain.Flows.Environment
    env_cathode(specRec=eCherry_Library.Data.UserInput.Example_AlkalineWaterElectrolysis_KOH.AWEKOHspec)
    annotation (Placement(transformation(extent={{30,24},{50,44}})));

  eCherry_Library.ElectrochemicalReactor.Electrolytes.Liquid.Electrolyte_Conti_0D_L
    Anolyte(
    redeclare model TemperatureModel =
      Properties.TemperatureModels.TemperatureConstant,
    c0={0,1.45e-12,1e-4,6000,6000,55e3},
    specRec=eCherry_Library.Data.UserInput.Example_AlkalineWaterElectrolysis_KOH.AWEKOHspec,
    GeoRec=eCherry_Library.Data.UserInput.Example_AlkalineWaterElectrolysis_KOH.GeoRec,
    CondRec=eCherry_Library.Data.UserInput.Example_AlkalineWaterElectrolysis_KOH.CondRec,
    redeclare model ConductivityModel =
        eCherry_Library.ElectrochemicalReactor.Properties.ConductivityModels.ConductivityElectrolyteCalcKOH)
    annotation (Placement(transformation(extent={{-50,-30},{-30,-10}})));

  eCherry_Library.ElectrochemicalReactor.Electrolytes.Liquid.Electrolyte_Conti_0D_L
    Catholyte(
    redeclare model TemperatureModel =
      Properties.TemperatureModels.TemperatureConstant,
    c0={0,1.45e-12,1e-4,1000,1000,55e3},
    specRec=eCherry_Library.Data.UserInput.Example_AlkalineWaterElectrolysis_KOH.AWEKOHspec,
    GeoRec=eCherry_Library.Data.UserInput.Example_AlkalineWaterElectrolysis_KOH.GeoRec,
    CondRec=eCherry_Library.Data.UserInput.Example_AlkalineWaterElectrolysis_KOH.CondRec,
    redeclare model ConductivityModel =
        eCherry_Library.ElectrochemicalReactor.Properties.ConductivityModels.ConductivityElectrolyteCalcKOH)
    annotation (Placement(transformation(extent={{30,-30},{50,-10}})));

equation
  connect(Ground.p, Source.p) annotation (Line(points={{60,74},{36,74},{36,50},
          {10,50}},      color={0,0,255}));
  connect(Anode.p, Source.n) annotation (Line(points={{-90,-20},{-94,-20},{-94,
          50},{-10,50}},
                    color={0,0,255}));
  connect(Source.p,Cathode. n) annotation (Line(points={{10,50},{96,50},{96,-20},
          {90,-20}},       color={0,0,255}));

  connect(Flow_anode.convoutFlow, env_anode.convFlow)
    annotation (Line(points={{-40,16},{-40,26}}, color={0,0,0}));
  connect(Flow_Cathode.convoutFlow, env_cathode.convFlow)
    annotation (Line(points={{40,16},{40,24}}, color={0,0,0}));
  connect(Anolyte.rightFlow, Diaphragm.anCon)
    annotation (Line(points={{-30,-14},{-10,-14}}, color={0,0,0}));
  connect(Anolyte.n, Diaphragm.p)
    annotation (Line(points={{-30,-20},{-10,-20}}, color={0,0,255}));
  connect(Anolyte.inFlow, AnodeInflow.convFlow)
    annotation (Line(points={{-40,-30},{-40,-40}}, color={0,0,0}));
  connect(Anolyte.outFlow, Flow_anode.convinFlow)
    annotation (Line(points={{-40,-10},{-40,-4}}, color={0,0,0}));
  connect(Anolyte.leftFlow, Anode.flowFromElectrolyte) annotation (Line(points={
          {-50,-14},{-66,-14},{-66,-2},{-80,-2},{-80,-10}}, color={0,0,0}));
  connect(Anode.n, Anolyte.p)
    annotation (Line(points={{-70,-20},{-50,-20}}, color={0,0,255}));
  connect(Flow_Cathode.convinFlow, Catholyte.outFlow)
    annotation (Line(points={{40,-4},{40,-10}}, color={0,0,0}));
  connect(Catholyte.rightFlow, Cathode.flowFromElectrolyte) annotation (Line(
        points={{50,-14},{66,-14},{66,-2},{80,-2},{80,-10}}, color={0,0,0}));
  connect(Cathode.p, Catholyte.n)
    annotation (Line(points={{70,-20},{50,-20}}, color={0,0,255}));
  connect(Catholyte.inFlow, CathodeInflow.convFlow)
    annotation (Line(points={{40,-30},{40,-40}}, color={0,0,0}));
  connect(Catholyte.p, Diaphragm.n)
    annotation (Line(points={{30,-20},{10,-20}}, color={0,0,255}));
  connect(Diaphragm.catCon, Catholyte.leftFlow)
    annotation (Line(points={{10,-14},{30,-14}}, color={0,0,0}));
  annotation (experiment(
      StopTime=50,
      __Dymola_NumberOfIntervals=2000,
      Tolerance=1e-05,
      __Dymola_Algorithm="Dassl"),
                        Documentation(info="<html>
<p>The concentration of the eletrolyte in the compartemnts is different from the inflow, resulting in the electrolyte concentration to increase in the anolyte and to decrease in the catolyte. Therefore, the conductivity of both eletrolyte compartments change. </p>
<p>The model has a constant potential source. The changes in the conductivity result in changes in the ohmic overpotential and thus influencing the other overpotentials and the total current. </p>
</html>"));
end Electrolyzer_Conti_0D_L_KOH;
