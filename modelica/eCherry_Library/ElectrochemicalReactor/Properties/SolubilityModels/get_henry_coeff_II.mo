within eCherry_Library.ElectrochemicalReactor.Properties.SolubilityModels;
function get_henry_coeff_II
  "this should not need to exist, because of course parametrizations are slightly different"
  input Real tau;
  input HenryParameter par;
  output Real HenryCoeff(unit="Pa") "Henry's law constant in weird";
algorithm
  HenryCoeff:=  par.p  * exp( par.a  + par.b/tau +  par.c/(tau^2) + par.d/(tau^3)+par.e*log(tau));
end get_henry_coeff_II;
