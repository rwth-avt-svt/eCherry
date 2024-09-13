within eCherry_Library.ElectrochemicalReactor.Electrodes.Electrochemistry.Activation_Overpotential;
model ActivationOverpotentialSpecRec

  // Inheritance
  extends Modelica.Electrical.Analog.Interfaces.OnePort;

  // Species handling
  parameter Data.DataRecords.Species.SpeciesRecord specRec;
  parameter Data.DataRecords.Species.SpeciesRecord GSpec;
  parameter Data.DataRecords.Species.SpeciesRecord DSpec;
  parameter Data.DataRecords.Species.SpeciesRecord LSpec;

  // Input parameters
  parameter eCherry_Library.Data.DataRecords.ElecReaction.Reaction reac;
  input Temperature T;
  parameter Length Y;
  parameter Length Z;

  // Variables
  Voltage eta   "Real overpotential";
  Voltage etaRef   "Overpotential with respect to current density standard conditions";
  CurrentDensity j;
  eCherry_Library.ElectrochemicalReactor.Properties.Activity[specRec.nSpec] a
    "in mol/l";
  Concentration c[specRec.nSpec] "in mol/m^3; to be specified in client model";
  input Pressure[GSpec.nSpec] Pi "partial pressure in pascal";

equation

    // Activities + Unit conversion
   for k in 1:GSpec.nSpec loop
     a[k] =Pi[k]/101325 + Utility.Common.epsilon*1e3;
   end for;

   for k in GSpec.nSpec+1:GSpec.nSpec+DSpec.nSpec loop
     a[k] =(c[k] + Utility.Common.epsilon)*1e-3;
   end for;

   for k in GSpec.nSpec+DSpec.nSpec+1:GSpec.nSpec+DSpec.nSpec+LSpec.nSpec loop
     a[k] = 1;
   end for;

    i = j * Y * Z;

    // Butler-Volmer Equation: using actual voltage v, which can be negative or positive for reductive or anodic reactions, respectively
    j =  reac.j0 * exp(reac.dH_app/R* (-1/T+1/298.15)) * (exp(reac.alpha_a * F * etaRef / R / T)*product(if Utility.get_RO(specRec.species[k], reac) > 0 then a[k]^Utility.get_RO(specRec.species[k], reac) else 1 for k in 1:specRec.nSpec)  -
     exp(-reac.alpha_c * F * etaRef / R / T)*product(if Utility.get_RO(specRec.species[k], reac) < 0 then a[k]^(-Utility.get_RO(specRec.species[k], reac)) else 1 for k in 1:specRec.nSpec));

    eta=etaRef+ R*T/reac.z/F*log(product(a[k]^Utility.get_nu(specRec.species[k], reac) for k in 1:specRec.nSpec));

    eta = v;

end ActivationOverpotentialSpecRec;
