within eCherry_Library.ElectrochemicalReactor.Properties.SolubilityModels.test;
model test_N2_II
  parameter Pressure p=1e5;
  parameter Temperature T=273.15;
  parameter MoleFraction x_N2=GetXN2II(   p=p,T=T);
  Concentration c_N2=x_N2*55e3;
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)),
    experiment(__Dymola_NumberOfIntervals=5, __Dymola_Algorithm="Dassl"));
end test_N2_II;
