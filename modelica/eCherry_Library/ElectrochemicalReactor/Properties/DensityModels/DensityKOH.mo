within eCherry_Library.ElectrochemicalReactor.Properties.DensityModels;
model DensityKOH
  extends DensityBase;
  outer parameter Data.DataRecords.Species.SpeciesRecord specRec;
  constant Integer nSpec = specRec.nSpec;
  outer Concentration c[nSpec];

  // Auxillary variables
  Real w_temp[nSpec];
  Real w_Electrolyte;
  Real c0;
  Real c1;
  Real c2;
  Real c3;
  Real c4;
  Real t;
  Real v_app;

  // Auxillary models
  replaceable model DensityModel =
      Properties.DensityModels.DensityWaterTdependent(T=T)
      annotation(choices(
    choice=Properties.DensityModels.DensityWaterTdependent
    "Temperature dependent water density"));
  DensityModel model_rho_w;
  Density rho_w;                                                                                     //nSpec=nSpec,

equation

  for it in 1:nSpec loop
    if specRec.species[it].name == "Kp" or specRec.species[it].name == "KOH" then
      w_temp[it] = c[it]*specRec.species[it].M / (c*specRec.species.M);
    else
      w_temp[it] = 0;
    end if;
  end for;
  w_Electrolyte = max(w_temp);

  rho_w = model_rho_w.rho_i;
  // Correlation from Laliberte, J. Chem. Eng. Data 2004, 49, 1141-1151
  t =T - 273.15;
  c0 =194.85;
  c1 =407.31;
  c2 =0.14542;
  c3 =0.00204;
  c4 =1180.9;
  v_app =(w_Electrolyte + c2 + c3*t)/((c0*w_Electrolyte + c1)*exp(1e-6*(t +
    c4)^2));
  rho_i =1/((1 - w_Electrolyte)/rho_w + w_Electrolyte*v_app);

  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)),
    Documentation(info="<html>
<p>Calculation of the density of an electrolyte mixture. The calculation considers the influence of the solvent (water) and the solute. A correlation given by Lalibert&eacute;, M., Cooper, E., J. Chem. Eng. Data 49 (5), S. 1141-1151, <a href=\"https://doi.org/10.1021/je0498659\">https://doi.org/10.1021/je0498659</a> is implemented. </p>
<p>Up to date, the correlation for KOH is implemented. However, the model can be extended to further electrolyte systems given in the paper. </p>
</html>"));
end DensityKOH;
