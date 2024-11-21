within eCherry_Library.ElectrochemicalReactor.Electrodes;
model Electrode_GasDiffusion
  extends Electrode_Base;

  // Replaceable submodel
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

  // Species handling
  parameter Integer nReac=size(reac,1);
  parameter Data.DataRecords.ElecReaction.Reaction reac[:];
  parameter Boolean CathodeEl "= true, if cathode in electrolysis mode (=anode in galvanic mode), else false";
  parameter Real splitFactor "quotient of H2 flow in electrolyte versus in gas channel";

  // Models
  Electrochemistry.ElectrodeReaction_GasDiffusion reactions[nReac](
    each T=T,
    each T0=T0,
    each Y=Y,
    each Z=Z,
    each specRec=specRec,
    each Pi=Pi,
    each c=c,
    reac=reac,
    each CathodeEl=CathodeEl,
    each splitFactor=splitFactor,
    redeclare model ActivationOverpotentialModel = ActivationOverpotentialModel,

    redeclare model EquilibriumPotentialModel = EquilibriumPotentialModel);

  MaterialDomain.Connectors.Material_Gas flowFromGas(specRec=specRec)
    annotation (Placement(transformation(extent={{90,50},{110,70}})));

equation
  // input variables of parent class
  Pi = flowFromGas.Pi;
  c = flowFromElectrolyte.c;

  for i in 1:nReac loop
    connect(p, reactions[i].p);
    connect(n, reactions[i].n);
    connect(flowFromGas, reactions[i].flowFromGas);
    connect(flowFromElectrolyte, reactions[i].flowFromElectrolyte);
  end for;

annotation (Icon(graphics={Bitmap(
        extent={{-108,-100},{106,100}},
        fileName="modelica://eCherry_Library/../Icons/ElectrodeConditional.png")}));
end Electrode_GasDiffusion;
