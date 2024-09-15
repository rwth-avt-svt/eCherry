within eCherry_Library.Examples.Thermal;
model Electrolyzer_Batch_1D_L_Thermal
    extends Modelica.Icons.Example;
 parameter Integer n_slices=100 "in the diffusion layer, how many slices?";
 Temperature Tdistr_all[2*n_slices+1];
  ElectrochemicalReactor.ElectricalDomain.Source.Potential_Source.Voltage_Fixed
    Source(GeoRec=Data.UserInput.Example_AlkalineWaterElectrolysis.GeoRec,
      Ufixed=-2.3) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={0,50})));
  Modelica.Electrical.Analog.Basic.Ground Ground
    annotation (Placement(transformation(extent={{70,54},{50,74}})));
  eCherry_Library.ElectrochemicalReactor.Electrodes.Electrode_Thermal Anode(
    GeoRec=Data.UserInput.Example_AlkalineWaterElectrolysis.GeoRec,
    CondRec=Data.UserInput.Example_AlkalineWaterElectrolysis.CondRec,
    specRec=Data.UserInput.Example_AlkalineWaterElectrolysis.AWEspec,
    reac={Data.UserInput.Example_AlkalineWaterElectrolysis.OERdummy},
    Y=0.1,
    Z=0.1,
    Pi(displayUnit="bar"),
    CathodeEl=false,
    EBRec=Data.UserInput.Example_AlkalineWaterElectrolysis.EBdummy)
    annotation (Placement(transformation(extent={{-84,-34},{-64,-14}})));

  eCherry_Library.ElectrochemicalReactor.Electrodes.Electrode_Thermal Cathode(
    GeoRec=Data.UserInput.Example_AlkalineWaterElectrolysis.GeoRec,
    CondRec=Data.UserInput.Example_AlkalineWaterElectrolysis.CondRec,
    specRec=Data.UserInput.Example_AlkalineWaterElectrolysis.AWEspec,
    reac={Data.UserInput.Example_AlkalineWaterElectrolysis.HERdummy},
    Y=0.1,
    Z=0.1,
    Pi(displayUnit="bar"),
    CathodeEl=true,
    EBRec=Data.UserInput.Example_AlkalineWaterElectrolysis.EBdummy)
    annotation (Placement(transformation(extent={{126,-34},{146,-14}})));

  eCherry_Library.ElectrochemicalReactor.Electrolytes.Thermal.Electrolyte_Batch_0D_L_Thermal
    electrolyte0D_batch(
    GeoRec=Data.UserInput.Example_AlkalineWaterElectrolysis.GeoRec,
    CondRec=Data.UserInput.Example_AlkalineWaterElectrolysis.CondRec,
    X=0.1,
    Y=0.1,
    Z=0.1,
    QFlow_shunt=0,
    specRec=Data.UserInput.Example_AlkalineWaterElectrolysis.AWEspec,
    c0=Data.UserInput.Example_AlkalineWaterElectrolysis.c0,
    EBRec=Data.UserInput.Example_AlkalineWaterElectrolysis.EBdummy)
    annotation (Placement(transformation(extent={{26,-32},{46,-12}})));
  eCherry_Library.ElectrochemicalReactor.ThermalDomain.Material_Thermal.ConnectionLayer_Diffusive_Thermal
    diffusiveConnectionLayerAnolyte(
    specRec=Data.UserInput.Example_AlkalineWaterElectrolysis.AWEspec,
    GeoRec=Data.UserInput.Example_AlkalineWaterElectrolysis.GeoRec,
    Y=0.1,
    Z=0.1,
    dX=1e-7,
    EBRec=Data.UserInput.Example_AlkalineWaterElectrolysis.EBdummy)
    annotation (Placement(transformation(extent={{-14,8},{6,28}})));
  eCherry_Library.ElectrochemicalReactor.ThermalDomain.Material_Thermal.ConnectionLayer_Diffusive_Thermal
    diffusiveConnectionLayerCatholyte(
    specRec=Data.UserInput.Example_AlkalineWaterElectrolysis.AWEspec,
    GeoRec=Data.UserInput.Example_AlkalineWaterElectrolysis.GeoRec,
    Y=0.1,
    Z=0.1,
    dX=1e-7,
    EBRec=Data.UserInput.Example_AlkalineWaterElectrolysis.EBdummy)
    annotation (Placement(transformation(extent={{58,6},{78,26}})));
  eCherry_Library.ElectrochemicalReactor.Electrolytes.Thermal.Electrolyte_Batch_1D_L_Thermal_nLayers
    Anolyte1D_nLayers(
    EBRec=Data.UserInput.Example_AlkalineWaterElectrolysis.EBdummy,
    specRec=Data.UserInput.Example_AlkalineWaterElectrolysis.AWEspec,
    GeoRec=Data.UserInput.Example_AlkalineWaterElectrolysis.GeoRec,
    X_difflayer=Data.UserInput.Example_AlkalineWaterElectrolysis.X_difflayer,
    CondRec=Data.UserInput.Example_AlkalineWaterElectrolysis.CondRec,
    QFlow_shunt=0,
    Y=0.35,
    Z=0.35,
    n_slices=n_slices,
    c0=Data.UserInput.Example_AlkalineWaterElectrolysis.c0)
    annotation (Placement(transformation(extent={{-42,-32},{-22,-12}})));
  eCherry_Library.ElectrochemicalReactor.Electrolytes.Thermal.Electrolyte_Batch_1D_L_Thermal_nLayers
    Catholyte1D_nLayers(
    EBRec=Data.UserInput.Example_AlkalineWaterElectrolysis.EBdummy,
    QFlow_shunt=0,
    specRec=Data.UserInput.Example_AlkalineWaterElectrolysis.AWEspec,
    GeoRec=Data.UserInput.Example_AlkalineWaterElectrolysis.GeoRec,
    X_difflayer=Data.UserInput.Example_AlkalineWaterElectrolysis.X_difflayer,
    CondRec=Data.UserInput.Example_AlkalineWaterElectrolysis.CondRec,
    n_slices=n_slices,
    c0=Data.UserInput.Example_AlkalineWaterElectrolysis.c0)
    annotation (Placement(transformation(extent={{90,-32},{110,-12}})));
  eCherry_Library.ElectrochemicalReactor.ThermalDomain.Source.ExternalHeating_TFixed
    externalHeatingAnode(EBRec=Data.UserInput.Example_AlkalineWaterElectrolysis.EBdummy)
    annotation (Placement(transformation(extent={{-100,-60},{-80,-40}})));
  eCherry_Library.ElectrochemicalReactor.ThermalDomain.Source.ExternalHeating_TFixed
    externalHeatingCathode(EBRec=Data.UserInput.Example_AlkalineWaterElectrolysis.EBdummy)
    annotation (Placement(transformation(extent={{148,-60},{168,-40}})));
equation
  Tdistr_all[1:n_slices] = Anolyte1D_nLayers.slices.T;
  Tdistr_all[n_slices+1] = electrolyte0D_batch.T;
  Tdistr_all[n_slices+2:2*n_slices+1] = Catholyte1D_nLayers.slices.T;
  connect(Ground.p, Source.p) annotation (Line(points={{60,74},{36,74},{36,50},
          {10,50}},      color={0,0,255}));
  connect(Anode.p, Source.n) annotation (Line(points={{-84,-24},{-94,-24},{-94,50},
          {-10,50}},color={0,0,255}));
  connect(Source.p,Cathode. n) annotation (Line(points={{10,50},{152,50},{152,-24},
          {146,-24}},      color={0,0,255}));
  connect(diffusiveConnectionLayerAnolyte.rightFlow, electrolyte0D_batch.leftFlow)
    annotation (Line(points={{6,24},{18,24},{18,-16},{26,-16}}, color={0,0,0}));
  connect(electrolyte0D_batch.rightFlow, diffusiveConnectionLayerCatholyte.leftFlow)
    annotation (Line(points={{46,-16},{46,21.5},{57.6,21.5}}, color={0,0,0}));
  connect(Anode.n, Anolyte1D_nLayers.p) annotation (Line(points={{-64,-24},{-52,
          -24},{-52,-22},{-42,-22}}, color={0,0,255}));
  connect(Anode.flowFromElectrolyte, Anolyte1D_nLayers.leftFlow) annotation (
      Line(points={{-74,-14},{-74,-6},{-54,-6},{-54,-16},{-42,-16}}, color={0,0,
          0}));
  connect(Anolyte1D_nLayers.rightFlow, diffusiveConnectionLayerAnolyte.leftFlow)
    annotation (Line(points={{-22,-16},{-22,23.5},{-14.4,23.5}}, color={0,0,0}));
  connect(Anolyte1D_nLayers.n,electrolyte0D_batch. p)
    annotation (Line(points={{-22,-22},{26,-22}}, color={0,0,255}));
  connect(electrolyte0D_batch.n, Catholyte1D_nLayers.p)
    annotation (Line(points={{46,-22},{90,-22}}, color={0,0,255}));
  connect(Catholyte1D_nLayers.n, Cathode.p)
    annotation (Line(points={{110,-22},{110,-24},{126,-24}}, color={0,0,255}));
  connect(Catholyte1D_nLayers.leftFlow, diffusiveConnectionLayerCatholyte.rightFlow)
    annotation (Line(points={{90,-16},{82,-16},{82,14},{86,14},{86,22},{78,22}},
        color={0,0,0}));
  connect(Catholyte1D_nLayers.rightFlow, Cathode.flowFromElectrolyte)
    annotation (Line(points={{110,-16},{120,-16},{120,-6},{136,-6},{136,-14}},
        color={0,0,0}));
  connect(Cathode.rightHeatFlow, externalHeatingCathode.heatFlow) annotation (
      Line(points={{146,-28.6},{152,-28.6},{152,-28},{158,-28},{158,-40}},
        color={0,0,0}));
  connect(electrolyte0D_batch.rightHeatFlow, diffusiveConnectionLayerCatholyte.leftHeatFlow)
    annotation (Line(points={{46,-26.6},{56,-26.6},{56,2},{50,2},{50,11.4},{58,
          11.4}},
                color={0,0,0}));
  connect(diffusiveConnectionLayerCatholyte.rightHeatFlow, Catholyte1D_nLayers.leftHeatFlow)
    annotation (Line(points={{78,11.4},{80,11.4},{80,-27},{91,-27}}, color={0,0,
          0}));
  connect(electrolyte0D_batch.leftHeatFlow, diffusiveConnectionLayerAnolyte.rightHeatFlow)
    annotation (Line(points={{26,-26.6},{14,-26.6},{14,13.4},{6,13.4}}, color={
          0,0,0}));
  connect(diffusiveConnectionLayerAnolyte.leftHeatFlow, Anolyte1D_nLayers.rightHeatFlow)
    annotation (Line(points={{-14,13.4},{-20,13.4},{-20,-8},{-16,-8},{-16,-27},
          {-23,-27}},
                 color={0,0,0}));
  connect(Anode.rightHeatFlow, Anolyte1D_nLayers.leftHeatFlow) annotation (Line(
        points={{-64,-28.6},{-64,-27},{-41,-27}},     color={0,0,0}));
  connect(Anode.leftHeatFlow, externalHeatingAnode.heatFlow) annotation (Line(
        points={{-84,-28.6},{-84,-34},{-90,-34},{-90,-40}}, color={0,0,0}));
  connect(Catholyte1D_nLayers.rightHeatFlow, Cathode.leftHeatFlow) annotation (
      Line(points={{109,-27},{110,-27},{110,-28.6},{126,-28.6}}, color={0,0,0}));
  annotation (experiment(__Dymola_NumberOfIntervals=2000, Tolerance=1e-12));
end Electrolyzer_Batch_1D_L_Thermal;
