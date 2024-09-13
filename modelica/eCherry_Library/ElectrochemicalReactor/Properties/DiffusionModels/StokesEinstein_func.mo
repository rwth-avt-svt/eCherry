within eCherry_Library.ElectrochemicalReactor.Properties.Diffusion;
function StokesEinstein_func

  input DiffusionCoefficient D0;
  input DynamicViscosity mu0;
  input Temperature T0 "temperature";
  input DynamicViscosity mu;
  input Temperature T "temperature";

  output DiffusionCoefficient D;

algorithm

  D:=D0*mu0/mu*T/T0;

end StokesEinstein_func;
