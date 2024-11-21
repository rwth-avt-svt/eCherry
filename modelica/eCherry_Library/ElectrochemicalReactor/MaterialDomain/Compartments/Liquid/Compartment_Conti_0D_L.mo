within eCherry_Library.ElectrochemicalReactor.MaterialDomain.Compartments.Liquid;
model Compartment_Conti_0D_L
  "A compartment with constant volume flow rate, material hold-up, and diffusive connections"

  // Input parameters

  extends Compartment_Base(V_geo=X*Y*Z);
  parameter Integer aux=0;
  replaceable model DensityModel =
      Properties.DensityModels.DensityWaterTdependent(T=T)
      annotation(choices(
    choice=Properties.DensityModels.DensityConstant
    "Constant density",
    choice=Properties.DensityModels.DensityWaterTdependent
    "Temperature dependent water density"));
  DensityModel model_rho_w;
  inner Density rho_w;

  // Variables
  AmountOfSubstance mol_tot; // total amount of species in the compartment
  // Connectors
  Connectors.Material_Liquid leftFlow(specRec=specRec) annotation (Placement(
        transformation(extent={{-90,50},{-110,70}}), iconTransformation(extent=
            {{-120,40},{-80,80}})));
  Connectors.Material_Liquid rightFlow(specRec=specRec) annotation (Placement(
        transformation(extent={{90,50},{110,70}}), iconTransformation(extent={{
            80,40},{120,80}})));

  Connectors.Material_Simple inFlow(specRec=specRec) annotation (Placement(
        transformation(extent={{0,-100},{20,-80}}), iconTransformation(extent={
            {-20,-120},{20,-80}})));
  Connectors.Material_Simple outFlow(specRec=specRec) annotation (Placement(
        transformation(extent={{0,100},{20,120}}), iconTransformation(extent={{
            -20,80},{20,120}})));

initial equation
    //mol_vec = mol_vec0;
  for k in 1: specRec.nSpec-1 loop
  mol_vec[k] =mol_vec0[k];
  end for;

equation
  rho_w = model_rho_w.rho_i;
  c=mol_vec/V_geo;
  V_geo=mol_vec[end]*specRec.species[end].M/rho_w; // use just water

  for k in 1:specRec.nSpec-1 loop
    // Mole balance for species k
    der(mol_vec[k]) = rightFlow.molFlow_vec[k] + leftFlow.molFlow_vec[k]+inFlow.molFlow_vec[k]+outFlow.molFlow_vec[k];
     //Outflow has same substance amount fractions as electrolyte
     outFlow.molFlow_vec[k]/sum(outFlow.molFlow_vec[i] for i in 1:specRec.nSpec) =  mol_vec[k]/sum( mol_vec[i] for i in 1:specRec.nSpec);
  end for;
  //Total mole balance
  der(mol_tot) = sum(leftFlow.molFlow_vec[i] for i in 1:specRec.nSpec) + sum(rightFlow.molFlow_vec[i] for i in 1:specRec.nSpec)+ sum(inFlow.molFlow_vec[i] for i in 1:specRec.nSpec)+ sum(outFlow.molFlow_vec[i] for i in 1:specRec.nSpec);
  mol_tot=sum(mol_vec[i] for i in 1:specRec.nSpec);
 // Communicate concentrations in compartment to diffusive connectors
  for k in 1:specRec.nSpec loop
    rightFlow.c[k] = c[k];
    leftFlow.c[k] = c[k];
  end for;

end Compartment_Conti_0D_L;
