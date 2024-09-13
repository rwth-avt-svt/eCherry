within eCherry_Library.ElectrochemicalReactor.Electrolytes.GasLiquid;
model Electrolyte_Conti_0D_GL
  "Compartment with diffusive transport in one dimension and Ohmic overpotential"

  extends MaterialDomain.Compartments.GasLiquid.Compartment_Conti_0D_GL;
  extends
    ElectricalDomain.Ohmic_Overpotentials.OhmicOverpotential_Electrolyte_GL;

   annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end Electrolyte_Conti_0D_GL;
