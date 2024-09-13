within eCherry_Library.ElectrochemicalReactor.Properties.ConductivityModels;
model ConductivityElectrolyteModel
  "Selectrion of a model to calculate the conductivity of the electrolyte"

  replaceable model ConductivityModel =
      ConductivityElectrolyteConstant
    annotation(choices(
    choice=Properties.ConductivityModels.ConductivityElectrolyteCalc_KOH
    "KOH: Calculation of Conductivity",
    choice=Properties.ConductivityModels.ConductivityElectrolyteConstant
    "Constant Conductivity"));

  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end ConductivityElectrolyteModel;
