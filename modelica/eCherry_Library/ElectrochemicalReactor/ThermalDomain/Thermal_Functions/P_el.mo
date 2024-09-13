within eCherry_Library.ElectrochemicalReactor.ThermalDomain.Thermal_Functions;
function P_el "electrical power due to current voltage characteristics"
  input Modelica.Units.SI.Current i;
  input Modelica.Units.SI.Voltage v;

  output Power P;

algorithm

  P := abs(v*i);
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end P_el;
