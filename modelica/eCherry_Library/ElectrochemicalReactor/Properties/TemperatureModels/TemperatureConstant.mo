within eCherry_Library.ElectrochemicalReactor.Properties.TemperatureModels;
model TemperatureConstant "Constant temperature for the model"
  extends TemperatureBase;

equation

  der(T_i) = 0;
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end TemperatureConstant;
