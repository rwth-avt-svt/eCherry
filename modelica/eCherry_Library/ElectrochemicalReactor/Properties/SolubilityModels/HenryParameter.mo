within eCherry_Library.ElectrochemicalReactor.Properties.SolubilityModels;
record HenryParameter "parametrization with four parameters for f(T)"
    parameter Real a "empirical parameter";
    parameter Real b "empirical parameter";
    parameter Real c "empirical parameter";
    parameter Real d "empirical parameter";
    parameter Real e "empirical parameter";
    parameter Modelica.Units.SI.Pressure p "If pressure is in non Si unit";
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end HenryParameter;
