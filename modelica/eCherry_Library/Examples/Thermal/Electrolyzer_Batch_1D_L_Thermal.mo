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
    Pi(displayUnit="bar"),
    CathodeEl=false,
    EBRec=Data.UserInput.Example_AlkalineWaterElectrolysis.EBdummy)
    annotation (Placement(transformation(extent={{-120,-30},{-100,-10}})));

  eCherry_Library.ElectrochemicalReactor.Electrodes.Electrode_Thermal Cathode(
    GeoRec=Data.UserInput.Example_AlkalineWaterElectrolysis.GeoRec,
    CondRec=Data.UserInput.Example_AlkalineWaterElectrolysis.CondRec,
    specRec=Data.UserInput.Example_AlkalineWaterElectrolysis.AWEspec,
    reac={Data.UserInput.Example_AlkalineWaterElectrolysis.HERdummy},
    Pi(displayUnit="bar"),
    CathodeEl=true,
    EBRec=Data.UserInput.Example_AlkalineWaterElectrolysis.EBdummy)
    annotation (Placement(transformation(extent={{100,-30},{120,-10}})));

  eCherry_Library.ElectrochemicalReactor.Electrolytes.Thermal.Electrolyte_Batch_0D_L_Thermal
    electrolyte0D_batch(
    GeoRec=Data.UserInput.Example_AlkalineWaterElectrolysis.GeoRec,
    CondRec=Data.UserInput.Example_AlkalineWaterElectrolysis.CondRec,
    QFlow_shunt=0,
    specRec=Data.UserInput.Example_AlkalineWaterElectrolysis.AWEspec,
    c0=Data.UserInput.Example_AlkalineWaterElectrolysis.c0,
    EBRec=Data.UserInput.Example_AlkalineWaterElectrolysis.EBdummy)
    annotation (Placement(transformation(extent={{-10,-30},{10,-10}})));
  eCherry_Library.ElectrochemicalReactor.ThermalDomain.Material_Thermal.ConnectionLayer_Diffusive_Thermal
    diffusiveConnectionLayerAnolyte(
    specRec=Data.UserInput.Example_AlkalineWaterElectrolysis.AWEspec,
    GeoRec=Data.UserInput.Example_AlkalineWaterElectrolysis.GeoRec,
    dX=1e-7) annotation (Placement(transformation(extent={{-40,0},{-20,20}})));
  eCherry_Library.ElectrochemicalReactor.ThermalDomain.Material_Thermal.ConnectionLayer_Diffusive_Thermal
    diffusiveConnectionLayerCatholyte(
    specRec=Data.UserInput.Example_AlkalineWaterElectrolysis.AWEspec,
    GeoRec=Data.UserInput.Example_AlkalineWaterElectrolysis.GeoRec,
    dX=1e-7) annotation (Placement(transformation(extent={{10,0},{30,20}})));
  eCherry_Library.ElectrochemicalReactor.Electrolytes.Thermal.Electrolyte_Batch_1D_L_Thermal_nLayers
    Anolyte1D_nLayers(
    EBRec=Data.UserInput.Example_AlkalineWaterElectrolysis.EBdummy,
    specRec=Data.UserInput.Example_AlkalineWaterElectrolysis.AWEspec,
    GeoRec=Data.UserInput.Example_AlkalineWaterElectrolysis.GeoRec,
    X_difflayer=Data.UserInput.Example_AlkalineWaterElectrolysis.X_difflayer,
    CondRec=Data.UserInput.Example_AlkalineWaterElectrolysis.CondRec,
    QFlow_shunt=0,
    n_slices=n_slices,
    c0=Data.UserInput.Example_AlkalineWaterElectrolysis.c0)
    annotation (Placement(transformation(extent={{-70,-30},{-50,-10}})));
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
    annotation (Placement(transformation(extent={{50,-30},{70,-10}})));
  eCherry_Library.ElectrochemicalReactor.ThermalDomain.Source.ExternalHeating_TFixed
    externalHeatingAnode(EBRec=Data.UserInput.Example_AlkalineWaterElectrolysis.EBdummy)
    annotation (Placement(transformation(extent={{-190,-90},{-170,-70}})));
  eCherry_Library.ElectrochemicalReactor.ThermalDomain.Source.ExternalHeating_TFixed
    externalHeatingCathode(EBRec=Data.UserInput.Example_AlkalineWaterElectrolysis.EBdummy)
    annotation (Placement(transformation(extent={{150,-80},{170,-60}})));
  ElectrochemicalReactor.ThermalDomain.ConnectionLayers.ConnectionLayer_CompositeHT
    compositeConnectionLayerAnode(
    GeoRec=Data.UserInput.Example_AlkalineWaterElectrolysis.GeoRec,
    alpha=Data.UserInput.Example_AlkalineWaterElectrolysis.EBdummy.alpha_anode_electrolyte,

    epsilon1=1,
    epsilon2=1,
    useConvection=true,
    useConduction=false,
    useRadiation=false)
    annotation (Placement(transformation(extent={{-94,-60},{-74,-40}})));

  ElectrochemicalReactor.ThermalDomain.ConnectionLayers.ConnectionLayer_CompositeHT
    compositeConnectionLayerCathode(
    GeoRec=Data.UserInput.Example_AlkalineWaterElectrolysis.GeoRec,
    alpha=Data.UserInput.Example_AlkalineWaterElectrolysis.EBdummy.alpha_cathode_electrolyte,

    useConvection=true,
    useConduction=false,
    useRadiation=false)
    annotation (Placement(transformation(extent={{80,-60},{100,-40}})));

  ElectrochemicalReactor.ThermalDomain.ConnectionLayers.ConnectionLayer_CompositeHT
    compositeConnectionLayer4(
    GeoRec=Data.UserInput.Example_AlkalineWaterElectrolysis.GeoRec,
    alpha=Data.UserInput.Example_AlkalineWaterElectrolysis.EBdummy.alpha_anode_externalHeating,

    useConvection=true)
    annotation (Placement(transformation(extent={{-150,-50},{-130,-30}})));

  ElectrochemicalReactor.ThermalDomain.ConnectionLayers.ConnectionLayer_CompositeHT
    compositeConnectionLayer5(
    GeoRec=Data.UserInput.Example_AlkalineWaterElectrolysis.GeoRec,
    alpha=Data.UserInput.Example_AlkalineWaterElectrolysis.EBdummy.alpha_cathode_externalHeating,

    useConvection=true)
    annotation (Placement(transformation(extent={{130,-60},{150,-40}})));

equation
  Tdistr_all[1:n_slices] = Anolyte1D_nLayers.slices.T;
  Tdistr_all[n_slices+1] = electrolyte0D_batch.T;
  Tdistr_all[n_slices+2:2*n_slices+1] = Catholyte1D_nLayers.slices.T;
  connect(Ground.p, Source.p) annotation (Line(points={{60,74},{36,74},{36,50},
          {10,50}},      color={0,0,255}));
  connect(Anode.p, Source.n) annotation (Line(points={{-120,-20},{-109,-20},{
          -109,50},{-10,50}},
                    color={0,0,255}));
  connect(Source.p,Cathode. n) annotation (Line(points={{10,50},{113,50},{113,
          -20},{120,-20}}, color={0,0,255}));
  connect(diffusiveConnectionLayerAnolyte.rightFlow, electrolyte0D_batch.leftFlow)
    annotation (Line(points={{-20,16},{-5,16},{-5,-8},{-9,-8},{-9,-14},{-10,-14}},
                                                                color={0,0,0}));
  connect(electrolyte0D_batch.rightFlow, diffusiveConnectionLayerCatholyte.leftFlow)
    annotation (Line(points={{10,-14},{10,15.5},{9.6,15.5}},  color={0,0,0}));
  connect(Anode.n, Anolyte1D_nLayers.p) annotation (Line(points={{-100,-20},{
          -70,-20}},                 color={0,0,255}));
  connect(Anode.flowFromElectrolyte, Anolyte1D_nLayers.leftFlow) annotation (
      Line(points={{-110,-10},{-110,-5},{-76,-5},{-76,-14},{-70,-14}},
                                                                     color={0,0,
          0}));
  connect(Anolyte1D_nLayers.rightFlow, diffusiveConnectionLayerAnolyte.leftFlow)
    annotation (Line(points={{-50,-14},{-37.8,-14},{-37.8,-4.75},{-41.8,-4.75},
          {-41.8,15.5},{-40.4,15.5}},                            color={0,0,0}));
  connect(Anolyte1D_nLayers.n,electrolyte0D_batch. p)
    annotation (Line(points={{-50,-20},{-10,-20}},color={0,0,255}));
  connect(electrolyte0D_batch.n, Catholyte1D_nLayers.p)
    annotation (Line(points={{10,-20},{50,-20}}, color={0,0,255}));
  connect(Catholyte1D_nLayers.n, Cathode.p)
    annotation (Line(points={{70,-20},{100,-20}},            color={0,0,255}));
  connect(Catholyte1D_nLayers.leftFlow, diffusiveConnectionLayerCatholyte.rightFlow)
    annotation (Line(points={{50,-14},{37,-14},{37,16},{30,16}},
        color={0,0,0}));
  connect(Catholyte1D_nLayers.rightFlow, Cathode.flowFromElectrolyte)
    annotation (Line(points={{70,-14},{93,-14},{93,-10},{110,-10}},
        color={0,0,0}));
  connect(electrolyte0D_batch.rightHeatFlow, diffusiveConnectionLayerCatholyte.leftHeatFlow)
    annotation (Line(points={{10,-24.6},{12.5,-24.6},{12.5,-6.1},{6.5,-6.1},{
          6.5,6},{10,6}},
                color={0,0,0}));
  connect(diffusiveConnectionLayerCatholyte.rightHeatFlow, Catholyte1D_nLayers.leftHeatFlow)
    annotation (Line(points={{30,6},{34.5,6},{34.5,-25},{51,-25}},   color={0,0,
          0}));
  connect(electrolyte0D_batch.leftHeatFlow, diffusiveConnectionLayerAnolyte.rightHeatFlow)
    annotation (Line(points={{-10,-24.6},{-10,-5.4},{-8,-5.4},{-8,-1.4},{-6,
          -1.4},{-6,6},{-20,6}},                                        color={
          0,0,0}));
  connect(diffusiveConnectionLayerAnolyte.leftHeatFlow, Anolyte1D_nLayers.rightHeatFlow)
    annotation (Line(points={{-40,6},{-39.5,6},{-39.5,-2.5},{-35.5,-2.5},{-35.5,
          -25},{-51,-25}},
                 color={0,0,0}));
  connect(Catholyte1D_nLayers.rightHeatFlow, compositeConnectionLayerCathode.leftHeatFlow)
    annotation (Line(points={{69,-25},{76,-25},{76,-36.5},{64,-36.5},{64,-54},{
          80,-54}},  color={0,0,0}));
  connect(compositeConnectionLayerCathode.rightHeatFlow, Cathode.leftHeatFlow)
    annotation (Line(points={{100,-54},{102,-54},{102,-36.7},{96,-36.7},{96,
          -24.6},{100,-24.6}},                                   color={0,0,0}));
  connect(Anode.rightHeatFlow, compositeConnectionLayerAnode.leftHeatFlow)
    annotation (Line(points={{-100,-24.6},{-98,-24.6},{-98,-24},{-96,-24},{-96,
          -54},{-94,-54}},                color={0,0,0}));
  connect(compositeConnectionLayerAnode.rightHeatFlow, Anolyte1D_nLayers.leftHeatFlow)
    annotation (Line(points={{-74,-54},{-74,-25},{-69,-25}},
                     color={0,0,0}));
  connect(externalHeatingAnode.heatFlow, compositeConnectionLayer4.leftHeatFlow)
    annotation (Line(points={{-180,-70},{-180,-44},{-150,-44}}, color={0,0,0}));
  connect(compositeConnectionLayer4.rightHeatFlow, Anode.leftHeatFlow)
    annotation (Line(points={{-130,-44},{-129,-44},{-129,-39.7},{-127,-39.7},{
          -127,-24.6},{-120,-24.6}}, color={0,0,0}));
  connect(Cathode.rightHeatFlow, compositeConnectionLayer5.leftHeatFlow)
    annotation (Line(points={{120,-24.6},{129,-24.6},{129,-27},{133,-27},{133,
          -54},{130,-54}}, color={0,0,0}));
  connect(compositeConnectionLayer5.rightHeatFlow, externalHeatingCathode.heatFlow)
    annotation (Line(points={{150,-54},{160,-54},{160,-60}}, color={0,0,0}));
  annotation (experiment(__Dymola_NumberOfIntervals=2000, Tolerance=1e-12));
end Electrolyzer_Batch_1D_L_Thermal;
