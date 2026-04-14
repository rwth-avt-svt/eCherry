within eCherry_Library.ElectrochemicalReactor.MaterialDomain.Flows;
package Thermal "Flows with thermal models"
  model Material_G_InFlow_ResTime_Thermal
    extends MaterialDomain.Flows.Material_G_InFlow_ResTime;

    // Parameters
    parameter Data.DataRecords.Thermal EBRec;

    // Variables
    HeatFlowRate QFlow_in;

    Properties.EnthalpyModels.MolarEnthalpyOfSpecies0D hSpec_inFlow(specRec=
        specRec, T=T)
    "Calculates the specific enthalpies of components at Tempeature T";

    // Connectors
    ThermalDomain.Thermal convHeatFlow
      annotation (Placement(transformation(extent={{-60,100},{-40,120}})));
  equation

    convHeatFlow.T = T;
    convHeatFlow.Q_flow = QFlow_in;
    QFlow_in = sum(convFlow.molFlow_vec[k]*hSpec_inFlow.h[k] for k in 1:specRec.nSpec);

    annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
          coordinateSystem(preserveAspectRatio=false)));
  end Material_G_InFlow_ResTime_Thermal;

  model Material_L_InFlow_ResTime_Thermal
    extends MaterialDomain.Flows.Material_L_InFlow_ResTime;

    // Parameters
    parameter Data.DataRecords.Thermal EBRec;

    // Variables
    HeatFlowRate QFlow_in;

    Properties.EnthalpyModels.MolarEnthalpyOfSpecies0D hSpec_inFlow(specRec=
        specRec, T=T)
    "Calculates the specific enthalpies of components at Tempeature T";

    // Connectors
    ThermalDomain.Thermal convHeatFlow
      annotation (Placement(transformation(extent={{-60,100},{-40,120}})));
  equation

    convHeatFlow.T = T;
    convHeatFlow.Q_flow = QFlow_in;
    QFlow_in = sum(convFlow.molFlow_vec[k]*hSpec_inFlow.h[k] for k in 1:specRec.nSpec);

    annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
          coordinateSystem(preserveAspectRatio=false)));
  end Material_L_InFlow_ResTime_Thermal;

  model Material_Simple_OutFlow_Thermal
    "Convective outflow, not imposing anything"

    // Species handling
    parameter Data.DataRecords.Species.SpeciesRecord specRec(nSpec=0);

    AmountOfSubstance mol_vec[specRec.nSpec]; // amount of species in the compartment
    MolarFlowRate molFlow_vec[specRec.nSpec]; // molar flow coming from connector
    Real speciesInStream[specRec.nSpec]; // molar quotient of species in outflow stream
    Temperature T "fluid outflow themperature";
    HeatFlowRate Q_flow;

    // Connectors
    Connectors.Material_Simple convFlow(specRec=specRec) annotation (Placement(
          transformation(extent={{0,-100},{20,-80}}), iconTransformation(extent={
              {-20,-120},{20,-80}})));


    ThermalDomain.Thermal heatConvInFlow
    annotation (Placement(transformation(extent={{-60,-100},{-40,-80}})));
  equation
    T = heatConvInFlow.T;
    Q_flow = heatConvInFlow.Q_flow;

    der(mol_vec) = convFlow.molFlow_vec;
    convFlow.molFlow_vec = molFlow_vec;

    for k in 1:specRec.nSpec loop
      speciesInStream[k] = molFlow_vec[k]/sum(molFlow_vec);
    end for;


    annotation (Icon(graphics={Bitmap(
            extent={{-108,-100},{106,100}},
            fileName="modelica://eCherry_Library/../Icons/Arrow.png")}));
  end Material_Simple_OutFlow_Thermal;

  model Material_G_InflowHumidifier
    // Package handling
    parameter Data.DataRecords.Species.SpeciesRecord specRec;
    parameter Data.DataRecords.Conditions CondRec;

    // Input parameters
    parameter Pressure Pr;// = CondRec.p "Pressure in Pascal";
    parameter Temperature T; // = CondRec.T "Temperature in K";
    // Antoine parameters
    parameter Real A = 8.19625;
    parameter Real B = 1730.63;
    parameter Real C = 233.426;


    // Declaration of variables
    Pressure p_vap "vapor pressure water as function of temperature";
    Real x_H2O "mole fraction water";
    MolarFlowRate[specRec.nSpec] molFlow_dry;
    MolarFlowRate molFlow_H2O "Injected water vapor";
    MolarFlowRate dryFlow_sum = sum(molFlow_dry) "Sum of dry gas molar flow";
    Real[specRec.nSpec] x_i_out;
    Real[specRec.nSpec] x_i_in;

    // Connectors

  public
    Connectors.Material_Simple outFlow(specRec=specRec)
      annotation (Placement(transformation(extent={{-10,90},{10,110}})));
  public
    Connectors.Material_Simple inFlow(specRec=specRec)
      annotation (Placement(transformation(extent={{-8,-110},{12,-90}})));
  equation
    molFlow_dry = inFlow.molFlow_vec;

    // vapor pressure in Pa (Antoine in mbar and °C)
    log10(p_vap / 100.0) = A - B / (T - 273.15 + C);
    x_H2O = p_vap / Pr;
    molFlow_H2O = dryFlow_sum * x_H2O / (1 - x_H2O);

    for i in 1:specRec.nSpec loop
      if specRec.species[i].name == "Water" then
        outFlow.molFlow_vec[i] = -molFlow_H2O;
      else
        // all other species are changed accordingly
        outFlow.molFlow_vec[i] = -molFlow_dry[i]; // * (1 + molFlow_H2O / dryFlow_sum);
      end if;
    end for;

    x_i_out = outFlow.molFlow_vec / sum(outFlow.molFlow_vec);
    x_i_in = inFlow.molFlow_vec / sum(inFlow.molFlow_vec);
    annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
          coordinateSystem(preserveAspectRatio=false)));
  end Material_G_InflowHumidifier;

  model Material_Simple_ConnectingFlow_Thermal
    "Convective connecting flow, not imposing anything"

    // Species handling
    parameter Data.DataRecords.Species.SpeciesRecord specRec(nSpec=0);


    // Connectors
    Connectors.Material_Simple convInFlow(specRec=specRec)
                                                          annotation (Placement(
          transformation(extent={{0,-100},{20,-80}}), iconTransformation(extent={{-20,
              -120},{20,-80}})));

    Connectors.Material_Simple convOutFlow(specRec=specRec)
                                                           annotation (Placement(
          transformation(extent={{0,100},{20,120}}),  iconTransformation(extent={{-20,80},
              {20,120}})));

    ThermalDomain.Thermal heatConvInFlow annotation (Placement(
          transformation(extent={{-46,-92},{-40,-86}}),
                                                      iconTransformation(extent={{-66,
              -112},{-40,-86}})));

    ThermalDomain.Thermal heatConvOutFlow annotation (Placement(
          transformation(extent={{-44,106},{-38,112}}),
                                                      iconTransformation(extent={{-64,86},
              {-38,112}})));
  equation

    zeros(specRec.nSpec)=convInFlow.molFlow_vec + convOutFlow.molFlow_vec;

    0=heatConvInFlow.Q_flow + heatConvOutFlow.Q_flow;

    heatConvInFlow.T = heatConvOutFlow.T;
    annotation (Icon(graphics={Bitmap(
            extent={{-106,-100},{108,100}},
            fileName="modelica://eCherry_Library/../Icons/Arrow.png")}));
  end Material_Simple_ConnectingFlow_Thermal;

  model Environment_Thermal "Integrating an outflow, not imposing anything"

    // Species handling
    parameter Data.DataRecords.Species.SpeciesRecord specRec(nSpec=0);
    AmountOfSubstance mol_vec[specRec.nSpec]
                                            "collected amount";

    Heat Q_tot(start=0);
    Temperature T;


    // Connectors
    ThermalDomain.Thermal heatConvInFlow annotation (Placement(
          transformation(extent={{-46,-92},{-40,-86}}),
                                                      iconTransformation(extent={{-66,
              -112},{-40,-86}})));
    Connectors.Material_Simple convFlow(specRec=specRec) annotation (Placement(
          transformation(extent={{0,-100},{20,-80}}), iconTransformation(extent={
              {-20,-120},{20,-80}})));
  initial equation
    mol_vec=zeros(specRec.nSpec);
  equation
    der(mol_vec)=convFlow.molFlow_vec;
    der(Q_tot) = heatConvInFlow.Q_flow;
    T = heatConvInFlow.T;

    annotation (
      Icon(coordinateSystem(preserveAspectRatio=true,  extent={{-100,-100},{
            100,100}}), graphics={Ellipse(
          extent={{-100,100},{100,-100}},
          fillPattern=FillPattern.Sphere,
          fillColor={170,213,255}), Text(
          extent={{-150,12},{150,-18}},
          textString="V")}));
  end Environment_Thermal;
end Thermal;
