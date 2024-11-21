within eCherry_Library.ElectrochemicalReactor.Electrodes.Electrochemistry.Eeq0;
model Eeq0TWaterElectrolysisEmpiricColdStart

  outer Voltage Eeq0T;
  outer Temperature T;

equation
  Eeq0T = (1.5184  - 1.5421*10^(-3)*T + 9.526*10^(-5)*T*log(T)
  + 9.84*10^(-8)*T^2);  //Based on Sakas2022, which is based on Leroy.1983
end Eeq0TWaterElectrolysisEmpiricColdStart;
