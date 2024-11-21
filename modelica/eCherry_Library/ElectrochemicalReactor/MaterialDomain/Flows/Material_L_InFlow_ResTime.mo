within eCherry_Library.ElectrochemicalReactor.MaterialDomain.Flows;
model Material_L_InFlow_ResTime
  extends Material_Simple_InFlow_ResTime_Base;

  // parameters
  parameter MolarMass M = 0.021762 "(KOH = 0.021762) in kg/mol";
  parameter Density rho = 1224.84 "(KOH = 1224.84) in kg/m^3, for 333,15K, density is a function of temperature and concentration!";
  Density rho_calc "calculated density";
  parameter Temperature T = CondRec.T0 "Temperature of the input flow";

  // density model
  ElectrochemicalReactor.Properties.DensityModels.DensityConstant density(
     each T=T);

equation

  // to do: update density function for KOH and calculate molar flow with that
  molFlow_vec = (V_flow*rho)/M "in mol/s";
  rho_calc = density.rho_i;

  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end Material_L_InFlow_ResTime;
