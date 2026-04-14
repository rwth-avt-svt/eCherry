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
    parameter Pressure p "Pressure in Pascal";
    parameter Length X = GeoRec.X "Length in m";
    parameter Length Y = GeoRec.Y "Length in m";
    parameter Integer slices = GeoRec.slices "number of compartements / discretisation steps";
    parameter Length Z=GeoRec.Z/slices "perpendicular to discretization direction";
    parameter Volume V = X*Y*Z "Volume of the compartment in m^3";
    parameter Real[specRec.nSpec] mol_vec_frac0 "fraction of initial amount of gas in the compartment; [0,1]";

    // Declaration of variables
    AmountOfSubstance[specRec.nSpec] mol_vec(each min=0);
    Concentration[specRec.nSpec] c(each min=0);
    output Pressure[specRec.nSpec] Pi(each min=0);
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
    Connectors.Material_Simple inFlow(specRec=specRec)
      annotation (Placement(transformation(extent={{-10,-108},{10,-88}})));
    Connectors.Material_Simple outFlow(specRec=specRec)
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
    sum_molFlow_vec_out = sum(outFlow.molFlow_vec);

    // instationary mol balance, cathode is simulated via fixDiffFlow
    der(mol_vec) = outFlow.molFlow_vec + inFlow.molFlow_vec + flowFromElectrode.molFlow_vec;

    // ideal gas law for limitting quantity in segment
    sum(mol_vec) = (p * V) / (R * T);

    // for simulation data
    sum_mol_vec = sum(mol_vec);

    // proportions of outgoing flow are equal to proportions in segment
    for k in 1:specRec.nSpec-1 loop
     outFlow.molFlow_vec[k] = mol_vec[k]/sum(mol_vec)*sum(outFlow.molFlow_vec);
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

  package Thermal
    model GasChannel_Thermal
        extends MaterialDomain.Compartments.Gas.GasChannel;
      extends ThermalDomain.EnergyBalance_Base(Pr=p); //CondRec.p

      redeclare model TemperatureModel =
          Properties.TemperatureModels.TemperatureVariable                  "Temperature is variale for energy balance";

      Properties.EnthalpyModels.MolarEnthalpyOfSpecies0D hSpec(specRec=specRec, T=T)
        "Calculates the specific enthalpies of components at Tempeature T";
      Properties.EnthalpyModels.MolarEnthalpyOfSpecies0D hSpec_inFlow(specRec=
            specRec, T=Tinflow)
        "Calculates the specific enthalpies of components at Tempeature T";
        Temperature Tinflow;
      parameter Boolean ConvInflowTempreatureIsCompartmentTemperature=false annotation(Evaluate=true, HideResult=false, choices(checkBox=true));
      EnthalpyFlowRate HFlow_conv_in "Enthalpyflowrate from convective inflow";
      EnthalpyFlowRate HFlow_conv_out "Enthalpyflowrate from convective outflow";
      parameter HeatFlowRate QFlow_shunt;

       //heat losses via housing
      replaceable model HeatEnvModel =
          ThermalDomain.Thermal_Effects.HeatExchangeEnvironment (
        T=T,
        EBRec=EBRec,
        GeoRec=GeoRec,
        CondRec=CondRec);
      HeatEnvModel HeatEnv;

      ThermalDomain.Thermal heatConvInFlow
        annotation (Placement(transformation(extent={{-60,-120},{-40,-100}})));

      ThermalDomain.Thermal heatConvOutFlow
        annotation (Placement(transformation(extent={{-60,100},{-40,120}})));
    equation
      //Variables for energy conservation
      H_tot = sum(c[k]*V*hSpec.h[k] for k in 1:specRec.nSpec);
      HFlow = HFlow_conv_in + HFlow_conv_out;
      QFlow =  0; //HeatEnv.QFlow_housing + QFlow_shunt;
      WFlow = 0; //no current through gas channel

      // Connectors for heat flow
      leftHeatFlow.T = T;
      rightHeatFlow.T = T;
      heatConvOutFlow.T = T;


      // Enthalpy of convective inflow and outflow
      HFlow_conv_in = heatConvInFlow.Q_flow;
      //HFlow_conv_in = sum(inFlow.molFlow_vec[k]*hSpec_inFlow.h[k] for k in 1:specRec.nSpec);
      HFlow_conv_out = heatConvOutFlow.Q_flow;
      HFlow_conv_out = sum(flowOut.molFlow_vec[k]*hSpec.h[k] for k in 1:specRec.nSpec);

      if ConvInflowTempreatureIsCompartmentTemperature then
        Tinflow = min(T,EBRec.TinflowMax);
      else
        Tinflow = heatConvInFlow.T;
      end if;
      annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
            coordinateSystem(preserveAspectRatio=false)));
    end GasChannel_Thermal;
  end Thermal;
end Gas;
