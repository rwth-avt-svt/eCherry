within eCherry_Library.ElectrochemicalReactor.Electrodes.Electrochemistry.Activation_Overpotential;
model ActivationOverpotentialColdStart

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
  parameter Boolean CathodeEl "= true, if cathode in electrolysis mode (=anode in galvanic mode), else false";

  //outer String electrode;
  Voltage eta   "Real overpotential";

  //dummy parameters to eliminate warnings for redeclaration
  parameter Voltage etaRef=0 "Overpotential with respect to current density standard conditions";
  parameter eCherry_Library.ElectrochemicalReactor.Properties.Activity[specRec.nSpec] a = zeros(specRec.nSpec)
    "in mol/l";
  input Pressure[specRec.nSpec] Pi "partial pressure in pascal";
  input Concentration c[specRec.nSpec] "in mol/m^3; to be specified in client model";

equation

  if CathodeEl then
    10^((-2*v)/0.1795) = (2e-3+1e-5/(T-273.15)+3.5e1/(T-273.15)^2)*abs(j)+1;
  else
    10^((2*v)/0.1795) = (2e-3+1e-5/(T-273.15)+3.5e1/(T-273.15)^2)*abs(j)+1;
  end if;

    i = j * Y * Z;
    eta = v;

end ActivationOverpotentialColdStart;
