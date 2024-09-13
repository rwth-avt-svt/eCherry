within eCherry_Library.ElectrochemicalReactor.Properties.Diffusion;
partial model StokesEinstein_vectorized
  "Temperature Correction of Diffusion Coeffiicients based on the Stokes-Einstein equation"
  Integer n "amount of species";

  parameter DiffusionCoefficient [n] D0;
  parameter DynamicViscosity [n] mu0;
  parameter Temperature T0 "temperature";

  DiffusionCoefficient [n] D;
  DynamicViscosity [n] mu;
  Temperature T "temperature";
  //     parameter DiffusionCoefficient[specRec.nSpec] D0;
equation

  D=D0 .* mu0 ./ mu  * T/T0
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)));

end StokesEinstein_vectorized;
