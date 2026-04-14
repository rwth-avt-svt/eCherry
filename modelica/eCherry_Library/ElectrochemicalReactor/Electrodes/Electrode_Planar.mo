within eCherry_Library.ElectrochemicalReactor.Electrodes;
model Electrode_Planar
  "serial connection of multiple overpotentials and connection to phase"
  extends Electrode_Base;


  // Species handling
  Concentration cGas[specRec.nSpec];
  Concentration cGas_tot;
  parameter Pressure P=1e5  "System Pressure";

  // Models
  Electrochemistry.ElectrodeReaction_Planar reactions[nReac](
    each T=T,
    each Y=Y,
    each Z=Z,
    each specRec=specRec,
    each Pi=Pi,
    each c=c,
    reac=reac,
    each CathodeEl=CathodeEl,
    redeclare model ActivationOverpotentialModel = ActivationOverpotentialModel,
    redeclare model EquilibriumPotentialModel = EquilibriumPotentialModel);

equation
  // fill input
  c = flowFromElectrolyte.c;

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
end Electrode_Planar;
