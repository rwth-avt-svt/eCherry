within eCherry_Library.ElectrochemicalReactor.MaterialDomain.Flows;
model Material_G_InFlow_ResTime
  extends Material_Simple_InFlow_ResTime_Base;

  // parameters
  parameter Data.DataRecords.Conditions CondRec;
  parameter Pressure p = CondRec.p;

equation
  molFlow = (p*V_flow)/(R*T) "in mol/s";

  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end Material_G_InFlow_ResTime;
