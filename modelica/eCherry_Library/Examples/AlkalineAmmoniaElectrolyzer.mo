within eCherry_Library.Examples;
package AlkalineAmmoniaElectrolyzer
  extends Modelica.Icons.ExamplesPackage;

  model AAE_1D_dZ
    extends Modelica.Icons.Example;
    ElectrochemicalReactor.DiscretizationZ.cathodeGDE Model(
      specRec=eCherry_Library.Data.UserInput.Example_AlkalineAmmoniaElectrolyzer.AESspec,
      GeoRec=eCherry_Library.Data.UserInput.Example_AlkalineAmmoniaElectrolyzer.GeoRec,
      GeoRecMem=eCherry_Library.Data.UserInput.Example_AlkalineAmmoniaElectrolyzer.GeoRecMem,
      GeoRecElec=eCherry_Library.Data.UserInput.Example_AlkalineAmmoniaElectrolyzer.GeoRecElec,
      CondRec=eCherry_Library.Data.UserInput.Example_AlkalineAmmoniaElectrolyzer.CondRec,
      slices=eCherry_Library.Data.UserInput.Example_AlkalineAmmoniaElectrolyzer.slices,
      reac_A={eCherry_Library.Data.UserInput.Example_AlkalineAmmoniaElectrolyzer.OERdummy},
      reac_C={eCherry_Library.Data.UserInput.Example_AlkalineAmmoniaElectrolyzer.NRRdummy,
          eCherry_Library.Data.UserInput.Example_AlkalineAmmoniaElectrolyzer.HERdummy},
      c0_Electrolyte=eCherry_Library.Data.UserInput.Example_AlkalineAmmoniaElectrolyzer.c0_Electrolyte,
      mol_vec_frac0=eCherry_Library.Data.UserInput.Example_AlkalineAmmoniaElectrolyzer.mol_vec_frac0)
      "dZ" annotation (Placement(transformation(extent={{-10,-10},{10,10}})));

    ElectrochemicalReactor.MaterialDomain.Flows.Material_L_InFlow_ResTime
      AnolytheIn(
      specRec=eCherry_Library.Data.UserInput.Example_AlkalineAmmoniaElectrolyzer.AESspec,
      GeoRec=eCherry_Library.Data.UserInput.Example_AlkalineAmmoniaElectrolyzer.GeoRecElec,
      CondRec=eCherry_Library.Data.UserInput.Example_AlkalineAmmoniaElectrolyzer.CondRec,
      slices=eCherry_Library.Data.UserInput.Example_AlkalineAmmoniaElectrolyzer.slices,
      c0=eCherry_Library.Data.UserInput.Example_AlkalineAmmoniaElectrolyzer.c0_Electrolyte,
      t=eCherry_Library.Data.UserInput.Example_AlkalineAmmoniaElectrolyzer.t)
      annotation (Placement(transformation(extent={{-40,-40},{-20,-20}})));

    ElectrochemicalReactor.MaterialDomain.Flows.Material_L_InFlow_ResTime
      CatholyteIn(
      specRec=eCherry_Library.Data.UserInput.Example_AlkalineAmmoniaElectrolyzer.AESspec,
      GeoRec=eCherry_Library.Data.UserInput.Example_AlkalineAmmoniaElectrolyzer.GeoRecElec,
      CondRec=eCherry_Library.Data.UserInput.Example_AlkalineAmmoniaElectrolyzer.CondRec,
      slices=eCherry_Library.Data.UserInput.Example_AlkalineAmmoniaElectrolyzer.slices,
      c0=eCherry_Library.Data.UserInput.Example_AlkalineAmmoniaElectrolyzer.c0_Electrolyte,
      t=eCherry_Library.Data.UserInput.Example_AlkalineAmmoniaElectrolyzer.t)
      annotation (Placement(transformation(extent={{-10,-40},{10,-20}})));

    ElectrochemicalReactor.MaterialDomain.Flows.Material_G_InFlow_ResTime
      GasChannelIn(
      specRec=eCherry_Library.Data.UserInput.Example_AlkalineAmmoniaElectrolyzer.AESspec,
      GeoRec=eCherry_Library.Data.UserInput.Example_AlkalineAmmoniaElectrolyzer.GeoRec,
      slices=eCherry_Library.Data.UserInput.Example_AlkalineAmmoniaElectrolyzer.slices,
      c0=eCherry_Library.Data.UserInput.Example_AlkalineAmmoniaElectrolyzer.c0_GasChannel,
      t=eCherry_Library.Data.UserInput.Example_AlkalineAmmoniaElectrolyzer.t,
      CondRec=eCherry_Library.Data.UserInput.Example_AlkalineAmmoniaElectrolyzer.CondRec)
      annotation (Placement(transformation(extent={{20,-40},{40,-20}})));

    ElectrochemicalReactor.MaterialDomain.Flows.Material_Simple_OutFlow AnolytheOut(
        specRec=eCherry_Library.Data.UserInput.Example_AlkalineAmmoniaElectrolyzer.AESspec)
      annotation (Placement(transformation(extent={{-40,20},{-20,40}})));
    ElectrochemicalReactor.MaterialDomain.Flows.Material_Simple_OutFlow CatholyteOut(
        specRec=eCherry_Library.Data.UserInput.Example_AlkalineAmmoniaElectrolyzer.AESspec)
      annotation (Placement(transformation(extent={{-10,20},{10,40}})));
    ElectrochemicalReactor.MaterialDomain.Flows.Material_Simple_OutFlow GasChannelOut(
        specRec=eCherry_Library.Data.UserInput.Example_AlkalineAmmoniaElectrolyzer.AESspec)
      annotation (Placement(transformation(extent={{20,20},{40,40}})));
    ElectrochemicalReactor.ElectricalDomain.Source.Potential_Source.Voltage_Fixed
      U_fix(GeoRec=eCherry_Library.Data.UserInput.Example_AlkalineAmmoniaElectrolyzer.GeoRec,
        Ufixed=-2)
      annotation (Placement(transformation(extent={{10,70},{-10,90}})));
    Modelica.Electrical.Analog.Basic.Ground ground
      annotation (Placement(transformation(extent={{20,46},{40,66}})));
  equation
    connect(CatholyteIn.convFlow, Model.flowInCatholyte)
      annotation (Line(points={{0,-20},{0,-10}}, color={0,0,0}));
    connect(AnolytheIn.convFlow, Model.flowInAnolythe)
      annotation (Line(points={{-30,-20},{-30,-10},{-9,-10}}, color={0,0,0}));
    connect(GasChannelIn.convFlow, Model.flowInGasChannel)
      annotation (Line(points={{30,-20},{30,-10},{9,-10}}, color={0,0,0}));
    connect(AnolytheOut.convFlow, Model.flowOutAnolythe)
      annotation (Line(points={{-30,20},{-30,10},{-9,10}}, color={0,0,0}));
    connect(CatholyteOut.convFlow, Model.flowOutCatholyte)
      annotation (Line(points={{0,20},{0,10}}, color={0,0,0}));
    connect(GasChannelOut.convFlow, Model.flowOutGasChannel)
      annotation (Line(points={{30,20},{30,10},{9,10}}, color={0,0,0}));
    connect(U_fix.p, Model.pin_n) annotation (Line(points={{10,80},{60,80},{60,
            0},{10,0}}, color={0,0,255}));
    connect(U_fix.n, Model.pin_p) annotation (Line(points={{-10,80},{-60,80},{
            -60,0},{-10,0}}, color={0,0,255}));
    connect(ground.p, Model.pin_n) annotation (Line(points={{30,66},{30,80},{60,
            80},{60,0},{10,0}}, color={0,0,255}));
    annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
          coordinateSystem(preserveAspectRatio=false)),
      experiment(StopTime=30, __Dymola_Algorithm="Dassl"));
  end AAE_1D_dZ;

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
end AlkalineAmmoniaElectrolyzer;
