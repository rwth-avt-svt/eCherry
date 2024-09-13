within eCherry_Library.ElectrochemicalReactor.Utility.UnitTests.UnitTests;
model TestGetNu
  "Contains all electrochemical reactions as instances of record Reaction. All reactions are written down as reduction. Only non-zero entries of nu are considered"

  constant Data.DataRecords.ElecReaction.Reaction HER(
    species={"Proton","Hydrogen"},
    nu={-2,1},
    z=2,
    Eeq0=0,
    j0=657,
    alpha=0.15);
  constant Data.DataRecords.ElecReaction.Reaction OER(
    species={"Proton","Oxygen","Water"},
    nu={-2,-0.5,1},
    z=2,
    Eeq0=1.229,
    j0=7.16,
    alpha=0.89);
  constant Data.DataRecords.ElecReaction.Reaction HERAg(
    species={"Proton","Hydrogen"},
    nu={-2,1},
    z=2,
    Eeq0=0,
    j0=1.71e-15,
    alpha=0.74);
  constant Data.DataRecords.ElecReaction.Reaction COERAg(
    species={"Proton","CO2","CO","Water"},
    nu={-2,-1,1,1},
    z=2,
    Eeq0=0,
    j0=2.12e-6,
    alpha=0.43);

  // Import packages
  import Modelica.Units.SI.*;
  import eCherry_Library.ElectrochemicalReactor.*;

  // Reactor setup
  Data.DataRecords.Species.SpeciesRecord specRec(species={Data.DataRecords.Species.H2O,
        Data.DataRecords.Species.H2,Data.DataRecords.Species.O2,Data.DataRecords.Species.Hp});

  // Variables
  Real nu[4];

equation

  nu[1] =Utility.get_nu(Data.DataRecords.Species.H2O, OER);
  nu[2] =Utility.get_nu(Data.DataRecords.Species.Hp, OER);
  nu[3] =Utility.get_nu(Data.DataRecords.Species.O2, OER);
  nu[4] =Utility.get_nu(Data.DataRecords.Species.CO2, OER);

  // Expexting nu = {1, -2, -0.5, 0}

end TestGetNu;
