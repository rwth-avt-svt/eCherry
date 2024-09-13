within eCherry_Library.ElectrochemicalReactor.ThermalDomain.ElectrolyzerColdStart_Models;
model AnodeReaction_Sakas2022
  "serial connection of multiple overpotentials and connection to phase"

  // Replaceable submodel
  replaceable model ActivationOverpotentialModel =
    Electrodes.Electrochemistry.Activation_Overpotential.ActivationOverpotential
                                                annotation (choices(
   choice=EquivalentCircuit.ActivationOverpotential
    "BV equation with concentration dependence",
   choice=EquivalentCircuit.ActivationOverpotentialSimple
    "BV implementation based on Bree et al., Careful: Concentration dependence of exchange current density neglected!",
    choice=EquivalentCircuit.ActivationOverpotentialTafel
    "Tafel approach"));

  // Species handling
  parameter Data.DataRecords.Species.SpeciesRecord specRec;
  input Temperature T "in K";
  parameter Temperature T0;
  parameter Data.DataRecords.ElecReaction.Reaction reac;
  parameter Length Y "in m";
  parameter Length Z "in m";
  parameter Pressure[specRec.nSpec] Pi "partial pressure in pascal";

  input Pressure P;
  inner String electrode= "anode";

  // Models
  EquilibriumPotential_Sakas2022 eqP(
    specRec=specRec,
    reac=reac,
    T=T,
    P=P,
    Pi=Pi);
  ActivationOverpotentialModel actOp(
    reac=reac,
    specRec=specRec,
    T=T,
    Y=Y,
    Z=Z);

  // Connectors (phase)
  MaterialDomain.Connectors.Material_Liquid flowFromElectrolyte(specRec=specRec)
    annotation (Placement(transformation(extent={{-110,52},{-90,72}}),
        iconTransformation(extent={{-20,80},{20,120}})));

  // Variables
  MolarFlowRate[specRec.nSpec] productionRate "Molar rate produced (>0) or consumed (<0) by reaction";

  Modelica.Electrical.Analog.Interfaces.PositivePin p annotation (Placement(
        transformation(extent={{-110,-10},{-90,10}}), iconTransformation(extent=
           {{-110,-10},{-90,10}})));
  Modelica.Electrical.Analog.Interfaces.NegativePin n annotation (Placement(
        transformation(extent={{90,-10},{110,10}}), iconTransformation(extent={{
            90,-10},{110,10}})));

equation

  // Connections (circuit)
  connect(p, actOp.p);
  connect(actOp.n, eqP.p);
  connect(eqP.n, n);

  for k in 1:specRec.nSpec loop
    // Calculate production rates of species from current density and reaction stoichiometry.
    productionRate[k] = -actOp.i*Utility.get_nu(specRec.species[k], reac)/reac.z/F;

    // Molar balance: zero holdup at reaction locus (phase boundary)
    flowFromElectrolyte.molFlow_vec[k] + productionRate[k] = 0;
  end for;

  // Pass concentrations to calculate potentials
  for k in 1:specRec.nSpec loop
    flowFromElectrolyte.c[k] = eqP.c[k];
    actOp.c[k] = eqP.c[k];
  end for;
end AnodeReaction_Sakas2022;
