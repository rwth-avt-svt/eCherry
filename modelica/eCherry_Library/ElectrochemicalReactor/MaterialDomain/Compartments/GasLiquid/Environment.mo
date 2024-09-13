within eCherry_Library.ElectrochemicalReactor.MaterialDomain.Compartments.GasLiquid;
model Environment "integrating species outflow over time"

  parameter Data.DataRecords.Species.SpeciesRecord specRec(nSpec=0);
  parameter Integer AllSpec=specRec.nSpec;
  parameter Data.DataRecords.Conditions CondRec;
  parameter Temperature T;
  constant Real R = 8.314 "ideal gas constant J/molK";
  parameter Pressure P;

  parameter AmountOfSubstance mol_vec_G_0[specRec.nSpec];
  parameter AmountOfSubstance mol_tot_G_0 = sum(mol_vec_G_0[i] for i in 1:specRec.nSpec);

  AmountOfSubstance mol_tot_G;
  AmountOfSubstance mol_vec_G[specRec.nSpec];//molar amount of gaseous species
  MoleFraction y_vec[AllSpec];//mole fractions in V_G und V_env
  Mass mi[specRec.nSpec];//masses in compartment and environment

  Volume V_G "volume released to the environment";

      // Connectors
  Connectors.Material_Simple inFlow(specRec=specRec) annotation (Placement(
        transformation(extent={{0,-100},{20,-80}}), iconTransformation(extent={
            {-20,-120},{20,-80}})));

initial equation
  for k in 1:(specRec.nSpec-1) loop
   mol_vec_G[k] = mol_vec_G_0[k];
  end for;
  mol_tot_G = mol_tot_G_0;

equation
  //calculate mol_vec_G[k] for n-1 species
  for k in 1:(AllSpec-1) loop
    der(mol_vec_G[k]) = inFlow.molFlow_vec[k];
  end for;
  //calculate total amount
  der(mol_tot_G) = sum((inFlow.molFlow_vec[k]) for k in 1:AllSpec);
  //calculate mol_vec_G[specRec.nSpec] via total amount
  mol_tot_G =sum(mol_vec_G[k] for k in 1:AllSpec);

    for k in 1:AllSpec loop
    mi[k] = mol_vec_G[k]*specRec.species[k].M;
    end for;

  //mole fractions in gaseous phase
  for k in 1:specRec.nSpec loop
    y_vec[k] = mol_vec_G[k]/mol_tot_G;
  end for;

  //calculate V_env
  P*V_G = mol_tot_G*R*CondRec.Tenvironment;
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end Environment;
