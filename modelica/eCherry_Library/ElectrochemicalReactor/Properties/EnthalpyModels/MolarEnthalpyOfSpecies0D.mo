within eCherry_Library.ElectrochemicalReactor.Properties.EnthalpyModels;
model MolarEnthalpyOfSpecies0D
  // Part of EnergyBalance, calculates the molar enthalpy of a species record at the temperature T
  input Temperature T  "Temperature in K";
  input Data.DataRecords.Species.SpeciesRecord specRec;

  parameter Temperature Tref = 298.15 "Reference temperature for calculation of enthalpy";
  constant Integer nSpec = specRec.nSpec;

  output MolarHeatCapacity cp[specRec.nSpec] "Molar heat capacity of component at temperature T";
  output MolarEnthalpy cp_dT_int[specRec.nSpec] "Molar heat capacity of component integrated from Tref to T";
  output MolarEnthalpy h[specRec.nSpec] "Molar enthalpy of components at temperature T";

equation
  for k in 1:nSpec loop
    cp[k] = specRec.species[k].cp1 + specRec.species[k].cp2*T + specRec.species[k].cp3*T^2 +
    specRec.species[k].cp4*T^3 + specRec.species[k].cp5*T^4;

    cp_dT_int[k]= specRec.species[k].cp1*(T-Tref) + 1/2*specRec.species[k].cp2*(T^2-Tref^2) + 1/3*specRec.species[k].cp3*(T^3-Tref^3) +
    1/4*specRec.species[k].cp4*(T^4-Tref^4) + 1/5*specRec.species[k].cp5*(T^5-Tref^5);

    h[k] = specRec.species[k].h0 + cp_dT_int[k];

  end for;
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)));
end MolarEnthalpyOfSpecies0D;
