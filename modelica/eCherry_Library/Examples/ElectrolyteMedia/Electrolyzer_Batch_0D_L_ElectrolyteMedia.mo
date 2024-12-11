within eCherry_Library.Examples.ElectrolyteMedia;
model Electrolyzer_Batch_0D_L_ElectrolyteMedia
  "combining eCherry with the Electrolyte Media by Bremen et al."
  extends Modelica.Icons.Example;
  parameter eCherry_Library.Data.DataRecords.Species.SpeciesRecord specRec=Data.UserInput.Example_AlkalineWaterElectrolysis_x_eMedia_CO2.CO2Spec;
  parameter Real epsi=0;
  parameter Temperature T=300;
  parameter Pressure p=1e5;
  parameter Modelica.Units.SI.Concentration c0[specRec.nSpec]={1e-1, 1e-1,epsi,34.2,
  1,1,1,1,1,1,1,
  epsi,epsi,55e3}/1000 "the different unit is because of the eMedia";

  ElectrochemicalReactor.ElectricalDomain.Source.Potential_Source.Voltage_Fixed
    Source(Ufixed=-2, GeoRec=Data.UserInput.Example_AlkalineWaterElectrolysis.GeoRec)
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={0,50})));
  Modelica.Electrical.Analog.Basic.Ground Ground
    annotation (Placement(transformation(extent={{70,54},{50,74}})));
  eCherry_Library.ElectrochemicalReactor.Electrodes.Electrode_Planar Anode(
  redeclare model TemperatureModel =
      Properties.TemperatureModels.TemperatureConstant,
    redeclare model ActivationOverpotentialModel =
        eCherry_Library.ElectrochemicalReactor.Electrodes.Electrochemistry.Activation_Overpotential.ActivationOverpotential,
    specRec=specRec,
    reac={Data.UserInput.Example_AlkalineWaterElectrolysis_x_eMedia_CO2.OERdummy},
    CondRec=Data.UserInput.Example_AlkalineWaterElectrolysis.CondRec,
    GeoRec=Data.UserInput.Example_AlkalineWaterElectrolysis.GeoRec,
    Pi(each displayUnit="bar"),
    CathodeEl=false)
    annotation (Placement(transformation(extent={{-90,-30},{-70,-10}})));


  eCherry_Library.ElectrochemicalReactor.Electrodes.Electrode_Planar Cathode(
  redeclare model TemperatureModel =
      Properties.TemperatureModels.TemperatureConstant,
    redeclare model ActivationOverpotentialModel =
        eCherry_Library.ElectrochemicalReactor.Electrodes.Electrochemistry.Activation_Overpotential.ActivationOverpotential,
    specRec=specRec,
    CondRec=Data.UserInput.Example_AlkalineWaterElectrolysis.CondRec,
    reac={Data.UserInput.Example_AlkalineWaterElectrolysis_x_eMedia_CO2.HERdummy},
    GeoRec=Data.UserInput.Example_AlkalineWaterElectrolysis.GeoRec,
    Pi(each displayUnit="bar"),
    CathodeEl=true)
    annotation (Placement(transformation(extent={{70,-30},{90,-10}})));


  ElectrochemicalReactor.Electrolytes.ElectrolyteMedia.Electrolyte_Batch_0D_ElectrolyteMedia
    electrolyte0D_batch_eMedia(
    redeclare package Medium =
        ElectrolyteMedia.Media.LiquidPhase.MixtureLiquids.Electrolysis,
    GeoRec=Data.UserInput.Example_AlkalineWaterElectrolysis.GeoRec,
    Tstart=T,
    pstart=p,
    c0=c0,
    specRec=specRec,
    T_zero=T,
    p_zero=p,
    kappa=30) annotation (Placement(transformation(extent={{-16,-28},{4,-8}})));
equation
  connect(Ground.p, Source.p) annotation (Line(points={{60,74},{36,74},{36,50},
          {10,50}},      color={0,0,255}));
  connect(Anode.p, Source.n) annotation (Line(points={{-90,-20},{-116,-20},{
          -116,50},{-10,50}},
                    color={0,0,255}));
  connect(Source.p,Cathode. n) annotation (Line(points={{10,50},{92,50},{92,-20},
          {90,-20}},       color={0,0,255}));
  connect(Anode.flowFromElectrolyte, electrolyte0D_batch_eMedia.leftFlow)
    annotation (Line(points={{-80,-10},{-80,-2},{-24,-2},{-24,-13},{-16.8,-13}},
        color={0,0,0}));
  connect(electrolyte0D_batch_eMedia.rightFlow, Cathode.flowFromElectrolyte)
    annotation (Line(points={{4,-12},{64,-12},{64,-2},{80,-2},{80,-10}}, color={
          0,0,0}));
  connect(Anode.n, electrolyte0D_batch_eMedia.p) annotation (Line(points={{-70,-20},
          {-24,-20},{-24,-18},{-16,-18}}, color={0,0,255}));
  connect(electrolyte0D_batch_eMedia.n, Cathode.p) annotation (Line(points={{4,-18},
          {6,-18},{6,-20},{70,-20}}, color={0,0,255}));
  annotation (experiment(
      StopTime=50,
      __Dymola_NumberOfIntervals=2000,
      Tolerance=1e-12));
end Electrolyzer_Batch_0D_L_ElectrolyteMedia;
