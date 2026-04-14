within eCherry_Library.ElectrochemicalReactor.Properties.DensityModels;
model DensityBase
  input Temperature T  "Temperature in K";
  output Density rho_i(start=1000) "Density of the model in kg/m³";
  parameter Density rho_const=1000 "Initial value for constant density";
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end DensityBase;
