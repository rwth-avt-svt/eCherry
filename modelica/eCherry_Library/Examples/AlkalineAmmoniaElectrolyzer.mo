within eCherry_Library.Examples;
package AlkalineAmmoniaElectrolyzer
  extends Modelica.Icons.ExamplesPackage;

  model AAE_0D
    extends Modelica.Icons.Example;
    ElectrochemicalReactor.Electrodes.Electrode_GasDiffusion
      gasDiffusionElectrode(
      redeclare model TemperatureModel =
        Properties.TemperatureModels.TemperatureConstant,
      specRec=eCherry_Library.Data.UserInput.Example_AlkalineAmmoniaElectrolyzer.AESspec,
      GeoRec=eCherry_Library.Data.UserInput.Example_AlkalineAmmoniaElectrolyzer.GeoRecElec,
      CondRec=eCherry_Library.Data.UserInput.Example_AlkalineAmmoniaElectrolyzer.CondRec,
      redeclare model ActivationOverpotentialModel =
          eCherry_Library.ElectrochemicalReactor.Electrodes.Electrochemistry.Activation_Overpotential.ActivationOverpotential,
      reac={eCherry_Library.Data.UserInput.Example_AlkalineAmmoniaElectrolyzer.HERdummy,
          eCherry_Library.Data.UserInput.Example_AlkalineAmmoniaElectrolyzer.NRRdummy},
      CathodeEl=true,
      splitFactor=0)
      "{eCherry_Library.Data.DataRecords.ElecReaction.List_Of_Reactions.HERdummy,eCherry_Library.Data.DataRecords.ElecReaction.List_Of_Reactions.NRRdummy}"
      annotation (Placement(transformation(extent={{44,-10},{64,10}})));

    ElectrochemicalReactor.Electrodes.Electrode_Planar Anode(
    redeclare model TemperatureModel =
        Properties.TemperatureModels.TemperatureConstant,
      specRec=eCherry_Library.Data.UserInput.Example_AlkalineAmmoniaElectrolyzer.AESspec,
      GeoRec=eCherry_Library.Data.UserInput.Example_AlkalineAmmoniaElectrolyzer.GeoRec,
      CondRec=eCherry_Library.Data.UserInput.Example_AlkalineAmmoniaElectrolyzer.CondRec,
      redeclare model ActivationOverpotentialModel =
          eCherry_Library.ElectrochemicalReactor.Electrodes.Electrochemistry.Activation_Overpotential.ActivationOverpotential,
      reac={eCherry_Library.Data.UserInput.Example_AlkalineAmmoniaElectrolyzer.OERdummy},
      CathodeEl=false)
      annotation (Placement(transformation(extent={{-86,-10},{-64,10}})));

    ElectrochemicalReactor.Separators.Diaphragm_Hydroxide diaphragmHydroxide(
    redeclare model TemperatureModel =
        Properties.TemperatureModels.TemperatureConstant,
      GeoRec=eCherry_Library.Data.UserInput.Example_AlkalineAmmoniaElectrolyzer.GeoRecMem,
      specRec=eCherry_Library.Data.UserInput.Example_AlkalineAmmoniaElectrolyzer.AESspec,
      CondRec=eCherry_Library.Data.UserInput.Example_AlkalineAmmoniaElectrolyzer.CondRec)
      annotation (Placement(transformation(extent={{-22,-10},{-2,10}})));

    ElectrochemicalReactor.MaterialDomain.Flows.Material_L_InFlow_ResTime
      InflowAnolythe(
      specRec=eCherry_Library.Data.UserInput.Example_AlkalineAmmoniaElectrolyzer.AESspec,
      GeoRec=eCherry_Library.Data.UserInput.Example_AlkalineAmmoniaElectrolyzer.GeoRecElec,
      CondRec=eCherry_Library.Data.UserInput.Example_AlkalineAmmoniaElectrolyzer.CondRec,
      c0=eCherry_Library.Data.UserInput.Example_AlkalineAmmoniaElectrolyzer.c0_Electrolyte,
      t=eCherry_Library.Data.UserInput.Example_AlkalineAmmoniaElectrolyzer.t)
      annotation (Placement(transformation(extent={{-56,-50},{-36,-30}})));

    ElectrochemicalReactor.MaterialDomain.Flows.Material_G_InFlow_ResTime
      InflowGasChannel(
      specRec=eCherry_Library.Data.UserInput.Example_AlkalineAmmoniaElectrolyzer.AESspec,
      GeoRec=eCherry_Library.Data.UserInput.Example_AlkalineAmmoniaElectrolyzer.GeoRec,
      c0=eCherry_Library.Data.UserInput.Example_AlkalineAmmoniaElectrolyzer.c0_GasChannel,
      t=eCherry_Library.Data.UserInput.Example_AlkalineAmmoniaElectrolyzer.t,
      CondRec=eCherry_Library.Data.UserInput.Example_AlkalineAmmoniaElectrolyzer.CondRec)
      annotation (Placement(transformation(extent={{78,-50},{98,-30}})));

    ElectrochemicalReactor.MaterialDomain.Flows.Material_L_InFlow_ResTime
      InflowCatholyte(
      specRec=eCherry_Library.Data.UserInput.Example_AlkalineAmmoniaElectrolyzer.AESspec,
      GeoRec=eCherry_Library.Data.UserInput.Example_AlkalineAmmoniaElectrolyzer.GeoRecElec,
      CondRec=eCherry_Library.Data.UserInput.Example_AlkalineAmmoniaElectrolyzer.CondRec,
      c0=eCherry_Library.Data.UserInput.Example_AlkalineAmmoniaElectrolyzer.c0_Electrolyte,
      t=eCherry_Library.Data.UserInput.Example_AlkalineAmmoniaElectrolyzer.t)
      annotation (Placement(transformation(extent={{10,-50},{30,-30}})));

    ElectrochemicalReactor.Electrolytes.Liquid.Electrolyte_Conti_0D_L
      electrolyte_Conti_0D_L(
      c0=eCherry_Library.Data.UserInput.Example_AlkalineAmmoniaElectrolyzer.c0_Electrolyte,
      specRec=eCherry_Library.Data.UserInput.Example_AlkalineAmmoniaElectrolyzer.AESspec,
      GeoRec=eCherry_Library.Data.UserInput.Example_AlkalineAmmoniaElectrolyzer.GeoRecElec,
      CondRec=eCherry_Library.Data.UserInput.Example_AlkalineAmmoniaElectrolyzer.CondRec)
      annotation (Placement(transformation(extent={{-56,-10},{-36,10}})));

    ElectrochemicalReactor.Electrolytes.Liquid.Electrolyte_Conti_0D_L
      electrolyte_Conti_0D_L1(
      redeclare model TemperatureModel =
        Properties.TemperatureModels.TemperatureConstant,
      c0=eCherry_Library.Data.UserInput.Example_AlkalineAmmoniaElectrolyzer.c0_Electrolyte,
      specRec=eCherry_Library.Data.UserInput.Example_AlkalineAmmoniaElectrolyzer.AESspec,
      GeoRec=eCherry_Library.Data.UserInput.Example_AlkalineAmmoniaElectrolyzer.GeoRecElec,
      CondRec=eCherry_Library.Data.UserInput.Example_AlkalineAmmoniaElectrolyzer.CondRec)
      annotation (Placement(transformation(extent={{10,-10},{30,10}})));

    ElectrochemicalReactor.MaterialDomain.Compartments.Gas.GasChannel
      GasChannel(
      specRec=eCherry_Library.Data.UserInput.Example_AlkalineAmmoniaElectrolyzer.AESspec,
      GeoRec=eCherry_Library.Data.UserInput.Example_AlkalineAmmoniaElectrolyzer.GeoRec,
      CondRec=eCherry_Library.Data.UserInput.Example_AlkalineAmmoniaElectrolyzer.CondRec,
      mol_vec_frac0={0,0,1,0,0,0,0})
      annotation (Placement(transformation(extent={{78,-10},{98,10}})));

    ElectrochemicalReactor.MaterialDomain.Flows.Material_Simple_OutFlow
      OutFlowCatholyte(specRec=eCherry_Library.Data.UserInput.Example_AlkalineAmmoniaElectrolyzer.AESspec)
      annotation (Placement(transformation(extent={{-56,30},{-36,50}})));
    ElectrochemicalReactor.MaterialDomain.Flows.Material_Simple_OutFlow
      OutFlowAnolythe(specRec=eCherry_Library.Data.UserInput.Example_AlkalineAmmoniaElectrolyzer.AESspec)
      annotation (Placement(transformation(extent={{10,30},{30,50}})));
    ElectrochemicalReactor.MaterialDomain.Flows.Material_Simple_OutFlow
      OutFlowGasChannel(specRec=eCherry_Library.Data.UserInput.Example_AlkalineAmmoniaElectrolyzer.AESspec)
      annotation (Placement(transformation(extent={{78,30},{98,50}})));
    ElectrochemicalReactor.ElectricalDomain.Source.Potential_Source.Voltage_Fixed
      U_fix(GeoRec=eCherry_Library.Data.UserInput.Example_AlkalineAmmoniaElectrolyzer.GeoRec,
        Ufixed=-2)
      annotation (Placement(transformation(extent={{10,74},{-10,94}})));
    Modelica.Electrical.Analog.Basic.Ground ground
      annotation (Placement(transformation(extent={{34,56},{54,76}})));
  equation
    connect(InflowAnolythe.convFlow, electrolyte_Conti_0D_L.inFlow)
      annotation (Line(points={{-46,-30},{-46,-10}}, color={0,0,0}));
    connect(InflowCatholyte.convFlow, electrolyte_Conti_0D_L1.inFlow)
      annotation (Line(points={{20,-30},{20,-10}}, color={0,0,0}));
    connect(InflowGasChannel.convFlow, GasChannel.flowIn)
      annotation (Line(points={{88,-30},{88,-9.8}}, color={0,0,0}));
    connect(Anode.n, electrolyte_Conti_0D_L.p)
      annotation (Line(points={{-64,0},{-56,0}}, color={0,0,255}));
    connect(electrolyte_Conti_0D_L.n, diaphragmHydroxide.p)
      annotation (Line(points={{-36,0},{-22,0}}, color={0,0,255}));
    connect(diaphragmHydroxide.n, electrolyte_Conti_0D_L1.p)
      annotation (Line(points={{-2,0},{10,0}}, color={0,0,255}));
    connect(electrolyte_Conti_0D_L1.n, gasDiffusionElectrode.p)
      annotation (Line(points={{30,0},{44,0}}, color={0,0,255}));
    connect(electrolyte_Conti_0D_L.rightFlow, diaphragmHydroxide.anCon)
      annotation (Line(points={{-36,6},{-22,6}}, color={0,0,0}));
    connect(diaphragmHydroxide.catCon, electrolyte_Conti_0D_L1.leftFlow)
      annotation (Line(points={{-3,5},{4,5},{4,6},{10,6}},
                                               color={0,0,0}));
    connect(electrolyte_Conti_0D_L1.rightFlow, gasDiffusionElectrode.flowFromElectrolyte)
      annotation (Line(points={{30,6},{42,6},{42,10},{54,10}},
                                               color={0,0,0}));
    connect(gasDiffusionElectrode.flowFromGas, GasChannel.flowFromElectrode)
      annotation (Line(points={{64,6},{78,6}}, color={0,0,0}));
    connect(Anode.flowFromElectrolyte, electrolyte_Conti_0D_L.leftFlow)
      annotation (Line(points={{-75,10},{-90,10},{-90,16},{-62,16},{-62,6},{-56,6}},
          color={0,0,0}));
    connect(electrolyte_Conti_0D_L.outFlow, OutFlowCatholyte.convFlow)
      annotation (Line(points={{-46,10},{-46,30}}, color={0,0,0}));
    connect(electrolyte_Conti_0D_L1.outFlow, OutFlowAnolythe.convFlow)
      annotation (Line(points={{20,10},{20,30}}, color={0,0,0}));
    connect(GasChannel.flowOut, OutFlowGasChannel.convFlow)
      annotation (Line(points={{88,10},{88,30}}, color={0,0,0}));
    connect(Anode.p, U_fix.n) annotation (Line(points={{-86,0},{-96,0},{-96,84},
            {-10,84}}, color={0,0,255}));
    connect(gasDiffusionElectrode.n, U_fix.p) annotation (Line(points={{64,0},{
            70,0},{70,84},{10,84}}, color={0,0,255}));
    connect(ground.p, U_fix.p)
      annotation (Line(points={{44,76},{44,84},{10,84}}, color={0,0,255}));
    annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
          coordinateSystem(preserveAspectRatio=false)));
  end AAE_0D;

  model Test_AA1_1D
    extends Modelica.Icons.Example;

    ElectrochemicalReactor.DiscretizationZ.cathodeGDE Electrolyzer(
      specRec=eCherry_Library.Data.UserInput.Example_AlkalineAmmoniaElectrolyzer.AESspec,

      GSpec=eCherry_Library.Data.UserInput.Example_AlkalineAmmoniaElectrolyzer.Gspec,

      DSpec=eCherry_Library.Data.UserInput.Example_AlkalineAmmoniaElectrolyzer.Dspec,

      LSpec=eCherry_Library.Data.UserInput.Example_AlkalineAmmoniaElectrolyzer.Lspec,

      GeoRec=eCherry_Library.Data.UserInput.Example_AlkalineAmmoniaElectrolyzer.GeoRec,

      GeoRecMem=eCherry_Library.Data.UserInput.Example_AlkalineAmmoniaElectrolyzer.GeoRecMem,

      GeoRecElec=eCherry_Library.Data.UserInput.Example_AlkalineAmmoniaElectrolyzer.GeoRecElec,

      CondRec=eCherry_Library.Data.UserInput.Example_AlkalineAmmoniaElectrolyzer.CondRec,

      reac_A={eCherry_Library.Data.UserInput.Example_AlkalineAmmoniaElectrolyzer.OERdummy},

      reac_C={eCherry_Library.Data.UserInput.Example_AlkalineAmmoniaElectrolyzer.HERdummy,
          eCherry_Library.Data.UserInput.Example_AlkalineAmmoniaElectrolyzer.NRRdummy},

      c0_Electrolyte=eCherry_Library.Data.UserInput.Example_AlkalineAmmoniaElectrolyzer.c0_Electrolyte,

      mol_vec_frac0=eCherry_Library.Data.UserInput.Example_AlkalineAmmoniaElectrolyzer.mol_vec_frac0)
      annotation (Placement(transformation(extent={{-10,-10},{10,10}})));
    ElectrochemicalReactor.MaterialDomain.Flows.Material_L_InFlow_ResTime
      InflowCatholyte(
      specRec=eCherry_Library.Data.UserInput.Example_AlkalineAmmoniaElectrolyzer.AESspec,

      GeoRec=eCherry_Library.Data.UserInput.Example_AlkalineAmmoniaElectrolyzer.GeoRec,

      CondRec=eCherry_Library.Data.UserInput.Example_AlkalineAmmoniaElectrolyzer.CondRec,

      c=eCherry_Library.Data.UserInput.Example_AlkalineAmmoniaElectrolyzer.c0_Electrolyte,

      T=343.15,
      t=5) annotation (Placement(transformation(extent={{-10,-60},{10,-40}})));
    ElectrochemicalReactor.MaterialDomain.Flows.Material_L_InFlow_ResTime
      InflowAnolyte(
      specRec=eCherry_Library.Data.UserInput.Example_AlkalineAmmoniaElectrolyzer.AESspec,

      GeoRec=eCherry_Library.Data.UserInput.Example_AlkalineAmmoniaElectrolyzer.GeoRec,

      CondRec=eCherry_Library.Data.UserInput.Example_AlkalineAmmoniaElectrolyzer.CondRec,

      c=eCherry_Library.Data.UserInput.Example_AlkalineAmmoniaElectrolyzer.c0_Electrolyte,

      T=343.15,
      t=5) annotation (Placement(transformation(extent={{-50,-60},{-30,-40}})));
    ElectrochemicalReactor.MaterialDomain.Flows.Material_G_InFlow_ResTime
      InflowGas(
      specRec=eCherry_Library.Data.UserInput.Example_AlkalineAmmoniaElectrolyzer.AESspec,

      GeoRec=eCherry_Library.Data.UserInput.Example_AlkalineAmmoniaElectrolyzer.GeoRec,

      CondRec=eCherry_Library.Data.UserInput.Example_AlkalineAmmoniaElectrolyzer.CondRec,

      c=eCherry_Library.Data.UserInput.Example_AlkalineAmmoniaElectrolyzer.mol_vec_frac0,

      T=343.15,
      t=5) annotation (Placement(transformation(extent={{30,-60},{50,-40}})));
    ElectrochemicalReactor.MaterialDomain.Flows.Material_Simple_OutFlow
      OutflowGas(specRec=eCherry_Library.Data.UserInput.Example_AlkalineAmmoniaElectrolyzer.AESspec)
      annotation (Placement(transformation(extent={{30,20},{50,40}})));
    ElectrochemicalReactor.MaterialDomain.Flows.Material_Simple_OutFlow
      OutflowCatholyte(specRec=eCherry_Library.Data.UserInput.Example_AlkalineAmmoniaElectrolyzer.AESspec)
      annotation (Placement(transformation(extent={{-10,20},{10,40}})));
    ElectrochemicalReactor.MaterialDomain.Flows.Material_Simple_OutFlow
      OutflowAnotlyte(specRec=eCherry_Library.Data.UserInput.Example_AlkalineAmmoniaElectrolyzer.AESspec)
      annotation (Placement(transformation(extent={{-50,20},{-30,40}})));
    Modelica.Electrical.Analog.Basic.Ground ground
      annotation (Placement(transformation(extent={{20,44},{40,64}})));
    ElectrochemicalReactor.ElectricalDomain.Source.Potential_Source.Voltage_Fixed
      U_fix(GeoRec=eCherry_Library.Data.UserInput.Example_AlkalineAmmoniaElectrolyzer.GeoRec,
        Ufixed=-2)
      annotation (Placement(transformation(extent={{10,62},{-10,82}})));
  equation
    connect(OutflowAnotlyte.convFlow, Electrolyzer.flowOutAnolythe)
      annotation (Line(points={{-40,20},{-40,10},{-9,10}}, color={0,0,0}));
    connect(OutflowCatholyte.convFlow, Electrolyzer.flowOutCatholyte)
      annotation (Line(points={{0,20},{0,10}}, color={0,0,0}));
    connect(Electrolyzer.flowOutGasChannel, OutflowGas.convFlow)
      annotation (Line(points={{9,10},{40,10},{40,20}}, color={0,0,0}));
    connect(Electrolyzer.flowInGasChannel, InflowGas.convFlow)
      annotation (Line(points={{9,-10},{40,-10},{40,-40}}, color={0,0,0}));
    connect(Electrolyzer.flowInCatholyte, InflowCatholyte.convFlow)
      annotation (Line(points={{0,-10},{0,-40}}, color={0,0,0}));
    connect(Electrolyzer.flowInAnolythe, InflowAnolyte.convFlow)
      annotation (Line(points={{-9,-10},{-40,-10},{-40,-40}}, color={0,0,0}));
    connect(U_fix.p, Electrolyzer.pin_n) annotation (Line(points={{10,72},{54,
            72},{54,0},{10,0}}, color={0,0,255}));
    connect(Electrolyzer.pin_p, U_fix.n) annotation (Line(points={{-10,0},{-62,
            0},{-62,72},{-10,72}}, color={0,0,255}));
    connect(U_fix.p, ground.p)
      annotation (Line(points={{10,72},{30,72},{30,64}}, color={0,0,255}));
    annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
          coordinateSystem(preserveAspectRatio=false)));
  end Test_AA1_1D;

  model Test_Models
   extends Modelica.Icons.Example;
   parameter Temperature T=300 "in K";

    Modelica.Electrical.Analog.Basic.Ground Ground
      annotation (Placement(transformation(extent={{70,54},{50,74}})));
    eCherry_Library.ElectrochemicalReactor.Electrodes.Electrode_Planar Anode(
      P=100000,
      GeoRec=eCherry_Library.Data.UserInput.Pyschik2024_AlkalineWaterElectrolyzer.GeoRec,
      CondRec=eCherry_Library.Data.UserInput.Pyschik2024_AlkalineWaterElectrolyzer.CondRec,
      specRec=eCherry_Library.Data.UserInput.Pyschik2024_AlkalineWaterElectrolyzer.AWEspec,
      redeclare model ActivationOverpotentialModel =
          eCherry_Library.ElectrochemicalReactor.Electrodes.Electrochemistry.Activation_Overpotential.ActivationOverpotentialTafel,
      redeclare model TemperatureModel =
        Properties.TemperatureModels.TemperatureConstant,
      reac={eCherry_Library.Data.UserInput.Pyschik2024_AlkalineWaterElectrolyzer.OERdummy},
      T(displayUnit="K"),
      Pi(each displayUnit="bar"),
      CathodeEl=false)
      annotation (Placement(transformation(extent={{-92,-30},{-72,-10}})));

    eCherry_Library.ElectrochemicalReactor.Electrodes.Electrode_Planar Cathode(
      P=100000,
      GeoRec=eCherry_Library.Data.UserInput.Pyschik2024_AlkalineWaterElectrolyzer.GeoRec,
      CondRec=eCherry_Library.Data.UserInput.Pyschik2024_AlkalineWaterElectrolyzer.CondRec,
      redeclare model ActivationOverpotentialModel =
          eCherry_Library.ElectrochemicalReactor.Electrodes.Electrochemistry.Activation_Overpotential.ActivationOverpotentialTafel,
      specRec=eCherry_Library.Data.UserInput.Pyschik2024_AlkalineWaterElectrolyzer.AWEspec,
      reac={eCherry_Library.Data.UserInput.Pyschik2024_AlkalineWaterElectrolyzer.HERdummy},
      redeclare model TemperatureModel =
        Properties.TemperatureModels.TemperatureConstant,
      T(displayUnit="K"),
      Pi(each displayUnit="bar"),
      CathodeEl=true)
      annotation (Placement(transformation(extent={{70,-30},{90,-10}})));

    eCherry_Library.ElectrochemicalReactor.MaterialDomain.Flows.Material_Simple_InFlow_Fixed
      AnodeInflow(specRec=eCherry_Library.Data.UserInput.Pyschik2024_AlkalineWaterElectrolyzer.AWEspec,
        molFlow_vec=eCherry_Library.Data.UserInput.Pyschik2024_AlkalineWaterElectrolyzer.c0
          *0.00000833333)
      annotation (Placement(transformation(extent={{-50,-66},{-30,-46}})));
    eCherry_Library.ElectrochemicalReactor.MaterialDomain.Flows.Material_Simple_InFlow_Fixed
      CathodeInflow(specRec=eCherry_Library.Data.UserInput.Pyschik2024_AlkalineWaterElectrolyzer.AWEspec,
        molFlow_vec=eCherry_Library.Data.UserInput.Pyschik2024_AlkalineWaterElectrolyzer.c0
          *0.00000833333)
      annotation (Placement(transformation(extent={{30,-66},{50,-46}})));
    eCherry_Library.ElectrochemicalReactor.Separators.Diaphragm_Hydroxide
      Diaphragm(
      redeclare model TemperatureModel =
        Properties.TemperatureModels.TemperatureConstant,
      specRec=eCherry_Library.Data.UserInput.Pyschik2024_AlkalineWaterElectrolyzer.AWEspec,
      GeoRec=eCherry_Library.Data.UserInput.Pyschik2024_AlkalineWaterElectrolyzer.GeoRec,
      CondRec=eCherry_Library.Data.UserInput.Pyschik2024_AlkalineWaterElectrolyzer.CondRec,
      X=5e-4,
      kappa=27.1)
      annotation (Placement(transformation(extent={{-10,-30},{10,-10}})));

    eCherry_Library.ElectrochemicalReactor.Electrolytes.GasLiquid.Electrolyte_Conti_0D_GL
      Catholyte(
      c0=eCherry_Library.Data.UserInput.Pyschik2024_AlkalineWaterElectrolyzer.c0,
      redeclare model TemperatureModel =
        Properties.TemperatureModels.TemperatureConstant,
      specRec=eCherry_Library.Data.UserInput.Pyschik2024_AlkalineWaterElectrolyzer.AWEspec,
      GSpec=eCherry_Library.Data.UserInput.Pyschik2024_AlkalineWaterElectrolyzer.AWE_Gspec,
      DSpec=eCherry_Library.Data.UserInput.Pyschik2024_AlkalineWaterElectrolyzer.AWE_Dspec,
      LSpec=eCherry_Library.Data.UserInput.Pyschik2024_AlkalineWaterElectrolyzer.AWE_Lspec,
      GeoRec=eCherry_Library.Data.UserInput.Pyschik2024_AlkalineWaterElectrolyzer.GeoRec,
      CondRec=eCherry_Library.Data.UserInput.Pyschik2024_AlkalineWaterElectrolyzer.CondRec,
      mol_vec_0=0.001*0.03*eCherry_Library.Data.UserInput.Pyschik2024_AlkalineWaterElectrolyzer.c0,
      P=100000,
      redeclare model ConductivityModel =
          eCherry_Library.ElectrochemicalReactor.Properties.ConductivityModels.ConductivityElectrolyteCalcKOH,
      redeclare model ConductivityModel_GL =
          eCherry_Library.ElectrochemicalReactor.Properties.ConductivityModels.ConductivityElectrolyteGLBruggeman)
      annotation (Placement(transformation(extent={{30,-30},{50,-10}})));

    eCherry_Library.ElectrochemicalReactor.ElectricalDomain.Source.Current_Source.CurrentDensity_Linear
      source(
      GeoRec=eCherry_Library.Data.UserInput.Pyschik2024_AlkalineWaterElectrolyzer.GeoRec,
      j0=1,
      dj=0.01) annotation (Placement(transformation(extent={{10,48},{-10,68}})));

    eCherry_Library.ElectrochemicalReactor.Electrolytes.GasLiquid.Electrolyte_Conti_0D_GL
      Anolyte(
      c0=eCherry_Library.Data.UserInput.Pyschik2024_AlkalineWaterElectrolyzer.c0,
      redeclare model TemperatureModel =
        Properties.TemperatureModels.TemperatureConstant,
      specRec=eCherry_Library.Data.UserInput.Pyschik2024_AlkalineWaterElectrolyzer.AWEspec,
      GSpec=eCherry_Library.Data.UserInput.Pyschik2024_AlkalineWaterElectrolyzer.AWE_Gspec,
      DSpec=eCherry_Library.Data.UserInput.Pyschik2024_AlkalineWaterElectrolyzer.AWE_Dspec,
      LSpec=eCherry_Library.Data.UserInput.Pyschik2024_AlkalineWaterElectrolyzer.AWE_Lspec,
      GeoRec=eCherry_Library.Data.UserInput.Pyschik2024_AlkalineWaterElectrolyzer.GeoRec,
      CondRec=eCherry_Library.Data.UserInput.Pyschik2024_AlkalineWaterElectrolyzer.CondRec,
      mol_vec_0=0.001*0.03*eCherry_Library.Data.UserInput.Pyschik2024_AlkalineWaterElectrolyzer.c0,
      P=100000,
      redeclare model ConductivityModel =
          eCherry_Library.ElectrochemicalReactor.Properties.ConductivityModels.ConductivityElectrolyteCalcKOH,
      redeclare model ConductivityModel_GL =
          eCherry_Library.ElectrochemicalReactor.Properties.ConductivityModels.ConductivityElectrolyteGLBruggeman)
      annotation (Placement(transformation(extent={{-50,-30},{-30,-10}})));

    ElectrochemicalReactor.MaterialDomain.Flows.Material_Simple_OutFlow
      anodeOutflow(specRec=eCherry_Library.Data.UserInput.Pyschik2024_AlkalineWaterElectrolyzer.AWEspec)
      annotation (Placement(transformation(extent={{-50,0},{-30,20}})));
    ElectrochemicalReactor.MaterialDomain.Flows.Material_Simple_OutFlow
      CathodeOutflow(specRec=eCherry_Library.Data.UserInput.Pyschik2024_AlkalineWaterElectrolyzer.AWEspec)
      annotation (Placement(transformation(extent={{30,0},{50,20}})));
  equation

    connect(Anode.p, source.n) annotation (Line(points={{-92,-20},{-96,-20},{
            -96,58},{-10,58}}, color={0,0,255}));
    connect(source.p, Cathode.n) annotation (Line(points={{10,58},{94,58},{94,
            -20},{90,-20}},                 color={0,0,255}));
    connect(Ground.p, source.p) annotation (Line(points={{60,74},{60,76},{26,76},
            {26,58},{10,58}}, color={0,0,255}));
    connect(Anolyte.p, Anode.n) annotation (Line(points={{-50,-20},{-72,-20}},
                             color={0,0,255}));
    connect(Anolyte.n, Diaphragm.p) annotation (Line(points={{-30,-20},{-10,-20}},
                                  color={0,0,255}));
    connect(Anolyte.inFlow, AnodeInflow.convFlow)
      annotation (Line(points={{-40,-30},{-40,-46}}, color={0,0,0}));
    connect(Anolyte.leftFlow, Anode.flowFromElectrolyte) annotation (Line(points={{-50.8,
            -15},{-50.8,-14},{-62,-14},{-62,-4},{-82,-4},{-82,-10}},
                                                 color={0,0,0}));
    connect(Anolyte.rightFlow, Diaphragm.anCon) annotation (Line(points={{-30,-14},
            {-10,-14}},                             color={0,0,0}));
    connect(Catholyte.leftFlow, Diaphragm.catCon)
      annotation (Line(points={{29.2,-15},{29.2,-15},{9,-15}},  color={0,0,0}));
    connect(Catholyte.rightFlow, Cathode.flowFromElectrolyte)
      annotation (Line(points={{50,-14},{62,-14},{62,-4},{80,-4},{80,-10}},
                                                   color={0,0,0}));
    connect(Catholyte.p, Diaphragm.n)
      annotation (Line(points={{30,-20},{10,-20}}, color={0,0,255}));
    connect(Catholyte.n, Cathode.p)
      annotation (Line(points={{50,-20},{70,-20}}, color={0,0,255}));
    connect(CathodeInflow.convFlow, Catholyte.inFlow)
      annotation (Line(points={{40,-46},{40,-30}}, color={0,0,0}));
    connect(anodeOutflow.convFlow, Anolyte.outFlow)
      annotation (Line(points={{-40,0},{-40,-10}}, color={0,0,0}));
    connect(Catholyte.outFlow, CathodeOutflow.convFlow)
      annotation (Line(points={{40,-10},{40,0}}, color={0,0,0}));
    annotation (experiment(
        StopTime=300000,
        __Dymola_NumberOfIntervals=2000,
        Tolerance=1e-12,
        __Dymola_Algorithm="Dassl"));
  end Test_Models;
end AlkalineAmmoniaElectrolyzer;
