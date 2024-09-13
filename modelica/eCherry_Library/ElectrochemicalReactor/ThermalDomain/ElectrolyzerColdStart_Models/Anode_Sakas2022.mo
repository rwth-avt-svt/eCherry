within eCherry_Library.ElectrochemicalReactor.ThermalDomain.ElectrolyzerColdStart_Models;
model Anode_Sakas2022
  "serial connection of multiple overpotentials and connection to phase"

  // Replaceable submodel
  replaceable model ActivationOverpotentialModel =
    Electrodes.Electrochemistry.Activation_Overpotential.ActivationOverpotential
                                                annotation (choices(
   choice=EquivalentCircuit.Overpotentials.Activation_Overpotential.ActivationOverpotential
    "BV equation with concentration dependence",
   choice=EquivalentCircuit.Overpotentials.Activation_Overpotential.ActivationOverpotentialSimple
    "BV implementation based on Bree et al., Careful: Concentration dependence of exchange current density neglected!",
    choice=EquivalentCircuit.Overpotentials.Activation_Overpotential.ActivationOverpotentialTafel
    "Tafel approach",
    choice=EquivalentCircuit.Overpotentials.Activation_Overpotential.ActivationOverpotential_Sakas2022
    "Approach from Sakas2022; used for energy balance validation"));
  // Temperature model
  replaceable model TemperatureModel =
    Properties.TemperatureModels.TemperatureConstant
      annotation(choices(
    choice=Thermodynamics.TemperatureConstant
    "Constant Temperature",
    choice=Thermodynamics.TemperatureVariable
    "Variable Temperature"));
  TemperatureModel model_T;
  Temperature T "in K";
  parameter Temperature T0 = CondRec.T0;

  // Species handling
  parameter Data.DataRecords.Geometry GeoRec;
  parameter Data.DataRecords.Conditions CondRec;
  parameter Integer nReac=size(reac,1);
  parameter Data.DataRecords.Species.SpeciesRecord specRec;
  parameter Data.DataRecords.ElecReaction.Reaction reac[:];
  parameter Length Y=GeoRec.Y "in m";
  parameter Length Z=GeoRec.Z "in m";
  parameter Pressure[specRec.nSpec] Pi "partial pressure in pascal";

  // Models
  AnodeReaction_Sakas2022 reactions[nReac](
    each T=T,
    each T0=T0,
    each Y=Y,
    each Z=Z,
    each specRec=specRec,
    each Pi=Pi,
    each P=CondRec.p,
    reac=reac,
    redeclare model ActivationOverpotentialModel = ActivationOverpotentialModel);

  Modelica.Electrical.Analog.Interfaces.PositivePin p
    annotation (Placement(transformation(extent={{-108,-8},{-88,12}})));
  Modelica.Electrical.Analog.Interfaces.NegativePin n
    annotation (Placement(transformation(extent={{90,-10},{110,10}})));
  MaterialDomain.Connectors.Material_Liquid flowFromElectrolyte(specRec=specRec)
    annotation (Placement(transformation(extent={{92,40},{112,60}})));

initial equation
  T=T0;
equation

  // Temperature model
  T = model_T.T_i;

  for i in 1:nReac loop
    connect(p, reactions[i].p);
    connect(n, reactions[i].n);
    connect(flowFromElectrolyte, reactions[i].flowFromElectrolyte);
  end for;
  annotation (Icon(coordinateSystem(preserveAspectRatio=false), graphics={
                             Bitmap(extent={{-102,-100},{102,100}}, fileName=
              "modelica://eCherry_Library/../Icons/Anode.png")}), Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end Anode_Sakas2022;
