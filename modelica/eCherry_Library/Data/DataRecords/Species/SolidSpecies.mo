within eCherry_Library.Data.DataRecords.Species;
record SolidSpecies "record for solid species"
   constant Species K2SO4s(
    name="K2SO4",
    M=174.2592e-3,
    D=ElectrochemicalReactor.Utility.Common.Ddummy,
    state=State.Solid);
                  //solid Potassium sulfate
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end SolidSpecies;
