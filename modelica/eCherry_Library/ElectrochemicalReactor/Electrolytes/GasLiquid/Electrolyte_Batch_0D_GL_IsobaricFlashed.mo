within eCherry_Library.ElectrochemicalReactor.Electrolytes.GasLiquid;
model Electrolyte_Batch_0D_GL_IsobaricFlashed
  "Compartment with diffusive transport in one dimension and Ohmic overpotential"

  extends
    MaterialDomain.Compartments.GasLiquid.Compartment_Batch_0D_GL_IsobaricFlashed;
  extends
    ElectricalDomain.Ohmic_Overpotentials.OhmicOverpotential_Electrolyte_GL;
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end Electrolyte_Batch_0D_GL_IsobaricFlashed;
