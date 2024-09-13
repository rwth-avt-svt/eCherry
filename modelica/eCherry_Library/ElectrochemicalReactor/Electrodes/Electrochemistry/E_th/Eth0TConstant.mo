within eCherry_Library.ElectrochemicalReactor.Electrodes.Electrochemistry.E_th;
model Eth0TConstant

  outer parameter eCherry_Library.Data.DataRecords.ElecReaction.Reaction reac;
  outer Voltage Eth;

equation
  Eth = reac.Eth0;
end Eth0TConstant;
