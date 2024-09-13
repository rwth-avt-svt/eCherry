within eCherry_Library.ElectrochemicalReactor.Properties.UnitConversionModels;
model MassFraction
  "Calculation of the mass fraction of a component using the concentrations and molar masses for the density calculation"
  input Data.DataRecords.Species.SpeciesRecord specRec;
  constant Integer nSpec = specRec.nSpec;
  input String Component "Component to calculate the mass fraction";
  input Concentration c[nSpec]  "Concentrations of the species";
  output Real w_i "Mass fractions of the component";
  Real w_temp[nSpec]  "Number of Component of interest in specRec";

equation
  for it in 1:nSpec loop
    if specRec.species[it].name == Component then
      w_temp[it] = c[it]*specRec.species[it].M / (c*specRec.species.M);
    else
      w_temp[it] = 0;
    end if;
  end for;
  w_i = max(w_temp);

  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)),
    Documentation(info="<html>
<p>Calculation of the mass fraction of a singe component using the concentrations of all components. </p>
</html>"));
end MassFraction;
