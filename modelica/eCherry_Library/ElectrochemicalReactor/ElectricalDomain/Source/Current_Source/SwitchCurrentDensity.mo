within eCherry_Library.ElectrochemicalReactor.ElectricalDomain.Source.Current_Source;
model SwitchCurrentDensity
  "Source for constant current density, switched on at t"

  // Inheritance
  extends eCherry_Library.ElectrochemicalReactor.ElectricalDomain.Source.GeneralSource;

  // Input parameters
  parameter Real tSwitch;
  parameter CurrentDensity jFixed;

  // Variables
  Integer is_on(start=0);

equation

when time>tSwitch then
  is_on = 1;
end when;

  j = is_on * jFixed;

end SwitchCurrentDensity;
