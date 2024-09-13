within eCherry_Library.ElectrochemicalReactor.Properties.SolubilityModels;
function GetXCO2 "this function works and everything below!"

  input Pressure p;
  input Temperature T;
  output MoleFraction x_CO2;

protected
  HenryParameter par=List_Of_HenryParameters.henry_CO2;
algorithm
  x_CO2:=p/get_henry_coeff(T=T, par=par);
end GetXCO2;
