within eCherry_Library.ElectrochemicalReactor.Properties.ConductivityModels;
model ConductivityElectrolyteGLModel
  "Selection of a model for calculating the gas phases influence on the conductivity of the electrolyte"

  extends ConductivityModels.ConductivityElectrolyteModel;

  replaceable model ConductivityModel_GL =
      ConductivityElectrolyteGLNoBubbles
    annotation(choices(
    choice=Thermodynamics.ConductivityElectrolyteGL_Bruggeman
    "Calculation of gas phase influence by Bruggeman Model",
    choice=Thermodynamics.ConductivityElectrolyteGL_NoBubbles
    "Neglection of gas phase influence"));

  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end ConductivityElectrolyteGLModel;
