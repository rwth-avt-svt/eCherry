within eCherry_Library.ElectrochemicalReactor.Utility.array_functions;
function logspace "inspired from pythons logspace
  like linspace but make it equidistant logarithmic steps"
  input Real logfirst "first exponent";
  input Real loglast "last exponent";
  input Integer n "how many points";
  output Real[n] result "vector of values spaced evenly on a logarithmic scale";
protected
  Real linspaceValues[n] = linspace(logfirst, loglast, n);
algorithm
  result := 10 .^ linspaceValues;
end logspace;
