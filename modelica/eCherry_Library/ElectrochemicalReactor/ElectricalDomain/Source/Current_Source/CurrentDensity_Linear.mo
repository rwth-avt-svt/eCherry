within eCherry_Library.ElectrochemicalReactor.ElectricalDomain.Source.Current_Source;
model CurrentDensity_Linear "Source for current density"

  // Inheritance
  extends
    eCherry_Library.ElectrochemicalReactor.ElectricalDomain.Source.Electrical_Source_Base;

  // Input parameters
  parameter CurrentDensity j0 "Value of initial current density";
  parameter Real dj;

equation

  j = (j0 + dj*time);

end CurrentDensity_Linear;
