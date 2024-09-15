within eCherry_Library.ElectrochemicalReactor.ElectricalDomain.Source.Potential_Source;
model Voltage_Fixed

  // Inheritance
  extends Electrical_Source_Base;

  // Input parameters
  parameter Voltage Ufixed "Imposed cell potential";

equation

    v = Ufixed;

end Voltage_Fixed;
