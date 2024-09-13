within eCherry_Library.ElectrochemicalReactor.Electrodes.Electrochemistry.Eeq0;
model Eeq0TConstant

  outer parameter eCherry_Library.Data.DataRecords.ElecReaction.Reaction reac;
  outer Voltage Eeq0T;

equation
  Eeq0T = reac.Eeq0;
end Eeq0TConstant;
