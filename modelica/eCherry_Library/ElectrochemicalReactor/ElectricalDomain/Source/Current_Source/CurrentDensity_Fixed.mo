within eCherry_Library.ElectrochemicalReactor.ElectricalDomain.Source.Current_Source;
model CurrentDensity_Fixed "Source for constant current density"

  // Inheritance
  extends
    eCherry_Library.ElectrochemicalReactor.ElectricalDomain.Source.Electrical_Source_Base;

  // Input parameters
  parameter CurrentDensity jFixed;

equation

  j = jFixed;

end CurrentDensity_Fixed;
