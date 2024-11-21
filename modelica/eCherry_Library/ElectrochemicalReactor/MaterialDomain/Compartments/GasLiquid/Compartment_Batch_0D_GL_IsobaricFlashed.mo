within eCherry_Library.ElectrochemicalReactor.MaterialDomain.Compartments.GasLiquid;
model Compartment_Batch_0D_GL_IsobaricFlashed
  "gas phase is leaving the 0D compartment"
  extends
    eCherry_Library.ElectrochemicalReactor.MaterialDomain.Compartments.GasLiquid.Compartment_Base;

  constant Real R = 8.314 "ideal gas constant J/molK";
  parameter Pressure P;

  // Variables
  AmountOfSubstance mol_tot_L;
  AmountOfSubstance mol_vec_G[GSpec.nSpec];
  AmountOfSubstance mol_vec_L[DSpec.nSpec+LSpec.nSpec];
  AmountOfSubstance mol_vec[GSpec.nSpec+DSpec.nSpec+LSpec.nSpec];
  MolarFlowRate molFlow_tot_out "molar gas flow leaving the compartment";
  MolarFlowRate molFlow_vec_out[GSpec.nSpec]
                                            "gaseous species molar flows leaving";
  MoleFraction yi[GSpec.nSpec];//mole fractions in V_G und V_env
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

  Connectors.Material_Simple outFlow(specRec=GSpec) annotation (Placement(
        transformation(extent={{0,100},{20,120}}), iconTransformation(extent={{
            -20,80},{20,120}})));

initial equation

  for k in DSpecA: AllSpec loop
    mol_vec[k] =mol_vec_0[k];
  end for;
  for k in 1:GSpec.nSpec loop
    yi[k] = mol_vec_0[k] / sum(mol_vec_0[i] for i in 1:GSpec.nSpec);
  end for;

equation
  rho_w = model_rho_w.rho_i;

  //calculate mol_vec[k] for k in DSpec, LSpec
  for k in DSpecA:AllSpec loop
    der(mol_vec[k]) = rightFlow.molFlow_vec[k]+ leftFlow.molFlow_vec[k];
  end for;
   //calculate mol_vec_L from mol_vec
  mol_vec_L = mol_vec[GSpec.nSpec+1:AllSpec];
  //caculate total liquid molar amount (mol_tot_L)
  mol_tot_L = sum(mol_vec_L[j] for j in 1:DSpec.nSpec+LSpec.nSpec);
  //approximate liquid volume from mass and density of pure water
  V_L = (mol_vec[AllSpec]*specRec.species[AllSpec].M)/rho_w;
  //calculate gaseous amount in compartment from gaseous volume
  P*V_G = mol_tot_G*R*T;
  //calculate molFlow_tot_out
  der(mol_tot_G) = sum(rightFlow.molFlow_vec[k]+ leftFlow.molFlow_vec[k] for k in (1):(GSpec.nSpec))+molFlow_tot_out;
  //calculate mol_vec[k] for k in GSpec
  for k in 1: GSpec.nSpec loop
    der(mol_vec[k]) = rightFlow.molFlow_vec[k] + leftFlow.molFlow_vec[k] + molFlow_vec_out[k];
  end for;
   //calculate mol_vec_G from mol_vec
  mol_vec_G = mol_vec[1:GSpec.nSpec];

  for i in 1: GSpec.nSpec loop
    yi[i] = mol_vec_G[i]/mol_tot_G;  //calculate mole fractions of gaseous phase
    yi[i] = molFlow_vec_out[i]/molFlow_tot_out;//calculate species mole flow leaving the compartment (molFlow_vec_out[i])
  end for;

  for k in 1:GSpecO loop
    c[k] = epsilon;//set concentration of gaseous species to (almost) zero
  end for;
  for k in DSpecA:AllSpec loop
    c[k] = mol_vec[k]/V_L;
  end for;
  //hand over concentrations to connectors
  for k in 1:(AllSpec) loop
    rightFlow.c[k] = c[k];
    leftFlow.c[k] = c[k];
  end for;
  //TODO: calculate molar outflow based on too much gas:
  for k in 1: GSpec.nSpec loop
    outFlow.molFlow_vec[k] = molFlow_vec_out[k];
  end for;
  annotation (Icon(coordinateSystem(preserveAspectRatio=false), graphics={
          Bitmap(extent={{-100,-100},{100,100}}, fileName=
              "modelica://eCherry_Library/../Icons/Electrolyte.png")}),
                                                                 Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end Compartment_Batch_0D_GL_IsobaricFlashed;
