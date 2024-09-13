within eCherry_Library.ElectrochemicalReactor.ThermalDomain.ElectrolyzerColdStart_Models;
model Cathode_Sakas2022

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

  parameter Data.DataRecords.Geometry GeoRec;
  parameter Data.DataRecords.Conditions CondRec;
  parameter Integer nReac=size(reac,1);
  parameter Data.DataRecords.Species.SpeciesRecord specRec;
  parameter Data.DataRecords.ElecReaction.Reaction reac[:];
  parameter Length Y=GeoRec.Y "in m";
  parameter Length Z=GeoRec.Z "in m";
  parameter Pressure[specRec.nSpec] Pi "partial pressure in pascal";

  // Models
  CathodeReaction_Sakas2022 reactions[nReac](
    each T=T,
    each T0=T0,
    each Y=Y,
    each Z=Z,
    each specRec=specRec,
    each Pi=Pi,
    each P=CondRec.p,
    reac=reac,
    redeclare model ActivationOverpotentialModel = ActivationOverpotentialModel);

  MaterialDomain.Connectors.Material_Liquid flowFromElectrolyte(specRec=specRec)
    annotation (Placement(transformation(extent={{-108,46},{-88,66}})));
  Modelica.Electrical.Analog.Interfaces.PositivePin p
    annotation (Placement(transformation(extent={{-108,-16},{-88,4}})));
  Modelica.Electrical.Analog.Interfaces.NegativePin n
    annotation (Placement(transformation(extent={{90,-16},{110,4}})));

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

  annotation (Icon(graphics={Bitmap(extent={{-106,-100},{106,102}}, fileName=
              "modelica://eCherry_Library/../Icons/Cathode.png")}));
end Cathode_Sakas2022;
