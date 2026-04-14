within eCherry_Library.ElectrochemicalReactor.Electrodes;
partial model Electrode_Base

  // Replaceable submodels
  replaceable model ActivationOverpotentialModel =
    Electrochemistry.Activation_Overpotential.ActivationOverpotential
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
    Electrochemistry.Equilibrium_Potential.EquilibriumPotential
    annotation (choices(
    choice=eCherry_Library.ElectrochemicalReactor.Electrodes.Electrochemistry.Equilibrium_Potential.EquilibriumPotential
    "Nernst equation",
    choice=eCherry_Library.ElectrochemicalReactor.Electrodes.Electrochemistry.Equilibrium_Potential.EquilibriumPotentialSpecRec
    "Nernst equation for SpecRec",
    choice=eCherry_Library.ElectrochemicalReactor.Electrodes.Electrochemistry.Equilibrium_Potential.EquilibriumPotentialColdStart
    "Approach from Sakas2022 used for ColdStart example"));
  // Temperature model
  replaceable model TemperatureModel =
    Properties.TemperatureModels.TemperatureBase
      annotation(choices(
    choice=Thermodynamics.TemperatureConstant
    "Constant Temperature",
    choice=Thermodynamics.TemperatureVariable
    "Variable Temperature"));

  TemperatureModel model_T;

  parameter Data.DataRecords.Species.SpeciesRecord specRec;
  parameter Data.DataRecords.Geometry GeoRec;
  parameter Data.DataRecords.Conditions CondRec;
  parameter Integer slices = GeoRec.slices "number of compartements / discretisation steps";
  parameter Length Y=GeoRec.Y "in m";
  parameter Length Z=GeoRec.Z/slices "in m";

  parameter Integer nReac=size(reac,1);
  parameter Data.DataRecords.ElecReaction.Reaction reac[:];
  parameter Boolean CathodeEl "= true, if cathode in electrolysis mode (=anode in galvanic mode), else false";

  Pressure[specRec.nSpec] Pi "partial pressure in pascal";
  Concentration[specRec.nSpec] c "concentration in mol/m^3";
  Temperature T "in K";
  parameter Temperature T0 = CondRec.T0;

  // Connectors
  Modelica.Electrical.Analog.Interfaces.PositivePin p annotation (Placement(
        transformation(extent={{-110,-10},{-90,10}}), iconTransformation(extent=
           {{-110,-10},{-90,10}})));
  Modelica.Electrical.Analog.Interfaces.NegativePin n annotation (Placement(
        transformation(extent={{90,-10},{110,10}}), iconTransformation(extent={{
            90,-10},{110,10}})));
  MaterialDomain.Connectors.Material_Liquid flowFromElectrolyte(specRec=specRec) annotation (Placement(transformation(extent={{-10,90},
            {10,110}})));

initial equation
  T=T0;

equation

  // Temperature model
  T = model_T.T_i;

  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end Electrode_Base;
