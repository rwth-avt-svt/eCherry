within eCherry_Library.ElectrochemicalReactor.Properties.ConductivityModels;
model ConductivityElectrolyteGLNoBubbles
  "Neglection of the influence of bubbles on the conductivity of the electrolyte"

  extends ConductivityModels.ConductivityElectrolyteBase;
  outer Conductivity kappa_L;

equation

  kappa_i = kappa_L;

  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end ConductivityElectrolyteGLNoBubbles;
