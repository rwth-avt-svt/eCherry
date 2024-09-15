within eCherry_Library.ElectrochemicalReactor.ElectricalDomain.Source.Potential_Source;
model Voltage_CyclicVoltammetry "Source for cyclic voltammetry"
  // Inheritance
  extends Electrical_Source_Base;

  // Input parameters
  parameter Real Scanrate "in V/s";
  parameter Voltage Uaux "Imposed cell potential";
  parameter Voltage Ubase "Imposed cell potential";

  parameter Modelica.Units.SI.Time first = -Uaux/Scanrate;
  parameter Modelica.Units.SI.Time interval=2*Uaux/Scanrate;

  Boolean clock;
  Real x(start=1,fixed=true);

initial equation
  v = Ubase;
equation

  clock = sample(first,interval);
  when clock then
    x=-pre(x);
  end when;

  der(v) = x*Scanrate;

  annotation (experiment(StopTime=4));
end Voltage_CyclicVoltammetry;
