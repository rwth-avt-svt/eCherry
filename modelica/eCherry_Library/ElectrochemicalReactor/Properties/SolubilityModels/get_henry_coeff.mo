within eCherry_Library.ElectrochemicalReactor.Properties.SolubilityModels;
function get_henry_coeff
  input Temperature T;
  input HenryParameter par;
  output Real HenryCoeff(unit="Pa") "Henry's law constant in weird";
algorithm
  HenryCoeff:=  par.p  * exp( par.a  + par.b/T  +  par.c/(T^2) + par.d/(T^3));
end get_henry_coeff;
