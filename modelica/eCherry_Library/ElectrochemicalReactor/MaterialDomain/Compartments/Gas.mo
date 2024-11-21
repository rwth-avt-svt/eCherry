within eCherry_Library.ElectrochemicalReactor.MaterialDomain.Compartments;
package Gas
  extends Modelica.Icons.VariantsPackage;

  model GasChannel
    import Modelica.Constants.R;

     // Package handling
    parameter Data.DataRecords.Species.SpeciesRecord specRec;
    parameter Data.DataRecords.Geometry GeoRec;
    parameter Data.DataRecords.Conditions CondRec;

    // Input parameters
    parameter Pressure p = CondRec.p "Pressure in Pascal";
    parameter Length X = GeoRec.X "Length in m";
    parameter Length Y = GeoRec.Y "Length in m";
    parameter Length Z = GeoRec.Z "Length in m";
    parameter Volume V = X*Y*Z "Volume of the compartment in m^3";
    parameter Real[specRec.nSpec] mol_vec_frac0 "fraction of initial amount of gas in the compartment; [0,1]";

    // Declaration of variables
    AmountOfSubstance[specRec.nSpec] mol_vec(min=0);
    Concentration[specRec.nSpec] c(min=0);
    output Pressure[specRec.nSpec] Pi(min=0);
    AmountOfSubstance sum_mol_vec;
    MolarFlowRate sum_molFlow_vec_out;

    // Temperature model
    replaceable model TemperatureModel =
        Properties.TemperatureModels.TemperatureConstant
        annotation(choices(
      choice=Thermodynamics.TemperatureConstant
      "Constant Temperature",
      choice=Thermodynamics.TemperatureVariable
      "Variable Temperature"));
      TemperatureModel model_T;
    inner Temperature T;
    parameter Temperature T0 = CondRec.T0;

    // Connectors
    Connectors.Material_Gas flowFromElectrode(specRec=specRec)
      annotation (Placement(transformation(extent={{-110,50},{-90,70}})));
    Connectors.Material_Simple flowIn(specRec=specRec)
      annotation (Placement(transformation(extent={{-10,-108},{10,-88}})));
    Connectors.Material_Simple flowOut(specRec=specRec)
      annotation (Placement(transformation(extent={{-10,90},{10,110}})));

  initial equation
    T=T0;

    // initial amounts of each substance
    sum(mol_vec) = (p*V)/(R*T);
    for k in 1:specRec.nSpec-1 loop
      mol_vec[k] = mol_vec_frac0[k]*(p*V)/(R*T);
    end for;

  equation
    // Temperature model
    T = model_T.T_i;

    // for simulation
    sum_molFlow_vec_out = sum(flowOut.molFlow_vec);

    // instationary mol balance, cathode is simulated via fixDiffFlow
    der(mol_vec) = flowOut.molFlow_vec + flowIn.molFlow_vec + flowFromElectrode.molFlow_vec;

    // ideal gas law for limitting quantity in segment
    sum(mol_vec) = (p * V) / (R * T);

    // for simulation data
    sum_mol_vec = sum(mol_vec);

    // proportions of outgoing flow are equal to proportions in segment
    for k in 1:specRec.nSpec-1 loop
     flowOut.molFlow_vec[k] = mol_vec[k]/sum(mol_vec)*sum(flowOut.molFlow_vec);
    end for;

    //calculating partial pressure
    for k in 1:specRec.nSpec loop
      Pi[k] = mol_vec[k] / sum(mol_vec) * p;
    end for;
    flowFromElectrode.Pi = Pi;

    //calculating concentration
    c = mol_vec / V;

    annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
          coordinateSystem(preserveAspectRatio=false)));
  end GasChannel;
end Gas;
