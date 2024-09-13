within eCherry_Library.ElectrochemicalReactor.Properties.EnthalpyModels;
model MolarEnthalpyOfSpecies1D
  // Part of EnergyBalance, calculates the molar enthalpy of a species record at the temperature T
  input Temperature T[nCells]  "Temperature in K";
  input Data.DataRecords.Species.SpeciesRecord specRec;

  parameter Temperature Tref = 298.15 "Reference temperature for calculation of enthalpy";
  constant Integer nSpec = specRec.nSpec;
  parameter Integer nCells = nCells;

  output MolarHeatCapacity cp[nSpec,nCells] "Molar heat capacity of component at temperature T";
  output MolarEnthalpy cp_dT_int[nSpec,nCells] "Molar heat capacity of component integrated from Tref to T";
  output MolarEnthalpy h[nSpec,nCells] "Molar enthalpy of components at temperature T";

equation

  for i in 1:nCells loop
    for k in 1:nSpec loop
      cp[k,i] = specRec.species[k].cp1 + specRec.species[k].cp2*T[i] + specRec.species[k].cp3*T[i]^2 +
      specRec.species[k].cp4*T[i]^3 + specRec.species[k].cp5*T[i]^4;

      cp_dT_int[k,i] = specRec.species[k].cp1*(T[i]-Tref) + 1/2*specRec.species[k].cp2*(T[i]^2-Tref^2) + 1/3*specRec.species[k].cp3*(T[i]^3-Tref^3) +
      1/4*specRec.species[k].cp4*(T[i]^4-Tref^4) + 1/5*specRec.species[k].cp5*(T[i]^5-Tref^5);

      h[k,i] = specRec.species[k].h0 + cp_dT_int[k,i];
    end for;
  end for;
annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)));
end MolarEnthalpyOfSpecies1D;
