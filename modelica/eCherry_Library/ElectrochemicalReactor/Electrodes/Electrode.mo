within eCherry_Library.ElectrochemicalReactor.Electrodes;
model Electrode
  "serial connection of multiple overpotentials and connection to phase"
  extends ElectrodeBase;

  // Replaceable submodel
  replaceable model ActivationOverpotentialModel =
    Electrochemistry.Activation_Overpotential.ActivationOverpotential
                                                annotation (choices(
   choice=eCherry_Library.ElectrochemicalReactor.Electrodes.Electrochemistry.Activation_Overpotential.ActivationOverpotential
    "BV equation with concentration dependence",
    choice=eCherry_Library.ElectrochemicalReactor.Electrodes.Electrochemistry.Activation_Overpotential.ActivationOverpotentialTafelCathodic
    "Tafel approach (cathodic)",
    choice=eCherry_Library.ElectrochemicalReactor.Electrodes.Electrochemistry.Activation_Overpotential.ActivationOverpotentialTafelAnodic
    "Tafel approach (anodic)"));

  // Species handling
  parameter Integer nReac=size(reac,1);
  parameter Data.DataRecords.ElecReaction.Reaction reac[:];
  parameter Boolean CathodeEl "= true, if cathode in electrolysis mode (=anode in galvanic mode), else false";
  Pressure[specRec.nSpec] Pi "partial pressure in pascal";
  Concentration cGas[specRec.nSpec];
  Concentration cGas_tot;
  parameter Pressure P=1e5  "System Pressure";

  // Models
  Electrochemistry.ElectrodeReaction reactions[nReac](
    each T=T,
    each T0=T0,
    each Y=Y,
    each Z=Z,
    each specRec=specRec,
    each Pi=Pi,
    reac=reac,
    each CathodeEl=CathodeEl,
    redeclare model ActivationOverpotentialModel =
        ActivationOverpotentialModel);


equation

  for i in 1:nReac loop
    connect(p, reactions[i].p);
    connect(n, reactions[i].n);
    connect(flowFromElectrolyte, reactions[i].flowFromElectrolyte);
  end for;


  for k in 1:specRec.nSpec loop
    cGas[k] = if specRec.species[k].state == Data.DataRecords.Species.State.Gas
       then flowFromElectrolyte.c[k] else 0;
  end for;
  cGas_tot = sum(cGas[k] for k in 1:specRec.nSpec) + 1e-5;

  for k in 1:specRec.nSpec loop
    Pi[k] = if specRec.species[k].state == Data.DataRecords.Species.State.Gas
       then (cGas[k])/cGas_tot*P else 0;
  end for;


  annotation (Icon(coordinateSystem(preserveAspectRatio=false), graphics={
                             Bitmap(extent={{-102,-100},{102,100}}, fileName=
              "modelica://eCherry_Library/../Icons/ElectrodeConditional.png")}),Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end Electrode;
