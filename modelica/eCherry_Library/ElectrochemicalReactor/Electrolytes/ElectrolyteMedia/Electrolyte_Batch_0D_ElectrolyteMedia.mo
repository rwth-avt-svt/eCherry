within eCherry_Library.ElectrochemicalReactor.Electrolytes.ElectrolyteMedia;
model Electrolyte_Batch_0D_ElectrolyteMedia
  "Lumped Compartment with material hold-up, diffusive connections, and Ohmic overpotential"

extends
    eCherry_Library.ElectrochemicalReactor.MaterialDomain.Compartments.Liquid.Compartment_Batch_0D_L_ElectrolyteMedia;
  extends ElectricalDomain.Ohmic_Overpotentials.OhmicOverpotential;

       annotation (Icon(coordinateSystem(preserveAspectRatio=false), graphics={
          Bitmap(extent={{-102,-100},{104,102}}, fileName=
              "modelica://eCherry_Library/../Icons/Electrolyte.png")}),
                                                                  Diagram(
        coordinateSystem(preserveAspectRatio=false)));

end Electrolyte_Batch_0D_ElectrolyteMedia;
