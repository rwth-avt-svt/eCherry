within eCherry_Library.ElectrochemicalReactor.Properties.SolubilityModels;
function GetXN2II
  input Pressure p;
  input Temperature T;
  output MoleFraction x_N2;
protected
  HenryParameter par=List_Of_HenryParameters.henry_N2_weird;
  Real tau=T/100;
algorithm
  x_N2:=get_henry_coeff_II(tau=tau, par=par);
end GetXN2II;
