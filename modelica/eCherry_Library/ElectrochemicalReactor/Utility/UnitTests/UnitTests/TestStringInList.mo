within eCherry_Library.ElectrochemicalReactor.Utility.UnitTests.UnitTests;
model TestStringInList

  constant String[3] list = {"Hydrogen", "Oxygen", "Water"};
  Boolean[4] inList;

equation

  inList[1] =Utility.string_in_list("Hydrogen", list);
  inList[2] =Utility.string_in_list("Oxygen", list);
  inList[3] =Utility.string_in_list("Water", list);
  inList[4] =Utility.string_in_list("CO2", list);

  // Expecting inList = {true, true, true, false}

end TestStringInList;
