within eCherry_Library.ElectrochemicalReactor.Electrodes.Electrochemistry.E_th;
model EthT

  outer parameter eCherry_Library.Data.DataRecords.ElecReaction.Reaction reac;
  outer Voltage Eth;
  outer Temperature T;
  parameter Temperature T0 = 298.15;

equation
  Eth = reac.Eth0 + reac.Cp/reac.z/F*(T-T0);
end EthT;
