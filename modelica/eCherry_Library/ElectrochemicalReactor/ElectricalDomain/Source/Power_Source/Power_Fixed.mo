within eCherry_Library.ElectrochemicalReactor.ElectricalDomain.Source.Power_Source;
partial model Power_Fixed

  // Inheritance
  extends Electrical_Source_Base;

  // Input parameters
  parameter Power Pfixed "Imposed cell power";

equation

    W = Pfixed;

end Power_Fixed;
