within eCherry_Library.ElectrochemicalReactor.ElectricalDomain.Source.Power_Source;
model Power_Input

  extends Electrical_Source_Base;

  Power_Simple powerConnector annotation (Placement(transformation(extent={{-10,
            88},{10,108}}), iconTransformation(extent={{-10,88},{10,108}})));

equation

  powerConnector.P = -W;

  annotation (Icon(graphics={Bitmap(extent={{-100,100},{100,-100}}, fileName=
              "modelica://eCherry_Library/../Icons/Power.png")}));
end Power_Input;
