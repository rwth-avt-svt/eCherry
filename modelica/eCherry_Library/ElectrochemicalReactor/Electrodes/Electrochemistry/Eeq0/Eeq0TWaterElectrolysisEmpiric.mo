within eCherry_Library.ElectrochemicalReactor.Electrodes.Electrochemistry.Eeq0;
model Eeq0TWaterElectrolysisEmpiric

  outer parameter eCherry_Library.Data.DataRecords.ElecReaction.Reaction reac;
  outer Voltage Eeq0T;
  outer Temperature T;
  parameter Temperature T0 = 298.15;

equation
  Eeq0T = reac.Eeq0 + (1.5184  - 1.5421*10^(-3)*T + 9.523*10^(-5)*T*log(T) + 9.84*
    10^(-8)*T^2) -(1.5184  - 1.5421*10^(-3)*T0 + 9.523*10^(-5)*T0*log(T0) + 9.84*
    10^(-8)*T0^2);  //Based on Leroy.1983
end Eeq0TWaterElectrolysisEmpiric;
