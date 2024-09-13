within eCherry_Library.ElectrochemicalReactor.MaterialDomain.Compartments.Liquid;
model Compartment_Batch_0D_L_ElectrolyteMedia
//   extends Modelica.Electrical.Analog.Interfaces.TwoPin;

  import ElectrolyteMedia;
  import eCherry_Library.Data.DataRecords.Species.SpeciesRecord;
  parameter Data.DataRecords.Geometry GeoRec;

  // include ElectrolyteThermo framework
  replaceable package Medium =
      ElectrolyteMedia.Media.LiquidPhase.Common.MixtureLiquid                          annotation(choicesAllMatching=true);

  // pH model
  Medium.BaseProperties medium(Tstart = Tstart, pstart = pstart, Xredstart=Xred0);
  Temperature T;
  Pressure pressure;
  MassFraction[Medium.nX] Xred;
  Mass[Medium.nX] mred;
  parameter Temperature Tstart = Medium.T_default;
  parameter Pressure pstart = Medium.p_default;
  parameter MassFraction[Medium.nX] Xstart = Medium.reference_X;
  parameter Concentration[Medium.nF] c0 = zeros(Medium.nF);
  parameter AmountOfSubstance[Medium.nF] mol_vec0 = c0*V_geo;
  parameter Mass[Medium.nF] m_vec0 = mol_vec0.*Medium.MMX;
  parameter Mass[Medium.nX] mred0 = transpose(Medium.lambda_mass)*m_vec0;
  parameter MassFraction[Medium.nX] Xred0 = mred0/sum(mred0);
  parameter Mass m_tot0 = sum(m_vec0);
  parameter MolarMass[Medium.nF] MMX = Medium.MMX;

  // Species handling
  parameter SpeciesRecord specRec(nSpec=0) annotation(choicesAllMatching=true);

  // Input parameters
  parameter Length X=GeoRec.X "along discretization direction";
  parameter Length Y=GeoRec.Y "perpendicular to discretization direction";
  parameter Length Z=GeoRec.Z "perpendicular to discretization direction";

  // Other parameters
  parameter Volume V_geo=X*Y*Z "Volume";

  // Other parameters trial by japy
  parameter Temperature T_zero;
  parameter Pressure p_zero;
   // Variables
  Concentration c[specRec.nSpec];
  Mass m_vec[specRec.nSpec];
  Mass m_tot;

  // Connectors
  Connectors.Material_Liquid leftFlow(specRec=specRec) annotation (Placement(
        transformation(extent={{-108,50},{-88,70}}), iconTransformation(extent=
            {{-128,30},{-88,70}})));
  Connectors.Material_Liquid rightFlow(specRec=specRec) annotation (Placement(
        transformation(extent={{90,50},{110,70}}), iconTransformation(extent={{
            80,40},{120,80}})));

initial equation

  //initialize reaction invariants
  mred = mred0;

  //initialize total mass
  m_tot = m_tot0;

equation
  // Other parameters trial by japy
  T=T_zero;
  pressure=p_zero;

  // pH model inputs
  medium.T = T;
  medium.p = pressure;
  medium.X[1:Medium.nX-1] = Xred[1:Medium.nX-1];

  // Balance equations
  // reaction invariant balance
  der(mred) = transpose(Medium.lambda_mass)*(leftFlow.molFlow_vec.*specRec.species.M  + rightFlow.molFlow_vec.* specRec.species.M);

  // total mass balance
  der(m_tot) = sum(leftFlow.molFlow_vec[k]* specRec.species[k].M  + rightFlow.molFlow_vec[k]* specRec.species[k].M  for k in 1:specRec.nSpec);

  // reaction invariant mass fraction
  Xred = mred/sum(mred);

  // species mass with mass fractions from pH model
   m = medium.Xfull*m_tot;

  // Definitions
  for k in 1:specRec.nSpec loop
    c[k] * V_geo * specRec.species[k].M / 1000 = m[k];
  end for;

  // Connections
  for k in 1:specRec.nSpec loop
    c[k] = leftFlow.c[k];
    rightFlow.c[k] = leftFlow.c[k];
  end for;

end Compartment_Batch_0D_L_ElectrolyteMedia;
