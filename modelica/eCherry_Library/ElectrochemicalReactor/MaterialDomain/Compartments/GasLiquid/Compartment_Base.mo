within eCherry_Library.ElectrochemicalReactor.MaterialDomain.Compartments.GasLiquid;
partial model Compartment_Base
  "A compartment with material hold-up and a variable number of DiffFlow connectors"

 // Species handling
  inner parameter Data.DataRecords.Species.SpeciesRecord specRec(nSpec=0);
  parameter Data.DataRecords.Species.SpeciesRecord GSpec(nSpec=0);
  parameter Data.DataRecords.Species.SpeciesRecord DSpec(nSpec=0);
  parameter Data.DataRecords.Species.SpeciesRecord LSpec(nSpec=0);

  //Integer values for numbered steps in specRec
  parameter Integer GSpecO=GSpec.nSpec;
  parameter Integer DSpecA=GSpec.nSpec+1;
  parameter Integer DSpecO=DSpec.nSpec+GSpec.nSpec;
  parameter Integer LSpecA=DSpec.nSpec+GSpec.nSpec+1;
  parameter Integer AllSpec=DSpec.nSpec+GSpec.nSpec+LSpec.nSpec;
  constant Real epsilon = 1e-11 "small constant to avoid division by zero";

  // Input parameters
  parameter Data.DataRecords.Geometry GeoRec;
  parameter Data.DataRecords.Conditions CondRec;
  parameter Length X=GeoRec.X "along discretization direction";
  parameter Length Y=GeoRec.Y "perpendicular to discretization direction";
  parameter Length Z=GeoRec.Z "perpendicular to discretization direction";
  parameter Volume V_geo = X*Y*Z;
  parameter AmountOfSubstance mol_vec_0[AllSpec] "inital molar amounts";

  // Variables
  AmountOfSubstance mol_vec[AllSpec];
  AmountOfSubstance mol_tot_G; //molar amount of gaseous species
  Volume V_L "water volume"; //approximately volume of liquid phase
  Volume V_G "gas volume";
  inner Real G_frac "void fraction"; //ratio between gaseous and total volume
  inner Concentration c[AllSpec]; // concentrations in the compartment

  // Temperature model
  replaceable model TemperatureModel =
      Properties.TemperatureModels.TemperatureBase
      annotation(choices(
    choice=Thermodynamics.TemperatureConstant
    "Constant Temperature",
    choice=Thermodynamics.TemperatureVariable
    "Variable Temperature"));
    TemperatureModel model_T;
  inner Temperature T;
  parameter Temperature T0 = CondRec.T0;

  // Connectors
  Connectors.Material_Liquid leftFlow(specRec=specRec) annotation (Placement(
        transformation(extent={{-110,50},{-90,70}}), iconTransformation(extent={{-130,30},
            {-90,70}})));
  Connectors.Material_Liquid rightFlow(specRec=specRec) annotation (Placement(
        transformation(extent={{90,50},{110,70}}), iconTransformation(extent={{
            80,40},{120,80}})));

initial equation
  T=T0;
equation

  // Temperature model
  T = model_T.T_i;
  //calculate V_G from geometry and liquid volume
  V_geo = V_G + V_L;
  G_frac = V_G/V_geo;

  annotation (Icon(graphics={Bitmap(extent={{-100,-100},{100,100}}, fileName=
              "modelica://eCherry_Library/../Icons/Electrolyte.png")}));
end Compartment_Base;
