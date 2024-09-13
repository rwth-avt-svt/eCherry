within eCherry_Library.ElectrochemicalReactor.Electrodes.Electrochemistry;
model ElectrodeReaction
  "serial connection of multiple overpotentials and connection to phase"

  // Replaceable submodel
  replaceable model ActivationOverpotentialModel =
    Electrochemistry.Activation_Overpotential.ActivationOverpotential
                                                 annotation (choices(
   choice=eCherry_Library.ElectrochemicalReactor.Electrodes.Electrochemistry.Activation_Overpotential.ActivationOverpotential
    "BV equation with concentration dependence",
    choice=eCherry_Library.ElectrochemicalReactor.Electrodes.Electrochemistry.Activation_Overpotential.ActivationOverpotentialTafelCathodic
    "Tafel approach (cathodic)",
    choice=eCherry_Library.ElectrochemicalReactor.Electrodes.Electrochemistry.Activation_Overpotential.ActivationOverpotentialTafelAnodic
    "Tafel approach (anodic)"));

  // Species handling
  parameter Data.DataRecords.Species.SpeciesRecord specRec;
  input Temperature T "in K";
  parameter Temperature T0;
  parameter Data.DataRecords.ElecReaction.Reaction reac;
  parameter Length Y "in m";
  parameter Length Z "in m";
  input Pressure[specRec.nSpec] Pi "partial pressure in pascal";

  //Anode or Cathode?
  parameter Boolean CathodeEl "= true, if cathode in electrolysis mode (=anode in galvanic mode), else false";

  // Models
  Electrochemistry.Equilibrium_Potential.EquilibriumPotential eqP(
    specRec=specRec,
    reac=reac,
    T=T,
    Pi=Pi);
  ActivationOverpotentialModel actOp(
    reac=reac,
    specRec=specRec,
    T=T,
    Y=Y,
    Z=Z,
    Pi=Pi);

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

  if CathodeEl == true then
    connect(n, actOp.p); //changed as current for cathode in electrolysis mode (=anode in galvanic mode) has to be switched
    connect(actOp.n, eqP.p);
    connect(eqP.n, p); //changed as current for cathode in electrolysis mode (=anode in galvanic mode) has to be switched
  else
    connect(p, actOp.p);
    connect(actOp.n, eqP.p);
    connect(eqP.n, n);
  end if;

  for k in 1:specRec.nSpec loop
    // Calculate production rates of species from current density and reaction stoichiometry.
    // NB: Flipping sign here according to IUPAC convention:
    //     Even though reactions are written as reduction, current is negative if reaction is actually running as reduction
    productionRate[k] = -actOp.i*Utility.get_nu(specRec.species[k], reac)/reac.z/F;

    // Molar balance: zero holdup at reaction locus (phase boundary)
    flowFromElectrolyte.molFlow_vec[k] + productionRate[k] = 0;
  end for;

  // Pass concentrations to calculate potentials
  for k in 1:specRec.nSpec loop
    flowFromElectrolyte.c[k] = eqP.c[k];
    actOp.c[k] = eqP.c[k];
  end for;
end ElectrodeReaction;
