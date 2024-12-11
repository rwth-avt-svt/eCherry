within eCherry_Library.ElectrochemicalReactor.Properties.ConductivityModels;
model ConductivityElectrolyteConstant
  "Constant conductivity for the electrolyte"
  extends ConductivityElectrolyteBase;

  outer parameter Conductivity kappa_const "Constant Conductivity of electrolyte in S m-1";

equation
  kappa_i = kappa_const;

  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)),
    Documentation(info="<html>
<p>The model sets a constant conductivity of the electroylte. The constant conductivity must be provided by the user. Else, a default value of 80 S/cm is used. </p>
<p>The model is required for the replaceability  of the conductivity calculation. </p>
<p><br>The model takes the constant conductivity as input and gives the conductivity back as an output. </p>
</html>"));
end ConductivityElectrolyteConstant;
