within eCherry_Library.ElectrochemicalReactor.Properties.ConductivityModels;
model ConductivityElectrolyteCalcKOHColdStart
  "Conductivity correlation for KOH"
  extends Properties.ConductivityModels.ConductivityElectrolyteBase;

  outer parameter Temperature T  "Temperature in K";
  outer parameter Data.DataRecords.Species.SpeciesRecord specRec;
  outer parameter Conductivity kappa_const;

  parameter Real alpha1 = 0.8e-4;
  parameter Real alpha2 = -0.00763e-4;

equation
  kappa_i =2*0.00475/(alpha1+alpha2*(T-273.15));

  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)),
    Documentation(info="<html>
<p>Calculation of the conductivity of the electrolyte for KOH using a correlation by Gilliam et al.. </p>
<p><br>The model takes the concentration vector, the species record, and the temperature as inputs and gives the conductivity as an output. </p>
<p><br>GILLIAM, R.; GRAYDON, J.; KIRK, D.; THORPE, S. A review of specific conductivities of potassium hydroxide solutions for various concentrations and temperatures. International Journal of Hydrogen Energy [Online] 2007, 32 (3), 359&ndash;364. https://​www.sciencedirect.com​/​science/​article/​pii/​S0360319906005428.</p>
</html>"));
end ConductivityElectrolyteCalcKOHColdStart;
