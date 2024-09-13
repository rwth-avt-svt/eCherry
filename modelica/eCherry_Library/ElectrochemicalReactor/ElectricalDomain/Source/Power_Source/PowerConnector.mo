within eCherry_Library.ElectrochemicalReactor.ElectricalDomain.Source.Power_Source;
connector PowerConnector

  import Modelica.Units.SI.*;

  Real P "Power from grid";

     annotation (Icon(coordinateSystem(preserveAspectRatio=false), graphics={
          Rectangle(
          extent={{-100,100},{100,-100}},
          lineColor={205,139,135},
          lineThickness=1,
          fillColor={182,82,86},
          fillPattern=FillPattern.Solid)}),                         Diagram(
        coordinateSystem(preserveAspectRatio=false), graphics={Rectangle(
          extent={{-40,40},{40,-40}},
          lineColor={205,139,135},
          lineThickness=1,
          fillColor={182,82,86},
          fillPattern=FillPattern.Solid),Text(
          extent={{-58,58},{-12,28}},
          textColor={182,82,86},
          textString="%name
")}));
end PowerConnector;
