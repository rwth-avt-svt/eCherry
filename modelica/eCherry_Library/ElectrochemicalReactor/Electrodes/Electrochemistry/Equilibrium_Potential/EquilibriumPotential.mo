within eCherry_Library.ElectrochemicalReactor.Electrodes.Electrochemistry.Equilibrium_Potential;
model EquilibriumPotential

  // Inheritance
  extends Modelica.Electrical.Analog.Interfaces.OnePort;

  // Species handling
  parameter Data.DataRecords.Species.SpeciesRecord specRec;

  // Input parameters
  inner parameter eCherry_Library.Data.DataRecords.ElecReaction.Reaction reac;
  inner input Temperature T;
  input Pressure[specRec.nSpec] Pi "partial pressure in pascal";

  // Variables
  Voltage Eeq;
  inner Voltage Eeq0T;

  eCherry_Library.ElectrochemicalReactor.Properties.Activity[specRec.nSpec] a;
  Concentration c[specRec.nSpec] "in mol/m^3; to be specified in client model";

  eCherry_Library.ElectrochemicalReactor.Electrodes.Electrochemistry.Eeq0.Eeq0TConstant
    Eeq0ModelConstant if (reac.reacEeq0TModel == eCherry_Library.ElectrochemicalReactor.Electrodes.Electrochemistry.Eeq0.Eeq0Tmodel.Constant);
  eCherry_Library.ElectrochemicalReactor.Electrodes.Electrochemistry.Eeq0.Eeq0TReactionEntropy
    Eeq0ModelReactionEntropy if (reac.reacEeq0TModel == eCherry_Library.ElectrochemicalReactor.Electrodes.Electrochemistry.Eeq0.Eeq0Tmodel.ReactionEntropy);
  eCherry_Library.ElectrochemicalReactor.Electrodes.Electrochemistry.Eeq0.Eeq0TWaterElectrolysisEmpiric
    Eeq0ModelWaterElectrolysisEmpiric if (reac.reacEeq0TModel ==
    eCherry_Library.ElectrochemicalReactor.Electrodes.Electrochemistry.Eeq0.Eeq0Tmodel.WaterElectrolysisEmpiric);

equation

  v = Eeq;

  // Activities + Unit conversion
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

  // Nernst equation
  Eeq = Eeq0T - R*T/reac.z/F*log(product(a[k]^Utility.get_nu(specRec.species[k], reac) for k in 1:specRec.nSpec));

end EquilibriumPotential;
