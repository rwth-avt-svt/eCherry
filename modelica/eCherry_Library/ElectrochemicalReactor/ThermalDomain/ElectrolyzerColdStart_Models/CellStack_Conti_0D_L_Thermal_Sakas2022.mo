within eCherry_Library.ElectrochemicalReactor.ThermalDomain.ElectrolyzerColdStart_Models;
model CellStack_Conti_0D_L_Thermal_Sakas2022
 import eCherry_Library.ElectrochemicalReactor.Utility.get_diffusion_distances;

  parameter Data.DataRecords.Thermal EBRec;
  parameter Data.DataRecords.Species.SpeciesRecord specRec(nSpec=0);
  parameter Data.DataRecords.Geometry GeoRec;
  parameter Data.DataRecords.Conditions CondRec;
  parameter Concentration c0[specRec.nSpec];
  parameter MolarFlowRate[specRec.nSpec] molFlow_vec_inFlow;
  parameter Pressure[specRec.nSpec] Pi;
  parameter HeatFlowRate QFlow_shunt;

  // Parameters
  parameter Integer n_cells(min=1)=4 "number of finite volume cells (discretization)";
  parameter Conductivity kappa_const "constant default conductivity of electrolyte";

  // Models
  HT_BipolarPlate_Thermal_Sakas2022 HT_Bipolar[n_cells - 1](each EBRec=EBRec);
                               //

  Cell_Conti_0D_L_Thermal_Sakas2022 cells[n_cells](
    each EBRec=EBRec,
    each specRec=specRec,
    each GeoRec=GeoRec,
    each c0=c0,
    each kappa_const=kappa_const,
    each CondRec=CondRec,
    each molFlow_vec_inFlow=molFlow_vec_inFlow,
    each Pi=Pi,
    each QFlow_shunt=QFlow_shunt);

  eCherry_Library.ElectrochemicalReactor.ThermalDomain.Source.ExternalHeating_Adiabatic
    externalHeatingAnode(EBRec=EBRec);
  eCherry_Library.ElectrochemicalReactor.ThermalDomain.Source.ExternalHeating_Adiabatic
    externalHeatingCathode(EBRec=EBRec);
  // Connectors
        Modelica.Electrical.Analog.Interfaces.PositivePin p "Positive electrical pin"
  annotation (Placement(
        transformation(extent={{-110,-10},{-90,10}})));
  Modelica.Electrical.Analog.Interfaces.NegativePin n "Negative electrical pin" annotation (Placement(transformation(extent={{
            110,-10},{90,10}})));

equation

  // Connecting the equivalent circuits
  for i in 1:n_cells-1 loop
    connect(cells[i].n, cells[i+1].p) "a";
  end for;
    connect(p, cells[1].p)
    annotation (Line(points={{-100,0},{-46,0}}, color={0,0,255}));
    connect(cells[end].n, n)
    annotation (Line(points={{46,0},{100,0}}, color={0,0,255}));

  // Connecting the heat flows
    for i in 1:n_cells-1 loop
    connect(cells[i].rightHeatFlow, HT_Bipolar[i].leftHeatFlow) "a";
    connect(HT_Bipolar[i].rightHeatFlow, cells[i+1].leftHeatFlow) "a";
  end for;

  connect(externalHeatingAnode.heatFlow,cells[1].leftHeatFlow);
  connect(externalHeatingCathode.heatFlow,cells[end].rightHeatFlow);

             annotation (Icon(coordinateSystem(preserveAspectRatio=false), graphics={
          Bitmap(extent={{-102,-100},{104,102}}, fileName=
              "modelica://eCherry_Library/../Icons/nDiscs.png")}), Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end CellStack_Conti_0D_L_Thermal_Sakas2022;
