within eCherry_Library.Data.DataRecords;
record Thermal

  // For housing
  parameter ThermalConductivity lambda_housing "Thermal conductivity of housing";
  parameter CoefficientOfHeatTransfer alpha_housing_environment "Coefficient of heat transfer between housing and environment";
  parameter CoefficientOfHeatTransfer alpha_housing_electrolyte "Coefficient of heat transfer between housing and electrolyte";
  parameter Length delta_housing "Thickness of reactor housing";
  parameter Temperature Tenvironment_housing "Temperature of environment around housing";
  parameter Real e "Emissivity of housing for radiation";

  // For anode
  parameter Density rho_anode "Density of anode material";
  parameter SpecificHeatCapacity cp_anode "Specific heat capacity of anode";
  parameter CoefficientOfHeatTransfer alpha_anode_externalHeating "Coefficient of heat transfer between anode and externalHeating";
  parameter CoefficientOfHeatTransfer alpha_anode_electrolyte "Coefficient of heat transfer between anode and electrolyte";
  parameter Length X_anode "Thickness of anode";

  // For cathode
  parameter Density rho_cathode "Density of cathode material";
  parameter SpecificHeatCapacity cp_cathode "Specific heat capacity of cathode";
  parameter CoefficientOfHeatTransfer alpha_cathode_externalHeating "Coefficient of heat transfer between cathode and externalHeating";
  parameter CoefficientOfHeatTransfer alpha_cathode_electrolyte "Coefficient of heat transfer between cathode and electrolyte";
  parameter Length X_cathode "Thickness of cathode";

  // For membrane
  parameter Density rho_membrane "Density of membrane";
  parameter SpecificHeatCapacity cp_membrane "Specific heat capacity of membrane";
  parameter CoefficientOfHeatTransfer alpha_membrane_anolyte "Coefficient of heat transfer between membrane and anolyte";
  parameter CoefficientOfHeatTransfer alpha_membrane_catholyte "Coefficient of heat transfer between membrane and catholyte";

  // For external heating
  parameter Temperature T0externalHeating "Temperature for external heating";

  // For convective inflow
  parameter Temperature T0convectiveInflow "Temperature for convective inflow of electrolyte";
  parameter Temperature TinflowMax "Max inflow temperature for ColdStart";

  //For shunt currents, Qshunt is additionally dissipated in each half-cell
  //parameter HeatFlowRate QFlow_shunt "Heat dissipation due to shunt currents";

  // For 1D
  //parameter ThermalConductivity lambda_electrolyte "Thermal conductivity of electrolyte";
  parameter CoefficientOfHeatTransfer alpha_electrolyte_electrolyte "Coefficient of heat transfer of electrolyte to approximate its thermal conductivity";

  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end Thermal;
