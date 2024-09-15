within eCherry_Library.ElectrochemicalReactor.ElectricalDomain.Source.Potential_Source;
model Voltage_LinearSweepVoltammetry "Source for linear sweep voltammetry"
  // Inheritance
  extends Electrical_Source_Base;

  // Input parameters
  parameter Real tAux "in s";
  parameter Voltage Uaux "Imposed cell potential";
  parameter Voltage Ubase "Imposed cell potential";

  // time state
  Real t(start=0);
equation
  der(t) = 1;
  v = t/tAux*Uaux + Ubase;

  annotation (experiment(StopTime=4));
end Voltage_LinearSweepVoltammetry;
