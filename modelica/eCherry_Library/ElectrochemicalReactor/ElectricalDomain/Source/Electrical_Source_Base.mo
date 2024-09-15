within eCherry_Library.ElectrochemicalReactor.ElectricalDomain.Source;
partial model Electrical_Source_Base
  "Both for imposed voltage and imposed current density"

  parameter Data.DataRecords.Geometry GeoRec;

  // Inheritance
  extends Modelica.Electrical.Analog.Interfaces.OnePort;

  // Input parameters
  parameter Length Y=GeoRec.Y;
  parameter Length Z=GeoRec.Z;

  // Variables
  CurrentDensity j;
  Power W "Cell power";

equation

  i = j * Y * Z;
  W = v * i;

end Electrical_Source_Base;
