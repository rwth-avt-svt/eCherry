within eCherry_Library.ElectrochemicalReactor.Electrodes.Electrochemistry.Activation_Overpotential;
model ActivationOverpotentialTafel

  // Inheritance
  extends Modelica.Electrical.Analog.Interfaces.OnePort;

  // Species handling
  parameter Data.DataRecords.Species.SpeciesRecord specRec;

  // Input parameters
  parameter eCherry_Library.Data.DataRecords.ElecReaction.Reaction reac;
  input Temperature T;
  parameter Length Y;
  parameter Length Z;
  parameter Boolean CathodeEl "= true, if cathode in electrolysis mode (=anode in galvanic mode), else false";

  // Variables
  Voltage eta   "Real overpotential";
  Voltage etaRef   "Overpotential with respect to current density standard conditions";
  CurrentDensity j;
  eCherry_Library.ElectrochemicalReactor.Properties.Activity[specRec.nSpec] a;
  input Concentration c[specRec.nSpec] "in mol/m^3; to be specified in client model";
  input Pressure[specRec.nSpec] Pi "partial pressure in pascal";

equation

    // calculation of activity assuming ideal thermodynamics and constant solvent concentration
    for k in 1:specRec.nSpec loop
    if (specRec.species[k].state == Data.DataRecords.Species.State.Solid) then
        a[k] = 1;
    elseif (specRec.species[k].state == Data.DataRecords.Species.State.Gas) then
        a[k] =Pi[k]/101325 + Utility.Common.epsilon*1e3;
    elseif (specRec.species[k].state == Data.DataRecords.Species.State.LiquidSolvent) then
        a[k] = 1;
    elseif (specRec.species[k].state == Data.DataRecords.Species.State.DissolvedInLiquid) then
        a[k] =(c[k] + Utility.Common.epsilon)*1e-3;
      end if;
    end for;

    i = j * Y * Z;

    // Currently concentration-dependent term of BV/Tafel is equal to activity as assuming ideal thermodynamics
    if CathodeEl then
    j =  - reac.j0 * exp(reac.dH_app/R* (-1/T+1/298.15)) *
     exp(-reac.alpha_c * F * etaRef / R / T)*product(if Utility.get_RO(specRec.species[k], reac) < 0 then a[k]^(-Utility.get_RO(specRec.species[k], reac)) else 1 for k in 1:specRec.nSpec);
    else
    j =  reac.j0 * exp(reac.dH_app/R* (-1/T+1/298.15)) * exp(reac.alpha_a * F * etaRef / R / T)*product(if Utility.get_RO(specRec.species[k], reac) > 0 then a[k]^Utility.get_RO(specRec.species[k], reac) else 1 for k in 1:specRec.nSpec);
    end if;

    eta=etaRef+ R*T/reac.z/F*log(product(a[k]^Utility.get_nu(specRec.species[k], reac) for k in 1:specRec.nSpec));

    eta = v;

end ActivationOverpotentialTafel;
