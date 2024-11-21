within eCherry_Library.ElectrochemicalReactor.Electrodes.Electrochemistry;
model ElectrodeReaction_GasDiffusion
  "electrode reaction with one connection to the electrolyte and one to the gas channel"
  extends ElectrodeReaction_Base;

  // input parameters
  parameter Real splitFactor "quotient of H2 flow in electrolyte versus in gas channel";

  // variables
  Real[specRec.nSpec] prodRatePerArea "production rate per area in mol/s/m^2, for simulation data";

 // connectors
  MaterialDomain.Connectors.Material_Gas flowFromGas(specRec=specRec)
    annotation (Placement(transformation(extent={{90,52},{110,72}})));
  MaterialDomain.Connectors.Material_Liquid flowFromElectrolyte(specRec=specRec)
    annotation (Placement(transformation(extent={{-110,50},{-90,70}})));

equation

  // for simulation data
  prodRatePerArea = productionRate / (Y*Z);

  for k in 1:specRec.nSpec loop

    if (specRec.species[k].name == "Hydrogen") then
      //flowFromGas.molFlow_vec[k] + (1 - splitFactor) * productionRate[k] = 0;
      //flowFromElectrolyte.molFlow_vec[k] + splitFactor * productionRate[k] = 0;
      flowFromGas.molFlow_vec[k] + productionRate[k] = 0; // H2 only to NitrogenChannel
      flowFromElectrolyte.molFlow_vec[k] = 0;
    elseif (specRec.species[k].name == "Nitrogen") then
      flowFromGas.molFlow_vec[k] + productionRate[k] = 0; // N2 only from NitrogenChannel
      flowFromElectrolyte.molFlow_vec[k] = 0;
    else
      flowFromElectrolyte.molFlow_vec[k] + productionRate[k] = 0; // rest of species from and to electrolyte
      flowFromGas.molFlow_vec[k] = 0;
    end if;

  end for;

  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end ElectrodeReaction_GasDiffusion;
