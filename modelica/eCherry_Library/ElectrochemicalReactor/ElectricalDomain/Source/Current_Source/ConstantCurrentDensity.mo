within eCherry_Library.ElectrochemicalReactor.ElectricalDomain.Source.Current_Source;
model ConstantCurrentDensity
  "Source for constant current density"

  // Inheritance
  extends eCherry_Library.ElectrochemicalReactor.ElectricalDomain.Source.GeneralSource;

  // Input parameters
  parameter CurrentDensity jFixed;

equation

  j = jFixed;

end ConstantCurrentDensity;
