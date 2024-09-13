within eCherry_Library.ElectrochemicalReactor.Electrodes.Electrochemistry.Eeq0;
model Eeq0TReactionEntropy

  outer parameter eCherry_Library.Data.DataRecords.ElecReaction.Reaction reac;
  outer Voltage Eeq0T;
  outer Temperature T;
  parameter Temperature T0 = 298.15;

equation
  Eeq0T = reac.Eeq0 + reac.dS_r/reac.z/F*(T-T0);
end Eeq0TReactionEntropy;
