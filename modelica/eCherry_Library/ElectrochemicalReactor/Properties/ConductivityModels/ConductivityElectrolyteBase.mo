within eCherry_Library.ElectrochemicalReactor.Properties.ConductivityModels;
partial model ConductivityElectrolyteBase
  output Conductivity kappa_i(start=80) "Conductivity of electrolyte in S m-1";
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end ConductivityElectrolyteBase;
