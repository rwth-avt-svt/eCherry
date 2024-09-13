within eCherry_Library.ElectrochemicalReactor.ElectricalDomain.Source.Current_Source;
model LinearCurrentDensity "Source for current density"

  // Inheritance
  extends eCherry_Library.ElectrochemicalReactor.ElectricalDomain.Source.GeneralSource;

  // Input parameters
  parameter CurrentDensity j0 "Value of initial current density";
  parameter Real dj;

equation

  j = (j0 + dj*time);

end LinearCurrentDensity;
