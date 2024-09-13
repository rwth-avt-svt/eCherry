within eCherry_Library.ElectrochemicalReactor.Properties.ConductivityModels;
model ConductivityElectrolyteGLBruggeman
  "Calculationof the bubble influence using the Bruggeman model depending on the gas volume fraction"

  extends ConductivityModels.ConductivityElectrolyteBase;
  outer Conductivity kappa_L;
  outer Real G_frac;
  Real k_frac;

equation

  k_frac = (1-G_frac)^(1.5);
  kappa_i = kappa_L * k_frac;

  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end ConductivityElectrolyteGLBruggeman;
