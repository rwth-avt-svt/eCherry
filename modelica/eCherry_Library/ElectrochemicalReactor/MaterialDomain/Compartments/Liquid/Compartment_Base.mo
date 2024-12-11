within eCherry_Library.ElectrochemicalReactor.MaterialDomain.Compartments.Liquid;
partial model Compartment_Base
  "A compartment with material hold-up and a variable number of DiffFlow connectors"

  // Species handling
  inner parameter Data.DataRecords.Species.SpeciesRecord specRec(nSpec=0);
  parameter Data.DataRecords.Geometry GeoRec;
  parameter Data.DataRecords.Conditions CondRec;
  parameter Length X=GeoRec.X "along discretization direction";
  parameter Length Y=GeoRec.Y "perpendicular to discretization direction";
  parameter Length Z=GeoRec.Z "perpendicular to discretization direction";

  // Input parameters
  parameter Volume V_geo;
  parameter AmountOfSubstance mol_vec0[specRec.nSpec]
                                                     "initial amounts";

  //Variables
  inner Concentration c[specRec.nSpec]; // concentrations in the compartment
  AmountOfSubstance mol_vec[specRec.nSpec]; // amount of species in the compartment

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

initial equation
  T=T0;
equation

  // Temperature model
  T = model_T.T_i;

end Compartment_Base;
