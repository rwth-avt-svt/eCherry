within eCherry_Library.Examples.Batch.Batch1D;
model Electrolyzer_Batch_1D_L_Ndiscs

    extends Modelica.Icons.Example;
 parameter Integer n_slices=100 "in the diffusion layer, how many slices?";
  ElectrochemicalReactor.ElectricalDomain.Source.Potential_Source.Voltage_Fixed
    Source(
    GeoRec=Data.UserInput.Example_AlkalineWaterElectrolysis.GeoRec,
    Y=0.1,
    Z=0.1,
    Ufixed=-2.3) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={0,50})));
  Modelica.Electrical.Analog.Basic.Ground Ground
    annotation (Placement(transformation(extent={{70,54},{50,74}})));
  eCherry_Library.ElectrochemicalReactor.Electrodes.Electrode_Planar Anode(
  redeclare model TemperatureModel =
      Properties.TemperatureModels.TemperatureConstant,
    GeoRec=Data.UserInput.Example_AlkalineWaterElectrolysis.GeoRec,
    CondRec=Data.UserInput.Example_AlkalineWaterElectrolysis.CondRec,
    specRec=Data.UserInput.Example_AlkalineWaterElectrolysis.AWEspec,
    reac={Data.UserInput.Example_AlkalineWaterElectrolysis.OERdummy},
    Y=0.1,
    Z=0.1,
    Pi(each displayUnit="bar"),
    CathodeEl=false)
    annotation (Placement(transformation(extent={{-84,-34},{-64,-14}})));
  eCherry_Library.ElectrochemicalReactor.Electrodes.Electrode_Planar Cathode(
  redeclare model TemperatureModel =
      Properties.TemperatureModels.TemperatureConstant,
    GeoRec=Data.UserInput.Example_AlkalineWaterElectrolysis.GeoRec,
    CondRec=Data.UserInput.Example_AlkalineWaterElectrolysis.CondRec,
    specRec=Data.UserInput.Example_AlkalineWaterElectrolysis.AWEspec,
    reac={Data.UserInput.Example_AlkalineWaterElectrolysis.HERdummy},
    Y=0.1,
    Z=0.1,
    Pi(each displayUnit="bar"),
    CathodeEl=true)
    annotation (Placement(transformation(extent={{126,-34},{146,-14}})));

  ElectrochemicalReactor.Electrolytes.Liquid.Electrolyte_Batch_0D_L
    electrolyte0D_batch(
    redeclare model TemperatureModel =
      Properties.TemperatureModels.TemperatureConstant,
    GeoRec=Data.UserInput.Example_AlkalineWaterElectrolysis.GeoRec,
    CondRec=Data.UserInput.Example_AlkalineWaterElectrolysis.CondRec,
    X=0.1,
    Y=0.1,
    Z=0.1,
    specRec=Data.UserInput.Example_AlkalineWaterElectrolysis.AWEspec,
    c0=Data.UserInput.Example_AlkalineWaterElectrolysis.c0)
    annotation (Placement(transformation(extent={{26,-32},{46,-12}})));
  ElectrochemicalReactor.MaterialDomain.ConnectionLayers.ConnectionLayer_Diffusive
    diffusiveConnectionLayer(
    specRec=Data.UserInput.Example_AlkalineWaterElectrolysis.AWEspec,
    GeoRec=Data.UserInput.Example_AlkalineWaterElectrolysis.GeoRec,
    Y=0.1,
    Z=0.1,
    dX=1e-7) annotation (Placement(transformation(extent={{-14,8},{6,28}})));
  ElectrochemicalReactor.MaterialDomain.ConnectionLayers.ConnectionLayer_Diffusive
    diffusiveConnectionLayer1(
    specRec=Data.UserInput.Example_AlkalineWaterElectrolysis.AWEspec,
    GeoRec=Data.UserInput.Example_AlkalineWaterElectrolysis.GeoRec,
    Y=0.1,
    Z=0.1,
    dX=1e-7) annotation (Placement(transformation(extent={{58,6},{78,26}})));
  ElectrochemicalReactor.Electrolytes.Liquid.Electrolyte_Batch_1D_L_nLayers
    Anolyte1D_nLayers(
    specRec=Data.UserInput.Example_AlkalineWaterElectrolysis.AWEspec,
    GeoRec=Data.UserInput.Example_AlkalineWaterElectrolysis.GeoRec,
    X_difflayer=Data.UserInput.Example_AlkalineWaterElectrolysis.X_difflayer,
    CondRec=Data.UserInput.Example_AlkalineWaterElectrolysis.CondRec,
    Y=0.35,
    Z=0.35,
    n_slices=n_slices,
    c0=Data.UserInput.Example_AlkalineWaterElectrolysis.c0)
    annotation (Placement(transformation(extent={{-42,-32},{-22,-12}})));
  ElectrochemicalReactor.Electrolytes.Liquid.Electrolyte_Batch_1D_L_nLayers
    Cathloyte1D_nLayers(
    specRec=Data.UserInput.Example_AlkalineWaterElectrolysis.AWEspec,
    GeoRec=Data.UserInput.Example_AlkalineWaterElectrolysis.GeoRec,
    X_difflayer=Data.UserInput.Example_AlkalineWaterElectrolysis.X_difflayer,
    CondRec=Data.UserInput.Example_AlkalineWaterElectrolysis.CondRec,
    n_slices=n_slices,
    c0=Data.UserInput.Example_AlkalineWaterElectrolysis.c0)
    annotation (Placement(transformation(extent={{90,-32},{110,-12}})));
equation
  connect(Ground.p, Source.p) annotation (Line(points={{60,74},{36,74},{36,50},
          {10,50}},      color={0,0,255}));
  connect(Anode.p, Source.n) annotation (Line(points={{-84,-24},{-94,-24},{-94,50},
          {-10,50}},color={0,0,255}));
  connect(Source.p,Cathode. n) annotation (Line(points={{10,50},{152,50},{152,-24},
          {146,-24}},      color={0,0,255}));
  connect(diffusiveConnectionLayer.rightFlow, electrolyte0D_batch.leftFlow)
    annotation (Line(points={{6,24},{18,24},{18,-16},{26,-16}},   color={0,0,0}));
  connect(electrolyte0D_batch.rightFlow, diffusiveConnectionLayer1.leftFlow)
    annotation (Line(points={{46,-16},{46,21.5},{57.6,21.5}}, color={0,0,0}));
  connect(Anode.n, Anolyte1D_nLayers.p) annotation (Line(points={{-64,-24},{-52,
          -24},{-52,-22},{-42,-22}}, color={0,0,255}));
  connect(Anode.flowFromElectrolyte, Anolyte1D_nLayers.leftFlow) annotation (
      Line(points={{-74,-14},{-74,-6},{-54,-6},{-54,-16},{-42,-16}}, color={0,0,
          0}));
  connect(Anolyte1D_nLayers.rightFlow, diffusiveConnectionLayer.leftFlow)
    annotation (Line(points={{-22,-16},{-22,23.5},{-14.4,23.5}}, color={0,0,0}));
  connect(Anolyte1D_nLayers.n,electrolyte0D_batch. p)
    annotation (Line(points={{-22,-22},{26,-22}}, color={0,0,255}));
  connect(electrolyte0D_batch.n, Cathloyte1D_nLayers.p)
    annotation (Line(points={{46,-22},{90,-22}}, color={0,0,255}));
  connect(Cathloyte1D_nLayers.n, Cathode.p)
    annotation (Line(points={{110,-22},{110,-24},{126,-24}}, color={0,0,255}));
  connect(Cathloyte1D_nLayers.leftFlow, diffusiveConnectionLayer1.rightFlow)
    annotation (Line(points={{90,-16},{82,-16},{82,14},{86,14},{86,22},{78,22}},
        color={0,0,0}));
  connect(Cathloyte1D_nLayers.rightFlow, Cathode.flowFromElectrolyte)
    annotation (Line(points={{110,-16},{120,-16},{120,-6},{136,-6},{136,-14}},
        color={0,0,0}));
  annotation (experiment(__Dymola_NumberOfIntervals=2000, Tolerance=1e-12));
end Electrolyzer_Batch_1D_L_Ndiscs;
