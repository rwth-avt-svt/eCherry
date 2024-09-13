within eCherry_Library.ElectrochemicalReactor.Properties.Diffusion;
partial model StokesEinstein
  "Temperature Correction of Diffusion Coeffiicients based on the Stokes-Einstein equation"
  parameter DiffusionCoefficient D0;
  parameter DynamicViscosity mu0;
  parameter Temperature T0 "temperature";

  DiffusionCoefficient D;
  DynamicViscosity mu;
  Temperature T "temperature";
  //     parameter DiffusionCoefficient[specRec.nSpec] D0;
equation

  D=D0* mu0 / mu  * T/T0;
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end StokesEinstein;
