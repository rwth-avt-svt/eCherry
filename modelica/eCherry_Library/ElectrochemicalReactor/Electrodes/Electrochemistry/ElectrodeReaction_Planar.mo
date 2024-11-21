within eCherry_Library.ElectrochemicalReactor.Electrodes.Electrochemistry;
model ElectrodeReaction_Planar
  "electrode reaction with one connection to the electrolyte"
  extends ElectrodeReaction_Base;

  // Connectors (phase)
  MaterialDomain.Connectors.Material_Liquid flowFromElectrolyte(specRec=specRec)
    annotation (Placement(transformation(extent={{-110,52},{-90,72}}),
        iconTransformation(extent={{-20,80},{20,120}})));

equation

  for k in 1:specRec.nSpec loop
    flowFromElectrolyte.molFlow_vec[k] + productionRate[k] = 0;
  end for;

end ElectrodeReaction_Planar;
