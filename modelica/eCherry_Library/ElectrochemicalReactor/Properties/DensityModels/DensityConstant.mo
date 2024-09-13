within eCherry_Library.ElectrochemicalReactor.Properties.DensityModels;
model DensityConstant
  parameter Density rho_const=1000 "Initial value for constant density";
  output Density rho;
equation
  rho = rho_const;
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end DensityConstant;
