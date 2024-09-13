within eCherry_Library.ElectrochemicalReactor.ThermalDomain.ElectrolyzerColdStart_Models;
model SpecificEnthalpyOfSpecies0D_Sakas2022
  // Part of EnergyBalance, calculates the specific enthalpy of a species at the temperature T
  input Temperature T  "Temperature in K";
  input Data.DataRecords.Species.SpeciesRecord specRec;

  parameter Temperature Tref = 298.15 "Reference temperature for calculation of enthalpy";
  constant Integer nSpec = specRec.nSpec;

 output MolarHeatCapacity cp_mol[specRec.nSpec] "Molar heat capacity of component at temperature T";
  output SpecificHeatCapacity cp[specRec.nSpec] "Specififc heat capacity of component at temperature T";
  output MolarEnthalpy cp_dT_int_mol[specRec.nSpec] "Molar heat capacity of component integrated from Tref to T";
  output SpecificEnthalpy cp_dT_int[specRec.nSpec] "Specific heat capacity of component integrated from Tref to T";
  output SpecificEnthalpy h[specRec.nSpec] "Specific enthalpy of components at temperature T";

equation
  for k in 1:nSpec loop
    cp_mol[k] = specRec.species[k].cp1 + specRec.species[k].cp2*T + specRec.species[k].cp3*T^2 +
    specRec.species[k].cp4*T^3 + specRec.species[k].cp5*T^4;

    cp[k]*specRec.species[k].M = cp_mol[k];

    cp_dT_int_mol[k]= specRec.species[k].cp1*(T-Tref) + 1/2*specRec.species[k].cp2*(T^2-Tref^2) + 1/3*specRec.species[k].cp3*(T^3-Tref^3) +
    1/4*specRec.species[k].cp4*(T^4-Tref^4) + 1/5*specRec.species[k].cp5*(T^5-Tref^5);

    cp_dT_int[k]*specRec.species[k].M = cp_dT_int_mol[k];

    h[k] = specRec.species[k].h0 + cp_dT_int[k];

  end for;
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)));
end SpecificEnthalpyOfSpecies0D_Sakas2022;
