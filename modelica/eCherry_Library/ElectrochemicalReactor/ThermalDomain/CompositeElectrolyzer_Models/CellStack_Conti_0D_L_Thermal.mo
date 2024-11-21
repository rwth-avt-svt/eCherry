within eCherry_Library.ElectrochemicalReactor.ThermalDomain.CompositeElectrolyzer_Models;
model CellStack_Conti_0D_L_Thermal
 import eCherry_Library.ElectrochemicalReactor.Utility.get_diffusion_distances;

  parameter Data.DataRecords.Thermal EBRec;
  parameter Data.DataRecords.Species.SpeciesRecord specRec(nSpec=0);
  parameter Data.DataRecords.Geometry GeoRec;
  parameter Data.DataRecords.Conditions CondRec;
  parameter Concentration c0[specRec.nSpec];
  parameter MolarFlowRate[specRec.nSpec] molFlow_vec_inFlow;
  parameter Pressure[specRec.nSpec] Pi;
  parameter HeatFlowRate QFlow_shunt "per cell";
  parameter Data.DataRecords.ElecReaction.Reaction reac_anode[:];
  parameter Data.DataRecords.ElecReaction.Reaction reac_cathode[:];
  parameter Boolean ConvInflowTempreatureIsCompartmentTemperature annotation(Evaluate=true, HideResult=false, choices(checkBox=true));

  // Parameters
  parameter Integer n_cells(min=1) "number of finite volume cells (discretization)";
  parameter Conductivity kappa_membrane "constant conductivity of membrane";

  // Replaceable submodel
  replaceable model ActivationOverpotentialModel =
    eCherry_Library.ElectrochemicalReactor.Electrodes.Electrochemistry.Activation_Overpotential.ActivationOverpotential
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
    eCherry_Library.ElectrochemicalReactor.Electrodes.Electrochemistry.Equilibrium_Potential.EquilibriumPotential
    annotation (choices(
    choice=eCherry_Library.ElectrochemicalReactor.Electrodes.Electrochemistry.Equilibrium_Potential.EquilibriumPotential
    "Nernst equation",
    choice=eCherry_Library.ElectrochemicalReactor.Electrodes.Electrochemistry.Equilibrium_Potential.EquilibriumPotentialSpecRec
    "Nernst equation for SpecRec",
    choice=eCherry_Library.ElectrochemicalReactor.Electrodes.Electrochemistry.Equilibrium_Potential.EquilibriumPotentialColdStart
    "Approach from Sakas2022 used for ColdStart example"));
  replaceable model DensityModel =
      Properties.DensityModels.DensityWaterTdependent(T=T)
      annotation(choices(
    choice=eCherry_Library.ElectrochemicalReactor.Properties.DensityModels.DensityConstant
    "Constant density",
    choice=eCherry_Library.ElectrochemicalReactor.Properties.DensityModels.DensityWaterTdependent
    "Temperature dependent water density",
    choice=eCherry_Library.ElectrochemicalReactor.Properties.DensityModels.DensityMix
    "Temperature dependent mixture density",
    choice=eCherry_Library.ElectrochemicalReactor.Properties.DensityModels.DensityGas
    "Density of gaseous phase using ideal gas law"));
  replaceable model ConductivityModelElectrolyte =
      eCherry_Library.ElectrochemicalReactor.Properties.ConductivityModels.ConductivityElectrolyteConstant
    annotation(choices(
    choice=eCherry_Library.ElectrochemicalReactor.Properties.ConductivityModels.ConductivityElectrolyteCalcKOH
    "KOH: Calculation of Conductivity",
    choice=eCherry_Library.ElectrochemicalReactor.Properties.ConductivityModels.ConductivityElectrolyteConstant
    "Constant Conductivity",
    choice=eCherry_Library.ElectrochemicalReactor.Properties.ConductivityModels.ConductivityElectrolyteCalcKOHColdStart
    "Approach from Sakas2022 used for ColdStart example"));
  replaceable model HeatEnvModelElectrolyte =
      eCherry_Library.ElectrochemicalReactor.ThermalDomain.Thermal_Effects.HeatExchangeEnvironment
      (
    T=T,
    EBRec=EBRec,
    GeoRec=GeoRec,
    CondRec=CondRec)
    annotation(choices(
    choice=eCherry_Library.ElectrochemicalReactor.ThermalDomain.Thermal_Effects.HeatExchangeEnvironment
    "Standard model for heat exchange with environment",
    choice=eCherry_Library.ElectrochemicalReactor.ThermalDomain.Thermal_Effects.HeatExchangeEnvironmentColdStart
    "Approach from Sakas2022 used for ColdStart example"));

  // Models
  eCherry_Library.ElectrochemicalReactor.ThermalDomain.ConnectionLayers.ConnectionLayer_CompositeHT
    HT_Bipolar[n_cells - 1](
    each GeoRec=GeoRec,
    each C=100000,
    each useConvection=true);
                               //

  Cell_Conti_0D_L_Thermal cells[n_cells](
    each EBRec=EBRec,
    each specRec=specRec,
    each GeoRec=GeoRec,
    each c0=c0,
    each kappa_membrane=kappa_membrane,
    each CondRec=CondRec,
    each molFlow_vec_inFlow=molFlow_vec_inFlow,
    each Pi=Pi,
    each QFlow_shunt=QFlow_shunt,
    each reac_anode=reac_anode,
    each reac_cathode=reac_cathode,
    each ConvInflowTempreatureIsCompartmentTemperature=ConvInflowTempreatureIsCompartmentTemperature,
    redeclare model ActivationOverpotentialModel =
        ActivationOverpotentialModel,
    redeclare model EquilibriumPotentialModel = EquilibriumPotentialModel,
    redeclare model DensityModel = DensityModel,
    redeclare model ConductivityModelElectrolyte =
        ConductivityModelElectrolyte,
    redeclare model HeatEnvModelElectrolyte = HeatEnvModelElectrolyte);

  /*eCherry_Library.ElectrochemicalReactor.ThermalDomain.Source.ExternalHeating_Adiabatic
    externalHeatingAnode(EBRec=EBRec);
  eCherry_Library.ElectrochemicalReactor.ThermalDomain.Source.ExternalHeating_Adiabatic
    externalHeatingCathode(EBRec=EBRec);*/
  // Connectors
        Modelica.Electrical.Analog.Interfaces.PositivePin p "Positive electrical pin"
  annotation (Placement(
        transformation(extent={{-110,-10},{-90,10}})));
  Modelica.Electrical.Analog.Interfaces.NegativePin n "Negative electrical pin" annotation (Placement(transformation(extent={{
            110,-10},{90,10}})));

equation

  // Connecting the equivalent circuits
  for i in 1:n_cells-1 loop
    connect(cells[i].n, cells[i+1].p) "a";
  end for;
    connect(p, cells[1].p)
    annotation (Line(points={{-100,0},{-46,0}}, color={0,0,255}));
    connect(cells[end].n, n)
    annotation (Line(points={{46,0},{100,0}}, color={0,0,255}));

  // Connecting the heat flows
    for i in 1:n_cells-1 loop
    connect(cells[i].rightHeatFlow, HT_Bipolar[i].leftHeatFlow) "a";
    connect(HT_Bipolar[i].rightHeatFlow, cells[i+1].leftHeatFlow) "a";
  end for;

  //connect(externalHeatingAnode.heatFlow,cells[1].leftHeatFlow);
  //connect(externalHeatingCathode.heatFlow,cells[end].rightHeatFlow);

             annotation (Icon(coordinateSystem(preserveAspectRatio=false), graphics={
          Bitmap(extent={{-102,-100},{104,102}}, fileName=
              "modelica://eCherry_Library/../Icons/nDiscs.png")}), Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end CellStack_Conti_0D_L_Thermal;
