within eCherry_Library.ElectrochemicalReactor.Properties.DensityModels;
model DensityGas
  "Calculation of the density of a gaseous phase using the ideal gas law"
  extends DensityBase;
  input Temperature T "Temperature in K";
  input Data.DataRecords.Species.SpeciesRecord specRec;
  constant Integer nSpec = specRec.nSpec;
  input Pressure p[nSpec] "Partial pressures of all components in Pa";
  output Density rho_i "Gas density in kg/m3";

equation
  rho_i = specRec.species.M*p/T/R;

  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end DensityGas;
