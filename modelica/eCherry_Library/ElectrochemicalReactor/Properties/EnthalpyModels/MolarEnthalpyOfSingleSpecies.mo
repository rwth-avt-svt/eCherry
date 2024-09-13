within eCherry_Library.ElectrochemicalReactor.Properties.EnthalpyModels;
model MolarEnthalpyOfSingleSpecies
  // Part of EnergyBalance, calculates the molar enthalpy of a species at the temperature T
  input Temperature T  "Temperature in K";
  input Data.DataRecords.Species.Species spec;

  parameter Temperature Tref = 298.15 "Reference temperature for calculation of enthalpy";

  output MolarHeatCapacity cp "Molar heat capacity of component at temperature T";
  output MolarEnthalpy cp_dT_int "Molar heat capacity of component integrated from Tref to T";
  output MolarEnthalpy h "Molar enthalpy of components at temperature T";

equation
    cp = spec.cp1 + spec.cp2*T + spec.cp3*T^2 +
    spec.cp4*T^3 + spec.cp5*T^4;

    cp_dT_int= spec.cp1*(T-Tref) + 1/2*spec.cp2*(T^2-Tref^2) + 1/3*spec.cp3*(T^3-Tref^3) +
    1/4*spec.cp4*(T^4-Tref^4) + 1/5*spec.cp5*(T^5-Tref^5);

    h = spec.h0 + cp_dT_int;

  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)));
end MolarEnthalpyOfSingleSpecies;
