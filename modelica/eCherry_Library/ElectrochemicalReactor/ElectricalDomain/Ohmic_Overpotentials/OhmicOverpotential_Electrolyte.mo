within eCherry_Library.ElectrochemicalReactor.ElectricalDomain.Ohmic_Overpotentials;
model OhmicOverpotential_Electrolyte
  extends Modelica.Electrical.Analog.Interfaces.OnePort;
  extends
    eCherry_Library.ElectrochemicalReactor.Properties.ConductivityModels.ConductivityElectrolyteModel;

  CurrentDensity j(start=500);
  parameter Length X=GeoRec.X;
  parameter Length Y=GeoRec.Y;
  parameter Integer slices = GeoRec.slices "number of compartements / discretisation steps";
  parameter Length Z=GeoRec.Z/slices "perpendicular to discretization direction";
  Conductivity kappa;
  inner parameter Conductivity kappa_const = 80
    "constant default conductivity of electrolyte";

  ConductivityModel model_kappa;

equation

  kappa = model_kappa.kappa_i;
  i = Y * Z * j;
  v = X * j / kappa;

  annotation ();
end OhmicOverpotential_Electrolyte;
