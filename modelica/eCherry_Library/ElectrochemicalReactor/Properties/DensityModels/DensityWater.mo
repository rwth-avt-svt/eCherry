within eCherry_Library.ElectrochemicalReactor.Properties.DensityModels;
model DensityWater
  input Temperature T  "Temperature in K";
  output Density rho_w  "Density water at given temperature";
  parameter Real c0 = 251.828518;
  parameter Real c1 = 6.602101093;
  parameter Real c2 = -0.0183045;
  parameter Real c3 = 1.52397*1e-5;

equation
  rho_w = c0 + c1*T + c2*T^2 + c3*T^3;
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)),
    Documentation(info="<html>
<p>Calculation of the density of pure water. The density curve was fitted to data from <a href=\"https://webbook.nist.gov/\">https://webbook.nist.gov/</a></p>
</html>"));
end DensityWater;
