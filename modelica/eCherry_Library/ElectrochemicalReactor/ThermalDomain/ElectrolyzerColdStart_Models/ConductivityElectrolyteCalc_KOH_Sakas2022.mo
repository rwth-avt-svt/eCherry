within eCherry_Library.ElectrochemicalReactor.ThermalDomain.ElectrolyzerColdStart_Models;
model ConductivityElectrolyteCalc_KOH_Sakas2022
  "Conductivity correlation for KOH"
  extends Properties.ConductivityModels.ConductivityElectrolyteBase;

  outer parameter Temperature T  "Temperature in K";
  outer parameter Data.DataRecords.Species.SpeciesRecord specRec;
  outer parameter Conductivity kappa_const;

  parameter Real alpha1 = 0.8e-4;
  parameter Real alpha2 = -0.00763e-4;

equation
  kappa_i =2*0.00475/(alpha1+alpha2*(T-273.15));

end ConductivityElectrolyteCalc_KOH_Sakas2022;
