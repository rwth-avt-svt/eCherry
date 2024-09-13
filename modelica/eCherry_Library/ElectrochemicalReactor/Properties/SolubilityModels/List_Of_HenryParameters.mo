within eCherry_Library.ElectrochemicalReactor.Properties.SolubilityModels;
record List_Of_HenryParameters
  constant HenryParameter henry_CO2(
    a=-6.8346,
    b=1.2817e4,
    c=-3.7668e6,
    d=2.997e8,
    e=0,
    p=1e6)
    "approach Carbon Dioxide in Water from Carroll et al \\cite{Carroll.1991} for pressures up to 10 bar:";
  constant HenryParameter henry_N2_weird(
    a=-67.38765,
    b=86.32129,
    c=0,
    d=0,
    e=24.79808,
    p=1);
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end List_Of_HenryParameters;
