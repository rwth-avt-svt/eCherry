within eCherry_Library.Data.DataRecords;
record Geometry

  parameter Real X;
  parameter Real X_membrane;
  parameter Real Y;
  parameter Real Z;
  parameter Real cond0;
  parameter Real dX;

  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end Geometry;
