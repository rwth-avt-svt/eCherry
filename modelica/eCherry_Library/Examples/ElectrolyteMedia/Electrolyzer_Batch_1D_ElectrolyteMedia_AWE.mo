within eCherry_Library.Examples.ElectrolyteMedia;
model Electrolyzer_Batch_1D_ElectrolyteMedia_AWE

  extends Modelica.Icons.Example;

  parameter Integer n_slices=10 "in the diffusion layer, how many slices?";
  parameter eCherry_Library.Data.DataRecords.Species.SpeciesRecord specRec=Data.UserInput.Example_AlkalineWaterElectrolysis_x_eMedia_KOH.Alkaline_KOH_spec;
  parameter Real epsi=0.01;
  parameter Temperature T=300;
  parameter Pressure p=1e5;
  parameter Modelica.Units.SI.Concentration c0[specRec.nSpec]={
  epsi,epsi,
  1e-10,
  1e3,
  1e3,
  epsi,
  55e3}/1000 "the different unit is because of the eMedia";
  // "Electrolysis:O2,H2,H+,OH-,Na+,NaOH"
  ElectrochemicalReactor.ElectricalDomain.Source.Potential_Source.ImposedPotential
    Source(
    GeoRec=Data.UserInput.Example_AlkalineWaterElectrolysis.GeoRec,
    Y=0.1,
    Z=0.1,
    Ufixed=-2.3)     annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={12,50})));
  Modelica.Electrical.Analog.Basic.Ground Ground
    annotation (Placement(transformation(extent={{70,54},{50,74}})));
  eCherry_Library.ElectrochemicalReactor.Electrodes.Electrode Anode(
    specRec=specRec,
    GeoRec=Data.UserInput.Example_AlkalineWaterElectrolysis.GeoRec,
    CondRec=Data.UserInput.Example_AlkalineWaterElectrolysis.CondRec,
    reac={Data.UserInput.Example_AlkalineWaterElectrolysis_x_eMedia_KOH.OERdummy},
    Y=0.1,
    Z=0.1,
    Pi(displayUnit="bar") = Data.UserInput.Example_AlkalineWaterElectrolysis_x_eMedia_KOH.Pi,
    CathodeEl=false)
    annotation (Placement(transformation(extent={{-84,-34},{-64,-14}})));


  eCherry_Library.ElectrochemicalReactor.Electrodes.Electrode Cathode(
    specRec=specRec,
    GeoRec=Data.UserInput.Example_AlkalineWaterElectrolysis.GeoRec,
    CondRec=Data.UserInput.Example_AlkalineWaterElectrolysis.CondRec,
    reac={Data.UserInput.Example_AlkalineWaterElectrolysis.HERdummy},
    Y=0.1,
    Z=0.1,
    Pi(displayUnit="bar") = Data.UserInput.Example_AlkalineWaterElectrolysis_x_eMedia_KOH.Pi,
    CathodeEl=true)
    annotation (Placement(transformation(extent={{126,-34},{146,-14}})));

  ElectrochemicalReactor.MaterialDomain.ConnectionLayers.DiffusiveConnectionLayer
    diffusiveConnectionLayer(
    specRec=specRec,
    GeoRec=Data.UserInput.Example_AlkalineWaterElectrolysis.GeoRec,
    Y=0.1,
    Z=0.1,
    dX=1e-7) annotation (Placement(transformation(extent={{-14,8},{6,28}})));
  ElectrochemicalReactor.MaterialDomain.ConnectionLayers.DiffusiveConnectionLayer
    diffusiveConnectionLayer1(
    specRec=specRec,
    GeoRec=Data.UserInput.Example_AlkalineWaterElectrolysis.GeoRec,
    Y=0.1,
    Z=0.1,
    dX=1e-7) annotation (Placement(transformation(extent={{58,6},{78,26}})));
  ElectrochemicalReactor.Electrolytes.ElectrolyteMedia.Electrolyte_Batch_1D_ElectrolyteMedia_Nslices
    Anolyte1D_nLayers_eMedia(
    specRec=specRec,
    GeoRec=Data.UserInput.Example_AlkalineWaterElectrolysis.GeoRec,
    X=1e-4,
    Y=0.1,
    Z=0.1,
    T=T,
    p_system=p,
    redeclare package Medium =
        ElectrolyteMedia.Media.LiquidPhase.MixtureLiquids.Electrolysis_H2_KOH,
    kappa=30,
    n_slices=n_slices,
    c0=c0) annotation (Placement(transformation(extent={{-40,-32},{-20,-12}})));
  ElectrochemicalReactor.Electrolytes.ElectrolyteMedia.Electrolyte_Batch_1D_ElectrolyteMedia_Nslices
    Cathloyte1D_nLayers_eMedia1(
    specRec=specRec,
    GeoRec=Data.UserInput.Example_AlkalineWaterElectrolysis.GeoRec,
    X=1e-4,
    Y=0.1,
    Z=0.1,
    T=T,
    p_system=p,
    redeclare package Medium =
        ElectrolyteMedia.Media.LiquidPhase.MixtureLiquids.Electrolysis_H2_KOH,
    kappa=30,
    n_slices=n_slices,
    c0=c0) annotation (Placement(transformation(extent={{88,-32},{108,-12}})));

  ElectrochemicalReactor.Electrolytes.ElectrolyteMedia.Electrolyte_Batch_0D_ElectrolyteMedia
    electrolyte0D_batch_eMedia(
    redeclare package Medium =
        ElectrolyteMedia.Media.LiquidPhase.MixtureLiquids.Electrolysis_H2_KOH,
    Tstart=T,
    pstart=p,
    c0=c0,
    specRec=specRec,
    GeoRec=Data.UserInput.Example_AlkalineWaterElectrolysis.GeoRec,
    X=0.1,
    Y=0.1,
    Z=0.1,
    T_zero=T,
    p_zero=p,
    kappa=30) annotation (Placement(transformation(extent={{22,-32},{42,-12}})));
equation
  connect(Ground.p, Source.p) annotation (Line(points={{60,74},{60,76},{32,76},{
          32,50},{22,50}},
                         color={0,0,255}));
  connect(Anode.p, Source.n) annotation (Line(points={{-84,-24},{-88,-24},{-88,50},
          {2,50}},  color={0,0,255}));
  connect(Source.p,Cathode. n) annotation (Line(points={{22,50},{152,50},{152,-24},
          {146,-24}},      color={0,0,255}));
  connect(Anode.n, Anolyte1D_nLayers_eMedia.p) annotation (Line(points={{-64,-24},
          {-50,-24},{-50,-22},{-40,-22}}, color={0,0,255}));
  connect(Anode.flowFromElectrolyte, Anolyte1D_nLayers_eMedia.leftFlow)
    annotation (Line(points={{-74,-14},{-74,-6},{-52,-6},{-52,-17},{-41,-17}},
        color={0,0,0}));
  connect(Anolyte1D_nLayers_eMedia.rightFlow, diffusiveConnectionLayer.leftFlow)
    annotation (Line(points={{-20,-16},{-20,23.5},{-14.4,23.5}}, color={0,0,0}));
  connect(diffusiveConnectionLayer1.rightFlow, Cathloyte1D_nLayers_eMedia1.leftFlow)
    annotation (Line(points={{78,22},{88,22},{88,-8},{80,-8},{80,-17},{87,-17}},
        color={0,0,0}));
  connect(Cathloyte1D_nLayers_eMedia1.rightFlow, Cathode.flowFromElectrolyte)
    annotation (Line(points={{108,-16},{120,-16},{120,-6},{136,-6},{136,-14}},
        color={0,0,0}));
  connect(Cathloyte1D_nLayers_eMedia1.n, Cathode.p)
    annotation (Line(points={{108,-22},{108,-24},{126,-24}}, color={0,0,255}));
  connect(diffusiveConnectionLayer.rightFlow, electrolyte0D_batch_eMedia.leftFlow)
    annotation (Line(points={{6,24},{16,24},{16,-17},{21.2,-17}}, color={0,0,0}));
  connect(electrolyte0D_batch_eMedia.rightFlow, diffusiveConnectionLayer1.leftFlow)
    annotation (Line(points={{42,-16},{42,21.5},{57.6,21.5}}, color={0,0,0}));
  connect(electrolyte0D_batch_eMedia.n, Cathloyte1D_nLayers_eMedia1.p)
    annotation (Line(points={{42,-22},{88,-22}}, color={0,0,255}));
  connect(electrolyte0D_batch_eMedia.p, Anolyte1D_nLayers_eMedia.n)
    annotation (Line(points={{22,-22},{-20,-22}}, color={0,0,255}));
  annotation (experiment(
      StopTime=0.001,
      __Dymola_NumberOfIntervals=2000,
      Tolerance=1e-11,
      __Dymola_Algorithm="Dassl"));
end Electrolyzer_Batch_1D_ElectrolyteMedia_AWE;
