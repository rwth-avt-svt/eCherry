within eCherry_Library.ElectrochemicalReactor.MaterialDomain.Compartments.GasLiquid;
model Compartment_Conti_0D_GL
  extends
    eCherry_Library.ElectrochemicalReactor.MaterialDomain.Compartments.GasLiquid.Compartment_Base;

  // Variables
  AmountOfSubstance mol_tot_L;
  AmountOfSubstance mol_tot;
  AmountOfSubstance mol_vec_G[GSpec.nSpec];
  AmountOfSubstance mol_vec_L[DSpec.nSpec+LSpec.nSpec];
  MolarFlowRate molFlow_tot_out "molar flow leaving the compartment";
  replaceable model DensityModel =
      Properties.DensityModels.DensityWaterTdependent(T=T)
      annotation(choices(
    choice=Properties.DensityModels.DensityConstant
    "Constant density",
    choice=Properties.DensityModels.DensityWaterTdependent
    "Temperature dependent water density"));
  DensityModel model_rho_w;
  inner Density rho_w;

// Connectors
  Connectors.Material_Liquid leftFlow(specRec=specRec) annotation (Placement(
        transformation(extent={{-108,50},{-88,70}}), iconTransformation(extent=
            {{-128,30},{-88,70}})));
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

  for k in 1: AllSpec-1 loop
  mol_vec[k] =mol_vec_0[k];
  end for;
  //mol_tot = mol_tot_0;

equation
  rho_w = model_rho_w.rho_i;

  // Mole balance
  for k in 1:AllSpec-1 loop
  der(mol_vec[k]) = inFlow.molFlow_vec[k]  + rightFlow.molFlow_vec[k] + leftFlow.molFlow_vec[k] + outFlow.molFlow_vec[k];
  end for;

  //calculate mol_vec[end] via total amount
  mol_tot=sum(mol_vec[k] for k in 1:AllSpec);

  //calculate outFlow.molFlow_vec
  for k in 1:AllSpec loop
  outFlow.molFlow_vec[k]=mol_vec[k]*molFlow_tot_out/sum(mol_vec[i] for i in 1:AllSpec);
  end for;

  //calculate total amount
  der(mol_tot) = sum(inFlow.molFlow_vec[k] + rightFlow.molFlow_vec[k] + leftFlow.molFlow_vec[k] for k in 1:AllSpec) + molFlow_tot_out;

  //approximate liquid volume from mass and density of pure water
  V_L = (mol_vec[end]*specRec.species[end].M)/rho_w;

  //calculate mol_vec_G from mol_vec
  mol_vec_G = mol_vec[1:GSpec.nSpec];
  //calculate total gaseous amount
  mol_tot_G = sum(mol_vec_G[k] for k in 1:GSpecO);
  //calculate mol_vec_L from mol_vec
  mol_vec_L = mol_vec[GSpec.nSpec+1:AllSpec];
    //caculate total liquid molar amount (mol_tot_L)
  mol_tot_L = sum(mol_vec_L[j] for j in 1:DSpec.nSpec+LSpec.nSpec);

  //calculate gaseous amount in compartment from gaseous volume
  P*V_G = mol_tot_G*R*T;

  // Communicate concentrations in compartment to diffusive connectors
  for k in 1:AllSpec loop
    c[k] = mol_vec[k]/(V_L);
    rightFlow.c[k] = c[k];
    leftFlow.c[k] = c[k];
  end for;

  annotation (Icon(coordinateSystem(preserveAspectRatio=false), graphics={
          Bitmap(extent={{-100,-100},{100,100}}, fileName=
              "modelica://eCherry_Library/../Icons/Electrolyte.png")}),
                                                                 Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end Compartment_Conti_0D_GL;
