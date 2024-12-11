within eCherry_Library.Data.DataRecords.Species;
record Species "Collects data about a chemical species"
  parameter String name "indentify species in loop by this name";
  parameter Modelica.Units.SI.MolarMass M "in kg/mol - ATTENTION PLS - IN KG/MOL";
  parameter Integer charge=0 "single negative charge = -1 ";
  parameter State state "aggregate state of species in the system";
  parameter Modelica.Units.SI.DiffusionCoefficient D=0
    "in m^2/s | the default value is zero";
  parameter Modelica.Units.SI.MolarEnthalpy h0=0 "in J/mol, the default value is zero, always positive";
  parameter Real cp1=75, cp2=0, cp3=0, cp4=0, cp5=0, cp6=0, cp7=0 "Coefficients for calculation the MolarHeatCapacity cp, default is that of water(75 J/molK; 4070 J/kgK)";
end Species;
