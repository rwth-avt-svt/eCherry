within eCherry_Library.ElectrochemicalReactor.Properties.ConductivityModels;
model ConductivityElectrolyteCalcKOH "Conductivity correlation for KOH"
  extends ConductivityElectrolyteBase;

  outer Temperature T  "Temperature in K";
  outer parameter Data.DataRecords.Species.SpeciesRecord specRec;
  outer parameter Conductivity kappa_const = 80 "Constant Conductivity of electrolyte in S m-1";
  constant Integer nSpec = specRec.nSpec;
  outer Concentration c[nSpec];
  parameter String list_name[nSpec] = specRec.species[:].name;
  Concentration c_temp;
  parameter Real Eps = 1e-6;

  parameter Real A = -2.041;
  parameter Real B = -0.0028;
  parameter Real C = 0.005332;
  parameter Real D = 207.2;
  parameter Real E = 0.001043;
  parameter Real F = -0.0000003;

protected
  parameter Real ind_Kp(fixed=false);
  parameter Real ind_KOH(fixed=false);
  parameter Real ind_OHm(fixed=false);
  parameter Real ind_OHm_Hydroxide(fixed=false);
  parameter Integer num_El(fixed=false);

initial equation

  ind_Kp = eCherry_Library.ElectrochemicalReactor.Utility.get_string_index(name=
     "Kp", list=list_name);
  ind_KOH = eCherry_Library.ElectrochemicalReactor.Utility.get_string_index(
    name="KOH", list=list_name);
  ind_OHm = eCherry_Library.ElectrochemicalReactor.Utility.get_string_index(
    name="OHm", list=list_name);
  ind_OHm_Hydroxide =
    eCherry_Library.ElectrochemicalReactor.Utility.get_string_index(name=
    "Hydroxide", list=list_name);
  num_El = integer(max({ind_Kp, ind_KOH, ind_OHm, ind_OHm_Hydroxide}));

  if num_El <= 0 then
    assert(false, "Selected Electrolyte not in Species Record. Add electrolyte or change conductivity calculation");
  else
  end if;

equation
  c_temp = c[num_El] + Eps;
  kappa_i =( A*c_temp*1e-3 + B*(c_temp*1e-3)^2 + C*(c_temp*1e-3)*T + D*c_temp*1e-3/T + E*(c_temp*1e-3)^3 + F*(c_temp*1e-3)^2*T^2)*1e2;

  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)),
    Documentation(info="<html>
<p>Calculation of the conductivity of the electrolyte for KOH using a correlation by Gilliam et al.. </p>
<p><br>The model takes the concentration vector, the species record, and the temperature as inputs and gives the conductivity as an output. </p>
<p><br>GILLIAM, R.; GRAYDON, J.; KIRK, D.; THORPE, S. A review of specific conductivities of potassium hydroxide solutions for various concentrations and temperatures. International Journal of Hydrogen Energy [Online] 2007, 32 (3), 359&ndash;364. https://​www.sciencedirect.com​/​science/​article/​pii/​S0360319906005428.</p>
</html>"));
end ConductivityElectrolyteCalcKOH;
