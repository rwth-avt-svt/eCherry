within eCherry_Library.ElectrochemicalReactor.ElectricalDomain.Source.Power_Source;
partial model ImposedPower

  // Inheritance
  extends GeneralSource;

  // Input parameters
  parameter Power Pfixed "Imposed cell power";

equation

    W = Pfixed;

end ImposedPower;
