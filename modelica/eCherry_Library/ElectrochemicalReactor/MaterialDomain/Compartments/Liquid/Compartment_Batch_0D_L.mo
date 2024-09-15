within eCherry_Library.ElectrochemicalReactor.MaterialDomain.Compartments.Liquid;
model Compartment_Batch_0D_L
  "A compartment with constant volume flow rate, material hold-up, and diffusive connections"

  // Input parameters

  extends Compartment_Base(V_geo=X*Y*Z);
  parameter Integer aux=0;

  // Variables
  AmountOfSubstance mol_tot; // total amount of species in the compartment
  // Connectors
  Connectors.Material_Liquid leftFlow(specRec=specRec) annotation (Placement(
        transformation(extent={{-90,50},{-110,70}}), iconTransformation(extent=
            {{-120,40},{-80,80}})));
  Connectors.Material_Liquid rightFlow(specRec=specRec) annotation (Placement(
        transformation(extent={{90,50},{110,70}}), iconTransformation(extent={{
            80,40},{120,80}})));

initial equation
    mol_vec = mol_vec0;

equation
  c=mol_vec/V_geo;

  for k in 1:specRec.nSpec-1 loop
    // Mole balance
    der(mol_vec[k]) = rightFlow.molFlow_vec[k] + leftFlow.molFlow_vec[k];
  end for;

  der(mol_tot) = sum(leftFlow.molFlow_vec[i] for i in 1:specRec.nSpec) + sum(rightFlow.molFlow_vec[i] for i in 1:specRec.nSpec);
  mol_tot=sum(mol_vec[i] for i in 1:specRec.nSpec);
  for k in 1:specRec.nSpec loop
    rightFlow.c[k] = c[k];
    leftFlow.c[k] = c[k];
  end for;

end Compartment_Batch_0D_L;
