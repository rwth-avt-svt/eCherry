within eCherry_Library.ElectrochemicalReactor.Electrolytes.Liquid;
model Electrolyte_Batch_0D_L
  "Lumped Compartment with material hold-up, diffusive connections, and Ohmic overpotential"

  extends MaterialDomain.Compartments.Liquid.Compartment_Batch_0D_L(
      mol_vec0=V_geo*c0);
  extends ElectricalDomain.Ohmic_Overpotentials.OhmicOverpotential_Electrolyte;
    parameter Concentration c0[specRec.nSpec] "initial concentration";

equation

   annotation (Icon(graphics={Bitmap(
          extent={{-100,-100},{100,100}},
          fileName="modelica://eCherry_Library/../Icons/Electrolyte.png")}));
end Electrolyte_Batch_0D_L;
