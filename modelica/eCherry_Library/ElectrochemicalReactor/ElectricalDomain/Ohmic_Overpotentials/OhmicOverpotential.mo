within eCherry_Library.ElectrochemicalReactor.ElectricalDomain.Ohmic_Overpotentials;
model OhmicOverpotential
  extends Modelica.Electrical.Analog.Interfaces.OnePort;
  parameter Data.DataRecords.Geometry GeoRec;

  CurrentDensity j(start=500);
  parameter Length X=GeoRec.X;
  parameter Length Y=GeoRec.Y;
  parameter Integer slices = GeoRec.slices "number of compartements / discretisation steps";
  parameter Length Z=GeoRec.Z/slices "perpendicular to discretization direction";
  parameter Conductivity kappa=GeoRec.cond0;

equation

    i = Y * Z * j;
    v = X * j / kappa;

end OhmicOverpotential;
