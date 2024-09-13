within eCherry_Library.ElectrochemicalReactor.ElectricalDomain.Source.Power_Source;
model LoadExternalData

  import ModelicaServices;

  parameter String filePath;

  Modelica.Blocks.Sources.CombiTimeTable combiTimeTable(
    tableOnFile=true,
    tableName="table1",
    columns={2},
    smoothness=2,
    extrapolation = 1,
    timeScale=1,
    fileName=ModelicaServices.ExternalReferences.loadResource(filePath))
    annotation (Placement(transformation(extent={{-72,-12},{-52,8}})));
//     Documentation to be found under: https://build.openmodelica.org/Documentation/Modelica.Blocks.Sources.CombiTimeTable.html
//     small Excerpt:
//  smoothness = 1: Linear interpolation
//            = 2: Akima interpolation
//            = 3: Constant segments
//            = 4: Fritsch-Butland interpolation
//            = 5: Steffen interpolation
//            = 6: Modified Akima interpolation
// extrapolation = 1: Hold the first or last value
//               = 2: Extrapolate by using the derivative
//               = 3: Periodically repeat the table data (periodical function).
//               = 4: No extrapolation, i.e. extrapolation triggers an error

  PowerConnector powerConnector annotation (Placement(transformation(extent={{-10,
            -110},{10,-90}}), iconTransformation(extent={{-10,-110},{10,-90}})));

equation
    combiTimeTable.y[1] = powerConnector.P;

    annotation (Placement(transformation(extent={{-20,-18},{20,22}})),
                 Placement(transformation(extent={{-310,50},{-290,70}})),
              Icon(graphics={Bitmap(extent={{-90,-88},{68,72}}, fileName=
              "modelica://eCherry_Library/../Icons/Windmill.png")}));
end LoadExternalData;
