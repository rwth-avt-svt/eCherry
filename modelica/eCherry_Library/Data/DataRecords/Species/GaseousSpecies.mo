within eCherry_Library.Data.DataRecords.Species;
record GaseousSpecies "package for gaseous species"

  constant Species H2(
    name="Hydrogen",
    M=2.01588e-3,
    D=ElectrochemicalReactor.Utility.Common.Ddummy,
    state=State.Gas,
    cp1=28.82);
  constant Species O2(
    name="Oxygen",
    M=31.9988e-3,
    D=ElectrochemicalReactor.Utility.Common.Ddummy,
    state=State.Gas,
    cp1=29.38);
  constant Species N2(
    name="Nitrogen",
    M=28.0134e-3,
    D=ElectrochemicalReactor.Utility.Common.Ddummy,
    state=State.Gas,
    cp1=29.12);
  constant Species CO2(
    name="CO2",
    M=44.0095e-3,
    D=ElectrochemicalReactor.Utility.Common.Ddummy,
    state=State.Gas,
    cp1=36.94);
  constant Species CO(
    name="CO",
    M=28.0101e-3,
    D=ElectrochemicalReactor.Utility.Common.Ddummy,
    state=State.Gas);
  constant Species NH3(
    name="Ammonia",
    M=17.031e-3,
    D=ElectrochemicalReactor.Utility.Common.Ddummy,
    state=State.Gas);

  // Gases
/*constant Species H2(name="Hydrogen", M=2.01588e-3, H0=0);//, state=State.Gas);
  constant Species O2(name="Oxygen", M=31.9988e-3, H0=0);//, state=State.Gas);
  constant Species CO(name="CO", M=28.0101e-3, H0=-110081.04);//state=State.Gas,
  constant Species CO2(name="CO2", M=44.0095e-3, H0=-393505.2); //state=State.Gas,*/
end GaseousSpecies;
