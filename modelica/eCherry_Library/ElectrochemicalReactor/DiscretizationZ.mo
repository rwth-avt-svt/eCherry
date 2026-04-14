within eCherry_Library.ElectrochemicalReactor;
package DiscretizationZ "Package for discretizations on the Z axes"
  model cathodeGDE
    "discretization along the length (Z) of the electrolyzer. Electrolyzer setup with GDE as cathode"

    // package handling
    inner parameter Data.DataRecords.Species.SpeciesRecord specRec;
    parameter Data.DataRecords.Species.SpeciesRecord GSpec;
    parameter Data.DataRecords.Species.SpeciesRecord DSpec;
    parameter Data.DataRecords.Species.SpeciesRecord LSpec;
    parameter Data.DataRecords.Geometry GeoRec;
    parameter Data.DataRecords.Geometry GeoRecMem;
    parameter Data.DataRecords.Geometry GeoRecElec;
    parameter Data.DataRecords.Conditions CondRec;
    parameter Pressure Pr = 1e5 "system pressure";
    parameter Temperature T0 = 343.15;

    // discretization
    parameter Integer slices = GeoRec.slices "number of segments";

    // input for cathode and anode
    parameter Integer nReac_A=size(reac_A,1);
    parameter Integer nReac_C=size(reac_C,1);
    parameter Data.DataRecords.ElecReaction.Reaction reac_A[:];
    parameter Data.DataRecords.ElecReaction.Reaction reac_C[:];
    constant Boolean CathodeElCat = true;
    constant Boolean CathodeElAn = false;
    parameter Real splitFactor = 0 "NH3 in catholyte -->0, in gasChannel -->1";

    // initial input for electrolyte and gas channel
    parameter Concentration c0_Electrolyte[specRec.nSpec] "initial concentration of electrolyte";
    constant Real mol_vec_frac0[specRec.nSpec] "fraction of initial amount of gas in the compartment; [0,1]";

    // for simulation data extraction
    MolarFlowRate[slices] productionRateSim_NH3;
    MolarFlowRate absProductionRateSim_NH3;
    Real prodRatePerAreaSim_NH3_meanValue;
    Real[slices] prodRatePerAreaSim_NH3;
    Current iSim;
    Real[slices] faradaicEfficiencySim_NRR;
    Real faradaicEfficiencySim_NRR_meanValue;

    // replaceable submodels
    replaceable model TemperatureModel =
      Properties.TemperatureModels.TemperatureConstant "T-model for all instances"
        annotation(choices(
      choice=Properties.TemperatureModels.TemperatureConstant
      "Constant Temperature",
      choice=Properties.TemperatureModels.TemperatureVariable
      "Variable Temperature"));
    replaceable model ActivationOverpotentialModel =
      Electrodes.Electrochemistry.Activation_Overpotential.ActivationOverpotential
                                                                                   "actOp-model for cathode and anode"
      annotation (choices(
     choice=eCherry_Library.ElectrochemicalReactor.Electrodes.Electrochemistry.Activation_Overpotential.ActivationOverpotential
      "BV equation with concentration dependence",
      choice=eCherry_Library.ElectrochemicalReactor.Electrodes.Electrochemistry.Activation_Overpotential.ActivationOverpotentialSpecRec
      "BV equation with concentration dependence (SpecRec)",
      choice=eCherry_Library.ElectrochemicalReactor.Electrodes.Electrochemistry.Activation_Overpotential.ActivationOverpotentialTafel
      "Tafel approach",
      choice=eCherry_Library.ElectrochemicalReactor.Electrodes.Electrochemistry.Activation_Overpotential.ActivationOverpotentialColdStart
      "Approach from Sakas2022 used for ColdStart example"));
    replaceable model EquilibriumPotentialModel =
      Electrodes.Electrochemistry.Equilibrium_Potential.EquilibriumPotential "eqP-model for cathode and anode"
      annotation (choices(
      choice=eCherry_Library.ElectrochemicalReactor.Electrodes.Electrochemistry.Equilibrium_Potential.EquilibriumPotential
      "Nernst equation",
      choice=eCherry_Library.ElectrochemicalReactor.Electrodes.Electrochemistry.Equilibrium_Potential.EquilibriumPotentialSpecRec
      "Nernst equation for SpecRec",
      choice=eCherry_Library.ElectrochemicalReactor.Electrodes.Electrochemistry.Equilibrium_Potential.EquilibriumPotentialColdStart
      "Approach from Sakas2022 used for ColdStart example"));
    replaceable model ConductivityModelElectrolyte =
      Properties.ConductivityModels.ConductivityElectrolyteConstant "conductivity-model for anolyte"
      annotation(choices(
      choice = Properties.ConductivityModels.ConductivityElectrolyteCalcKOH
      "KOH: Calculation of Conductivity",
      choice = Properties.ConductivityModels.ConductivityElectrolyteConstant
      "Constant Conductivity",
      choice = Properties.ConductivityModels.ConductivityElectrolyteCalcKOHColdStart
      "KOH Calculation Model for Cold Start"));
    replaceable model ConductivityModelAnolyte_GL =
      Properties.ConductivityModels.ConductivityElectrolyteGLBruggeman "conductivity-model for anolyte"
      annotation(choices(
    choice=Properties.ConductivityModels.ConductivityElectrolyteGLBruggeman
    "Calculation of gas phase influence by Bruggeman Model",
    choice=Properties.ConductivityModels.ConductivityElectrolyteGLNoBubbles
    "Neglection of gas phase influence"));
    replaceable model DensityModel =
      Properties.DensityModels.DensityKOH "density-model for electrolyte compartments"
        annotation(choices(
      choice=Properties.DensityModels.DensityConstant
      "Constant density",
      choice=Properties.DensityModels.DensityWaterTdependent
      "Temperature dependent water density",
      choice=Properties.DensityModels.DensityMix
      "Density mix (KOH)"));


    // model instances
    eCherry_Library.ElectrochemicalReactor.MaterialDomain.Compartments.Gas.GasChannel channel_n[slices](
      each slices=slices,
      each specRec=specRec,
      each GeoRec=GeoRec,
      each CondRec=CondRec,
      each mol_vec_frac0=mol_vec_frac0,
      each p=Pr,
      each T0=T0,
      redeclare model TemperatureModel = TemperatureModel);

    eCherry_Library.ElectrochemicalReactor.Electrodes.Electrode_GasDiffusion cathode_n[slices](
      each slices=slices,
      each specRec=specRec,
      each GeoRec=GeoRec,
      each CondRec=CondRec,
      each splitFactor=splitFactor,
      each CathodeEl=CathodeElCat,
      each reac=reac_C,
      each T0=T0,
      redeclare model TemperatureModel = TemperatureModel,
      redeclare model ActivationOverpotentialModel =
          ActivationOverpotentialModel,
      redeclare model EquilibriumPotentialModel = EquilibriumPotentialModel);

    eCherry_Library.ElectrochemicalReactor.Electrolytes.Liquid.Electrolyte_Conti_0D_L catholyte_n[slices](
      each slices=slices,
      each specRec=specRec,
      each GeoRec=GeoRecElec,
      each CondRec=CondRec,
      each c0=c0_Electrolyte,
      each T0=T0,
      redeclare model TemperatureModel = TemperatureModel,
      redeclare model DensityModel = DensityModel,
      redeclare model ConductivityModel = ConductivityModelElectrolyte);

    eCherry_Library.ElectrochemicalReactor.Separators.Diaphragm_Hydroxide membrane_n[slices](
      each slices=slices,
      each specRec=specRec,
      each GeoRec=GeoRecMem,
      each CondRec=CondRec,
      each T0=T0,
      redeclare model TemperatureModel = TemperatureModel);

    eCherry_Library.ElectrochemicalReactor.Electrolytes.GasLiquid.Electrolyte_Conti_0D_GL anolyte_n[slices](
      each slices=slices,
      each specRec=specRec,
      each GSpec=GSpec,
      each LSpec=LSpec,
      each DSpec=DSpec,
      each GeoRec=GeoRecElec,
      each CondRec=CondRec,
      each c0=c0_Electrolyte,
      each P=Pr,
      each T0=T0,
      redeclare model TemperatureModel = TemperatureModel,
      redeclare model DensityModel = DensityModel,
      redeclare model ConductivityModel = ConductivityModelElectrolyte,
      redeclare model ConductivityModel_GL = ConductivityModelAnolyte_GL);

    eCherry_Library.ElectrochemicalReactor.Electrodes.Electrode_Planar anode_n[slices](
      each slices=slices,
      each specRec=specRec,
      each GeoRec=GeoRec,
      each CondRec=CondRec,
      each reac=reac_A,
      each P=Pr,
      each T0=T0,
      each CathodeEl=CathodeElAn,
      redeclare model TemperatureModel = TemperatureModel,
      redeclare model ActivationOverpotentialModel =
          ActivationOverpotentialModel,
      redeclare model EquilibriumPotentialModel = EquilibriumPotentialModel);

    // connectors
    Modelica.Electrical.Analog.Interfaces.PositivePin pin_p
      annotation (Placement(transformation(extent={{-110,-10},{-90,10}})));
    Modelica.Electrical.Analog.Interfaces.NegativePin pin_n
      annotation (Placement(transformation(extent={{90,-10},{110,10}})));
    MaterialDomain.Connectors.Material_Simple flowInAnolythe(specRec=specRec)
      annotation (Placement(transformation(extent={{-100,-110},{-80,-90}})));
    MaterialDomain.Connectors.Material_Simple flowInCatholyte(specRec=specRec)
      annotation (Placement(transformation(extent={{-10,-110},{10,-90}})));
    MaterialDomain.Connectors.Material_Simple flowInGasChannel(specRec=specRec)
      annotation (Placement(transformation(extent={{80,-110},{100,-90}})));
    MaterialDomain.Connectors.Material_Simple flowOutAnolythe(specRec=specRec)
      annotation (Placement(transformation(extent={{-100,90},{-80,110}})));
    MaterialDomain.Connectors.Material_Simple flowOutCatholyte(specRec=specRec)
      annotation (Placement(transformation(extent={{-10,90},{10,110}})));
    MaterialDomain.Connectors.Material_Simple flowOutGasChannel(specRec=specRec)
      annotation (Placement(transformation(extent={{80,90},{100,110}})));

  equation
    //simulation data
    iSim = pin_p.i;
    absProductionRateSim_NH3 = sum(productionRateSim_NH3);
    prodRatePerAreaSim_NH3_meanValue = sum(prodRatePerAreaSim_NH3)/slices;
    faradaicEfficiencySim_NRR_meanValue = sum(faradaicEfficiencySim_NRR)/slices;
    for k in 1:slices loop
      productionRateSim_NH3[k] = cathode_n[k].reactions[2].productionRate[4];
      prodRatePerAreaSim_NH3[k] = cathode_n[k].prodRatePerArea[2,4];
      faradaicEfficiencySim_NRR[k] = cathode_n[k].faradaicEfficiency[2];
    end for;

    // connecting all submodels in order left to right
    // connect GasChannel segments with each other, connect first and last segment with model - vertical
    for i in 1:slices-1 loop
      connect(channel_n[i].outFlow, channel_n[i+1].inFlow);
    end for;
    connect(channel_n[1].inFlow, flowInGasChannel);
    connect(channel_n[end].outFlow, flowOutGasChannel);

    // connect catholyte segments with each other, connect first and last segment with model - vertical
    for i in 1:slices-1 loop
      connect(catholyte_n[i].outFlow, catholyte_n[i+1].inFlow);
    end for;
    connect(catholyte_n[1].inFlow, flowInCatholyte);
    connect(catholyte_n[end].outFlow, flowOutCatholyte);

    // connect anolyte segments with each other, connect first and last segment with model - vertical
    for i in 1:slices-1 loop
      connect(anolyte_n[i].outFlow, anolyte_n[i+1].inFlow);
    end for;
    connect(anolyte_n[1].inFlow, flowInAnolythe);
    connect(anolyte_n[end].outFlow, flowOutAnolythe);

    // connect each GasChannel segment with cathode segment - horizontal
    // connect each cathode segment with catholyte segment - horizontal
    // connect each catholyte segment with membrane segment - horizontal
    // connect each membrane segment with anolyte segment - hoorizontal
    // connect each anolyte segment with anode segment - horizontal
    for i in 1:slices loop
      connect(channel_n[i].flowFromElectrode, cathode_n[i].flowFromGas);
      connect(cathode_n[i].flowFromElectrolyte, catholyte_n[i].rightFlow);
      connect(catholyte_n[i].leftFlow, membrane_n[i].catCon);
      connect(membrane_n[i].anCon, anolyte_n[i].rightFlow);
      connect(anolyte_n[i].leftFlow, anode_n[i].flowFromElectrolyte);
    end for;

    // connect electrical circuit, electrolyte model segments (horizontal) connected in parallel, same outer voltage for each segment, i = sum(i_n)
    for i in 1:slices loop
      connect(pin_n, cathode_n[i].n);
      connect(cathode_n[i].p, catholyte_n[i].n);
      connect(catholyte_n[i].p, membrane_n[i].n);
      connect(membrane_n[i].p, anolyte_n[i].n);
      connect(anolyte_n[i].p, anode_n[i].n);
      connect(anode_n[i].p, pin_p);
    end for;


    annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
          coordinateSystem(preserveAspectRatio=false)));
  end cathodeGDE;
end DiscretizationZ;
