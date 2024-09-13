within eCherry_Library.ElectrochemicalReactor.ElectricalDomain.Ohmic_Overpotentials;
model OhmicOverpotential_Electrolyte_GL
  "Calculation of the ohmic overpotential of a gas-liquid electrolyte"
  extends Modelica.Electrical.Analog.Interfaces.OnePort;
  extends
    eCherry_Library.ElectrochemicalReactor.Properties.ConductivityModels.ConductivityElectrolyteGLModel;

  CurrentDensity j(start=500);
  parameter Length X=GeoRec.X;
  parameter Length Y=GeoRec.Y;
  parameter Length Z=GeoRec.Z;
  Conductivity kappa;
  inner Conductivity kappa_L;
  inner parameter Conductivity kappa_const = 80
    "constant default conductivity of electrolyte";

  ConductivityModel model_kappa;
  ConductivityModel_GL model_kappa_GL;

equation

  kappa_L = model_kappa.kappa_i;
  kappa = model_kappa_GL.kappa_i;
  i = Y * Z * j;
  v = X * j / kappa;

  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end OhmicOverpotential_Electrolyte_GL;
