within eCherry_Library.ElectrochemicalReactor.MaterialDomain.Compartments.GasLiquid;
model Compartment_Batch_0D_GL_NonIsobaric
  "A compartment with diffusive connectors for reactions at electrodes and material hold-up"
  extends
    eCherry_Library.ElectrochemicalReactor.MaterialDomain.Compartments.GasLiquid.Compartment_Base;

  parameter AmountOfSubstance mol_tot_0 = sum(mol_vec_0[i] for i in 1:specRec.nSpec);

  // Variables

  Mass mi[AllSpec];
  AmountOfSubstance mol_tot;
  Pressure P;
  Properties.DensityModels.DensityWater calc_rho_W(T=T);
  MoleFraction yi[GSpec.nSpec];//mole fractions in V_G und V_env
  AmountOfSubstance mol_vec_G[GSpec.nSpec];//molar amount of gaseous species
  // Connectors
  Connectors.Material_Liquid leftFlow(specRec=specRec) annotation (Placement(
        transformation(extent={{-108,50},{-88,70}}), iconTransformation(extent=
            {{-128,30},{-88,70}})));
  Connectors.Material_Liquid rightFlow(specRec=specRec) annotation (Placement(
        transformation(extent={{90,50},{110,70}}), iconTransformation(extent={{
            80,40},{120,80}})));

initial equation
  for k in 1:(AllSpec-1) loop
   mol_vec[k] = mol_vec_0[k];
  end for;
  mol_tot = mol_tot_0;
equation

  //calculate mol_vec[k] for n-1 species
  for k in 1:(AllSpec-1) loop
    der(mol_vec[k]) = rightFlow.molFlow_vec[k]+ leftFlow.molFlow_vec[k];
  end for;
   //calculate total amount
  der(mol_tot) = sum((rightFlow.molFlow_vec[k] + leftFlow.molFlow_vec[k]) for k in 1:AllSpec);
  //calculate mol_vec[specRec.nSpec] via total amount
  mol_tot =sum(mol_vec[k] for k in 1:AllSpec);
  //calculate total gaseous amount
  mol_tot_G = sum(mol_vec[k] for k in 1:GSpecO);

    for k in 1:specRec.nSpec loop
    mi[k] = mol_vec[k]*specRec.species[k].M;
    end for;
    //calculate gas mole fractions
   for k in 1:GSpec.nSpec-1 loop
    yi[k] = mol_vec_G[k]/mol_tot_G;
   end for;
   1 = sum(yi[k] for k in 1:GSpec.nSpec);

  //approximate liquid volume from mass and density of pure water
  V_L = mi[specRec.nSpec]/calc_rho_W.rho_w;

  //calculate pressure from ideal gas law
  P = mol_tot_G*R*T/V_G;

  mol_vec_G = mol_vec[1:GSpecO];

  for k in 1:(specRec.nSpec) loop
    c[k] = mi[k]/(specRec.species[k].M*V_L);

    rightFlow.c[k] = c[k];//sum(c[i]*specRec.species[i].M for i in 1:specRec.nSpec)*(mi[k]/mtot)/specRec.species[k].M;
    leftFlow.c[k] = c[k];//sum(c[i]*specRec.species[i].M for i in 1:specRec.nSpec)*(mi[k]/mtot)/specRec.species[k].M;
  end for;

  annotation (Icon(graphics={Bitmap(extent={{-100,-100},{100,100}}, fileName=
              "modelica://eCherry_Library/../Icons/Electrolyte.png")}));
end Compartment_Batch_0D_GL_NonIsobaric;
