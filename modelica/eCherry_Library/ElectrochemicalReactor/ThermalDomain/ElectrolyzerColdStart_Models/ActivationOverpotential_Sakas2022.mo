within eCherry_Library.ElectrochemicalReactor.ThermalDomain.ElectrolyzerColdStart_Models;
model ActivationOverpotential_Sakas2022

  // Inheritance
  extends Modelica.Electrical.Analog.Interfaces.OnePort;

  // Species handling
  parameter Data.DataRecords.Species.SpeciesRecord specRec;

  // Input parameters
  parameter Data.DataRecords.ElecReaction.Reaction reac;
  input Temperature T;
  parameter Length Y;
  parameter Length Z;
  CurrentDensity j;

  outer String electrode;
  Concentration c[specRec.nSpec] "in mol/m^3; to be specified in client model";
  Voltage eta   "Real overpotential";

  //dummy parameters to eliminate warnings for redeclaration
  parameter Voltage etaRef=0 "Overpotential with respect to current density standard conditions";
  parameter eCherry_Library.ElectrochemicalReactor.Properties.Activity[specRec.nSpec] a = zeros(specRec.nSpec)
    "in mol/l";
    parameter Pressure[specRec.nSpec] Pi =zeros(specRec.nSpec) "partial pressure in pascal";

equation
    if (electrode == "anode") then
       10^((2*v)/0.1795) = (2e-3+1e-5/(T-273.15)+3.5e1/(T-273.15)^2)*abs(j)+1;
    elseif (electrode == "cathode") then
       10^((-2*v)/0.1795) = (2e-3+1e-5/(T-273.15)+3.5e1/(T-273.15)^2)*abs(j)+1;
    else
      j=0;
      assert(true, "electrode has to be ansode or cathode");
    end if;

    i = j * Y * Z;
    eta = v;

end ActivationOverpotential_Sakas2022;
