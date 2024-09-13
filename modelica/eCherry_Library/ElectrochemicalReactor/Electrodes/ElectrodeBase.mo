within eCherry_Library.ElectrochemicalReactor.Electrodes;
partial model ElectrodeBase

  // Temperature model
  replaceable model TemperatureModel =
    Properties.TemperatureModels.TemperatureConstant
      annotation(choices(
    choice=Thermodynamics.TemperatureConstant
    "Constant Temperature",
    choice=Thermodynamics.TemperatureVariable
    "Variable Temperature"));
  TemperatureModel model_T;
  Temperature T "in K";
  parameter Temperature T0 = CondRec.T0;

  parameter Data.DataRecords.Species.SpeciesRecord specRec;
  parameter Data.DataRecords.Geometry GeoRec;
  parameter Data.DataRecords.Conditions CondRec;

  parameter Length Y=GeoRec.Y "in m";
  parameter Length Z=GeoRec.Z "in m";

  // Connectors
  Modelica.Electrical.Analog.Interfaces.PositivePin p annotation (Placement(
        transformation(extent={{-110,-10},{-90,10}}), iconTransformation(extent=
           {{-110,-10},{-90,10}})));
  Modelica.Electrical.Analog.Interfaces.NegativePin n annotation (Placement(
        transformation(extent={{90,-10},{110,10}}), iconTransformation(extent={{
            90,-10},{110,10}})));
  MaterialDomain.Connectors.Material_Liquid flowFromElectrolyte(specRec=specRec)
    annotation (Placement(transformation(extent={{-110,52},{-90,72}}),
        iconTransformation(extent={{-20,80},{20,120}})));

initial equation
  T=T0;
equation
  // Temperature model
  T = model_T.T_i;

  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end ElectrodeBase;
