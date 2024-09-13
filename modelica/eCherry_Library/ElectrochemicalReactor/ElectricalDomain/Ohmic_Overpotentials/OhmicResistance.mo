within eCherry_Library.ElectrochemicalReactor.ElectricalDomain.Ohmic_Overpotentials;
model OhmicResistance
  extends Modelica.Electrical.Analog.Interfaces.OnePort;
    Real R;

equation
    v = R*i;

end OhmicResistance;
