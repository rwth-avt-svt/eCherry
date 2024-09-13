within eCherry_Library.ElectrochemicalReactor.Properties.TemperatureModels;
partial model TemperatureBase
  output Temperature T_i(start=298.15) "Temperature of the model in K";
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end TemperatureBase;
