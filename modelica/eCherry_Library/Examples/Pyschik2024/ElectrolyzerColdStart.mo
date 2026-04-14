within eCherry_Library.Examples.Pyschik2024;
model ElectrolyzerColdStart
  //Repliction of a model from G. Sakas, A. Ib ́a ̃nez-Rioja, V. Ruuskanen, A. Kosonen, J. Ahola, O. Bergmann,
  //International Journal of Hydrogen Energy 2022, 47, 4328–4345.
  parameter Real inputPercentage = 1;

  extends Modelica.Icons.Example;
  Modelica.Electrical.Analog.Basic.Ground Ground
    annotation (Placement(transformation(extent={{70,50},{50,70}})));

    //redeclare model TemperatureModel =  eCherry_Library.ElectrochemicalReactor.Properties.TemperatureModels.TemperatureVariable,

  ElectrochemicalReactor.ElectricalDomain.Source.Current_Source.CurrentDensity_Fixed
    constantCurrentDensity(GeoRec=eCherry_Library.Data.UserInput.Pyschik2024_ElectrolyzerColdStart.GeoRec,
      jFixed=inputPercentage*9135/(2*1.631*1.631))
    annotation (Placement(transformation(extent={{10,62},{-10,82}})));
  ElectrochemicalReactor.ThermalDomain.CompositeElectrolyzer_Models.CellStack_Conti_0D_L_Thermal
    cellStack_1(
    EBRec=eCherry_Library.Data.UserInput.Pyschik2024_ElectrolyzerColdStart.EBdummy,

    specRec=eCherry_Library.Data.UserInput.Pyschik2024_ElectrolyzerColdStart.AWEKOHspec,

    GeoRec=eCherry_Library.Data.UserInput.Pyschik2024_ElectrolyzerColdStart.GeoRec,

    CondRec=eCherry_Library.Data.UserInput.Pyschik2024_ElectrolyzerColdStart.CondRec,

    c0=eCherry_Library.Data.UserInput.Pyschik2024_ElectrolyzerColdStart.c0,
    molFlow_vec_inFlow=eCherry_Library.Data.UserInput.Pyschik2024_ElectrolyzerColdStart.molFlow_vec_inFlow,

    Pi=eCherry_Library.Data.UserInput.Pyschik2024_ElectrolyzerColdStart.Pi,
    QFlow_shunt=inputPercentage*308840/(2*163*2),
    reac_anode={eCherry_Library.Data.UserInput.Pyschik2024_ElectrolyzerColdStart.OERdummy},

    reac_cathode={eCherry_Library.Data.UserInput.Pyschik2024_ElectrolyzerColdStart.HERdummy},

    ConvInflowTempreatureIsCompartmentTemperature=true,
    n_cells=1,
    kappa_membrane=eCherry_Library.Data.UserInput.Pyschik2024_ElectrolyzerColdStart.kappa_const,

    redeclare model ActivationOverpotentialModel =
        eCherry_Library.ElectrochemicalReactor.Electrodes.Electrochemistry.Activation_Overpotential.ActivationOverpotentialColdStart,

    redeclare model EquilibriumPotentialModel =
        eCherry_Library.ElectrochemicalReactor.Electrodes.Electrochemistry.Equilibrium_Potential.EquilibriumPotentialColdStart,

    redeclare model DensityModel =
        eCherry_Library.ElectrochemicalReactor.Properties.DensityModels.DensityConstant,

    redeclare model ConductivityModelElectrolyte =
        eCherry_Library.ElectrochemicalReactor.Properties.ConductivityModels.ConductivityElectrolyteCalcKOHColdStart,

    redeclare model HeatEnvModelElectrolyte =
        eCherry_Library.ElectrochemicalReactor.ThermalDomain.Thermal_Effects.HeatExchangeEnvironmentColdStart)
    annotation (Placement(transformation(extent={{-10,-6},{10,14}})));
equation
  connect(Ground.p, constantCurrentDensity.p)
    annotation (Line(points={{60,70},{60,72},{10,72}}, color={0,0,255}));
  connect(constantCurrentDensity.p, cellStack_1.n)
    annotation (Line(points={{10,72},{14,72},{14,4},{10,4}}, color={0,0,255}));
  connect(constantCurrentDensity.n, cellStack_1.p) annotation (Line(points={{
          -10,72},{-14,72},{-14,4},{-10,4}}, color={0,0,255}));
  annotation (experiment(
      StopTime=15000,
      __Dymola_NumberOfIntervals=2000,
      Tolerance=1e-12,
      __Dymola_Algorithm="Dassl"));
end ElectrolyzerColdStart;
