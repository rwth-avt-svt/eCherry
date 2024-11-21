within eCherry_Library.ElectrochemicalReactor.MaterialDomain.Flows;
model Material_G_InFlow_ResTime
  extends Material_Simple_InFlow_ResTime_Base;

  // parameters
  parameter Data.DataRecords.Conditions CondRec;

equation
  molFlow_vec = (CondRec.p*V_flow)/(R*CondRec.T0) "in mol/s";

  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end Material_G_InFlow_ResTime;
