within eCherry_Library.ElectrochemicalReactor.Properties.DensityModels;
model DensityConstant
  extends DensityBase;
equation
  rho_i = rho_const;
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end DensityConstant;
