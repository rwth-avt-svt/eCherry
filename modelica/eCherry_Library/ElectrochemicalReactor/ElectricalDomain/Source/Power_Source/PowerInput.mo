within eCherry_Library.ElectrochemicalReactor.ElectricalDomain.Source.Power_Source;
model PowerInput

  extends GeneralSource;

  PowerConnector powerConnector annotation (Placement(transformation(extent={{-10,
            88},{10,108}}), iconTransformation(extent={{-10,88},{10,108}})));

equation

  powerConnector.P = -W;

  annotation (Icon(graphics={Bitmap(extent={{-100,100},{100,-100}}, fileName=
              "modelica://eCherry_Library/../Icons/Power.png")}));
end PowerInput;
