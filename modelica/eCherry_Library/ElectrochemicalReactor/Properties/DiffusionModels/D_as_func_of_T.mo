within eCherry_Library.ElectrochemicalReactor.Properties.Diffusion;
function D_as_func_of_T

  input DiffusionCoefficient D0;
  input Temperature T "temperature";
  input Temperature T0=298.15 "temperature";
//   DynamicViscosity mu0;
//   Temperature T0 "temperature";
//   DynamicViscosity mu;
  output DiffusionCoefficient D;

algorithm

  D:=StokesEinstein_func(D0=D0,
  mu0=mu_water(T=T0),
  T0=T0,
  mu=mu_water(T=T),
  T=T);

end D_as_func_of_T;
