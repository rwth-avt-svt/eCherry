within eCherry_Library.ElectrochemicalReactor.ElectricalDomain.Source.Potential_Source;
model ImposedVariablePotential

  // Inheritance
  extends GeneralSource;

  // Input parameters
  Voltage U "Imposed cell potential";

equation

    v = U;

end ImposedVariablePotential;
