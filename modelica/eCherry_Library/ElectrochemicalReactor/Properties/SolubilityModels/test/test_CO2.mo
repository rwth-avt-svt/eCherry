within eCherry_Library.ElectrochemicalReactor.Properties.SolubilityModels.test;
model test_CO2
  parameter Pressure p=1e5;
  parameter Temperature T=300;
  parameter MoleFraction x_CO2=GetXCO2(  p=p,T=T);
  Concentration c_CO2=x_CO2*55e3;
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)),
    experiment(__Dymola_NumberOfIntervals=5, __Dymola_Algorithm="Dassl"));
end test_CO2;
