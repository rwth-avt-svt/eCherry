within eCherry_Library.ElectrochemicalReactor.ThermalDomain.Thermal_Functions;
function ThermalConductance_Pipe
  "Function to calculate the heat transfer coefficient for the geometry of a pipe"

  // Input variables
  input CoefficientOfHeatTransfer alpha_i "Coefficient of heat transfer for inner side of pipe";
  input CoefficientOfHeatTransfer alpha_a "Coefficient of heat transfer for outer side of pipe";
  input ThermalConductivity lambda "Thermal conductivity of pipe";
  input Length X "along pipe axis";
  input Length Y "perpendicular to pipe axis";
  input Length Z "perpendicular to pipe axis";
  input Length delta "Thickness of pipe";

  // Output variables
  output ThermalConductance Cthermal;

protected
  Length ri = ((Y*Z)/Modelica.Constants.pi)^(0.5) "Inner diameter of pipe";
  Length ra = ri+delta "Outer diameter of pipe";

algorithm

  if (alpha_i>0) and (alpha_a>0) and (lambda>0) then
    Cthermal:=2*Modelica.Constants.pi*X/((1/(alpha_a*ra) + log(ra/ri)/lambda + 1/(alpha_i*ri))^(-1)/ra);
  else
    Cthermal:=0;
  end if;

end ThermalConductance_Pipe;
