within eCherry_Library.ElectrochemicalReactor.Separators;
partial model MembraneBase
  extends ElectricalDomain.Ohmic_Overpotentials.OhmicOverpotential(X=GeoRec.X_membrane);

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
  parameter Temperature T0=CondRec.T0;

  // Species handling
  parameter Data.DataRecords.Species.SpeciesRecord specRec(nSpec=0);
  parameter Data.DataRecords.Geometry GeoRec;
  parameter Data.DataRecords.Conditions CondRec;

  // Input parameters
  parameter Length X=GeoRec.X_membrane;
  parameter Length Y=GeoRec.Y;
  parameter Length Z=GeoRec.Z;
  parameter Conductivity kappa=GeoRec.cond0;

  MaterialDomain.Connectors.Material_Liquid anCon(specRec=specRec) annotation (
      Placement(transformation(extent={{-110,50},{-90,70}}), iconTransformation(
          extent={{-120,40},{-80,80}})));
  MaterialDomain.Connectors.Material_Liquid catCon(specRec=specRec) annotation (
     Placement(transformation(extent={{100,60},{120,80}}), iconTransformation(
          extent={{80,40},{120,80}})));

initial equation
  T=T0;
equation

  // Temperature model
    T = model_T.T_i;

  // Phases
  for k in 1:specRec.nSpec loop
    anCon.molFlow_vec[k] = -catCon.molFlow_vec[k];
  end for;
    annotation (Placement(transformation(extent={{-110,-10},{-90,10}})),
                Placement(transformation(extent={{90,-10},{110,10}})),
              Icon(graphics={Bitmap(
          extent={{-100,-100},{100,100}},fileName=
              "modelica://eCherry_Library/../Icons/Membrane.png")}));
end MembraneBase;
