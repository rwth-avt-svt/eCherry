within eCherry_Library.ElectrochemicalReactor.Electrodes;
model Electrode_GasDiffusion
  extends Electrode_Base;

  // Species handling
  parameter Real splitFactor "quotient of H2 flow in electrolyte versus in gas channel";

  // Variables (for simulation data)
  Real[nReac, specRec.nSpec] prodRatePerArea "production rate per area in mol/s/m^2, for simulation data";
  Real faradaicEfficiency[nReac] "relation of i,k to i_total";
  CurrentDensity j;

  // Models
  Electrochemistry.ElectrodeReaction_GasDiffusion reactions[nReac](
    each T=T,
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
  // for simulation data
  for k in 1:nReac loop
    faradaicEfficiency[k] = reactions[k].actOp.i/n.i; // faradaic efficiency for NH3 production
    for l in 1:specRec.nSpec loop
      prodRatePerArea[k,l] = reactions[k].productionRate[l] / (Y*Z);
    end for;
  end for;
  j = p.i / (Y*Z); // total current density through cathode

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
