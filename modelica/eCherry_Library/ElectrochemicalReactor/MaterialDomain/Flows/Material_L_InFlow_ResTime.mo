within eCherry_Library.ElectrochemicalReactor.MaterialDomain.Flows;
model Material_L_InFlow_ResTime
  extends Material_Simple_InFlow_ResTime_Base;

  // parameters
  inner parameter Concentration c[specRec.nSpec];
  Density rho_calc "calculated density";
  parameter MolarMass M = Data.DataRecords.Species.DissolvedSpecies.KOH.M "Molar mass of KOH in kg/mol";
  parameter MolarMass M_mean = sum(c[k]/sum(c)*specRec.species[k].M for k in 1:specRec.nSpec) "mean molar mass in inflow";

  // density model
  replaceable model DensityModel =
     Properties.DensityModels.DensityKOH(T=T)
     annotation(choices(
       choice=Properties.DensityModels.DensityConstant
       "Constant density",
       choice=Properties.DensityModels.DensityWaterTdependent
       "Temperature dependent water density",
       choice=Properties.DensityModels.DensityMix
       "density mix (KOH)"));

  DensityModel model_rho;

equation
  molFlow = (V_flow*rho_calc)/M_mean "in mol/s";
  rho_calc = model_rho.rho_i;

  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end Material_L_InFlow_ResTime;
