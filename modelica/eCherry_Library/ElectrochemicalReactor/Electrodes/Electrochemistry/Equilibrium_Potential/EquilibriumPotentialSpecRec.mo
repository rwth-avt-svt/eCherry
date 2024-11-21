within eCherry_Library.ElectrochemicalReactor.Electrodes.Electrochemistry.Equilibrium_Potential;
model EquilibriumPotentialSpecRec

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
  input Pressure[GSpec.nSpec] Pi "partial pressure in pascal";
  parameter Boolean CathodeEl "= true, if cathode in electrolysis mode (=anode in galvanic mode), else false";

  // Variables
  Voltage Eeq;
  eCherry_Library.ElectrochemicalReactor.Properties.Activity[specRec.nSpec] a
    "in mol/l";
  input Concentration c[specRec.nSpec] "in mol/m^3; to be specified in client model";

equation

  v = Eeq;

    for k in 1:GSpec.nSpec loop
    a[k] =Pi[k]/101325 + Utility.Common.epsilon*1e3;
    end for;

    for k in GSpec.nSpec+1:GSpec.nSpec+DSpec.nSpec loop
    a[k] =(c[k] + Utility.Common.epsilon)*1e-3;
    end for;

   for k in GSpec.nSpec+DSpec.nSpec+1:GSpec.nSpec+DSpec.nSpec+LSpec.nSpec loop
     a[k] = 1;
   end for;

  // Nernst equation
  Eeq = reac.Eeq0 - R*T/reac.z/F*log(product(a[k]^Utility.get_nu(specRec.species[k], reac) for k in 1:specRec.nSpec));

end EquilibriumPotentialSpecRec;
