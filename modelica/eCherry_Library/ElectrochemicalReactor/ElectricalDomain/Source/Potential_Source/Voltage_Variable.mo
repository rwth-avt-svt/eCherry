within eCherry_Library.ElectrochemicalReactor.ElectricalDomain.Source.Potential_Source;
model Voltage_Variable

  // Inheritance
  extends Electrical_Source_Base;

  // Input parameters
  Voltage U "Imposed cell potential";

equation

    v = U;

end Voltage_Variable;
