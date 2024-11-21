within eCherry_Library.ElectrochemicalReactor.Electrodes.Electrochemistry.Equilibrium_Potential;
model EquilibriumPotentialColdStart

  // Inheritance
  extends Modelica.Electrical.Analog.Interfaces.OnePort;

  // Species handling
  parameter Data.DataRecords.Species.SpeciesRecord specRec;

  // Input parameters
  inner parameter eCherry_Library.Data.DataRecords.ElecReaction.Reaction reac;
  inner input Temperature T;
  input Pressure[specRec.nSpec] Pi "partial pressure in pascal";
  parameter Pressure Pauxilary=16;
  Pressure PvKOH;
  Pressure PvH2O;
  Real aKOH;
  Real bKOH;
  parameter Real M = 5.941177589;
  Real aH2OKOH;
  parameter Boolean CathodeEl "= true, if cathode in electrolysis mode (=anode in galvanic mode), else false";

  // Variables
  Voltage Eeq;
  inner Voltage Eeq0T;

  eCherry_Library.ElectrochemicalReactor.Properties.Activity[specRec.nSpec] a = ones(specRec.nSpec);
  input Concentration c[specRec.nSpec] "in mol/m^3; to be specified in client model";

  eCherry_Library.ElectrochemicalReactor.Electrodes.Electrochemistry.Eeq0.Eeq0TConstant
    Eeq0ModelConstant if (reac.reacEeq0TModel == eCherry_Library.ElectrochemicalReactor.Electrodes.Electrochemistry.Eeq0.Eeq0Tmodel.Constant);
  eCherry_Library.ElectrochemicalReactor.Electrodes.Electrochemistry.Eeq0.Eeq0TReactionEntropy
    Eeq0ModelReactionEntropy if (reac.reacEeq0TModel == eCherry_Library.ElectrochemicalReactor.Electrodes.Electrochemistry.Eeq0.Eeq0Tmodel.ReactionEntropy);
  eCherry_Library.ElectrochemicalReactor.Electrodes.Electrochemistry.Eeq0.Eeq0TWaterElectrolysisEmpiric
    Eeq0ModelWaterElectrolysisEmpiric if (reac.reacEeq0TModel ==
    eCherry_Library.ElectrochemicalReactor.Electrodes.Electrochemistry.Eeq0.Eeq0Tmodel.WaterElectrolysisEmpiric);
  eCherry_Library.ElectrochemicalReactor.Electrodes.Electrochemistry.Eeq0.Eeq0TWaterElectrolysisEmpiricColdStart
    Eeq0ModelWaterElectrolysisEmpiricColdStart if (reac.reacEeq0TModel ==
    eCherry_Library.ElectrochemicalReactor.Electrodes.Electrochemistry.Eeq0.Eeq0Tmodel.WaterElectrolysisEmpiricColdStart);

equation

  v = Eeq;

  PvH2O = 10^(5.1962-1730.63/(233.426+T-273.15));
  PvKOH = exp(2.302*aKOH+bKOH*log(PvH2O));
  aKOH = -0.0151*M-1.6788e-3*M^2+2.2588e-5*M^3;
  bKOH = 1-1.2062e-3*M+5.6024e-4*M^2-7.8228e-6*M^3;
  aH2OKOH = exp(-0.05192*M+0.003302*M^2+(3.177*M-2.131*M^2)/T);

  if CathodeEl then
    Eeq = -0.5*(Eeq0T + R*T/reac.z/F*log((Pauxilary-PvKOH)*(Pauxilary-PvKOH)^0.5/aH2OKOH));
  else
    Eeq = 0.5*(Eeq0T + R*T/reac.z/F*log((Pauxilary-PvKOH)*(Pauxilary-PvKOH)^0.5/aH2OKOH));
  end if;

end EquilibriumPotentialColdStart;
