within eCherry_Library.ElectrochemicalReactor.Properties.DensityModels;
model DensityConstant
  extends DensityBase;
  input Temperature T  "Temperature in K";
  parameter Density rho_const=1000 "Initial value for constant density";
  output Density rho_i(start=1000);
equation
  rho_i = rho_const;
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end DensityConstant;
