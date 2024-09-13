within ;
package eCherry_Library "contains all relevant packages"
    extends Modelica.Icons.Package;
  import Modelica.Units.SI.*;
  import Modelica.Constants.R "ideal gas constant in J/(mol*K)";
  import Modelica.Constants.F "faraday constant in C/mol";

 annotation (uses(Modelica(version="4.0.0"), ElectrolyteMedia(version="1")),
            Icon(graphics={Bitmap(extent={{-102,-100},{102,100}}, fileName=
              "modelica://eCherry_Library/../Icons/Echery_icon3.png")}),
    version="1",
    experiment(Tolerance=1e-06, __Dymola_Algorithm="Dassl"));
end eCherry_Library;
