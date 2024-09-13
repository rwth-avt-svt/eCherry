within eCherry_Library.ElectrochemicalReactor.Properties.UnitConversionModels;
model IdealGasLaw
  input Temperature T "Temperature in K";
  constant Real R = 8.314 "ideal gas constant J/molK";
  input AmountOfSubstance n "ideal gas amount in mol";
  input Pressure P;
  output Volume V "ideal gas volume";

equation

  V = n*R*T/P;

  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end IdealGasLaw;
