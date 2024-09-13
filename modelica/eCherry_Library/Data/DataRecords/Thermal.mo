within eCherry_Library.Data.DataRecords;
record Thermal

  // For housing
  constant ThermalConductivity lambda_housing "Thermal conductivity of housing";
  constant CoefficientOfHeatTransfer alpha_housing_environment "Coefficient of heat transfer between housing and environment";
  constant CoefficientOfHeatTransfer alpha_housing_electrolyte "Coefficient of heat transfer between housing and electrolyte";
  constant Length delta_housing "Thickness of reactor housing";
  constant Temperature Tenvironment_housing "Temperature of environment around housing";
  constant Real e "Emissivity of housing for radiation";

  // For anode
  constant Density rho_anode "Density of anode material";
  constant SpecificHeatCapacity cp_anode "Specific heat capacity of anode";
  constant CoefficientOfHeatTransfer alpha_anode_externalHeating "Coefficient of heat transfer between anode and externalHeating";
  constant CoefficientOfHeatTransfer alpha_anode_electrolyte "Coefficient of heat transfer between anode and electrolyte";
  constant Length X_anode "Thickness of anode";

  // For cathode
  constant Density rho_cathode "Density of cathode material";
  constant SpecificHeatCapacity cp_cathode "Specific heat capacity of cathode";
  constant CoefficientOfHeatTransfer alpha_cathode_externalHeating "Coefficient of heat transfer between cathode and externalHeating";
  constant CoefficientOfHeatTransfer alpha_cathode_electrolyte "Coefficient of heat transfer between cathode and electrolyte";
  constant Length X_cathode "Thickness of cathode";

  // For membrane
  constant Density rho_membrane "Density of membrane";
  constant SpecificHeatCapacity cp_membrane "Specific heat capacity of membrane";
  constant CoefficientOfHeatTransfer alpha_membrane_anolyte "Coefficient of heat transfer between membrane and anolyte";
  constant CoefficientOfHeatTransfer alpha_membrane_catholyte "Coefficient of heat transfer between membrane and catholyte";

  // For external heating
  constant Temperature T0externalHeating "Temperature for external heating";

  // For convective inflow
  constant Temperature T0convectiveInflow "Temperature for convective inflow of electrolyte";

  //For shunt currents, Qshunt is additionally dissipated in each half-cell
  //constant HeatFlowRate QFlow_shunt "Heat dissipation due to shunt currents";

  // For 1D
  //constant ThermalConductivity lambda_electrolyte "Thermal conductivity of electrolyte";
  constant CoefficientOfHeatTransfer alpha_electrolyte_electrolyte "Coefficient of heat transfer of electrolyte to approximate its thermal conductivity";

  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end Thermal;
