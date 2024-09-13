within eCherry_Library.ElectrochemicalReactor.Utility.UnitTests.UnitTests;
model TestGetStringIndex

  constant String[3] list = {"Hydrogen", "Oxygen", "Water"};
  Integer[4] index;

equation

  index[1] =Utility.get_string_index("Oxygen", list);
  index[2] =Utility.get_string_index("Hydrogen", list);
  index[3] =Utility.get_string_index("Water", list);
  index[4] =Utility.get_string_index("CO2", list);

  // Expecting inList = {2, 1, 3, -1}

end TestGetStringIndex;
