within eCherry_Library.ElectrochemicalReactor.ElectricalDomain.Source.Potential_Source;
model ImposedPotential

  // Inheritance
  extends GeneralSource;

  // Input parameters
  parameter Voltage Ufixed "Imposed cell potential";

equation

    v = Ufixed;

end ImposedPotential;
