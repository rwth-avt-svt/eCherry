within eCherry_Library.ElectrochemicalReactor.Properties.Diffusion;
function mu_water
  input Temperature T "temperature";

  input Real a=0.02939;
  input Real b=507.88;
  input Real c=149.3;
  //   values taken from Viswanath & Natarajan 1989, pp. 714–715.
  // A = 0.02939 mPa·s, B = 507.88 K, and C = 149.3 K
  output DynamicViscosity mu;
algorithm
  mu:=a*exp(b/(T-c));
end mu_water;
