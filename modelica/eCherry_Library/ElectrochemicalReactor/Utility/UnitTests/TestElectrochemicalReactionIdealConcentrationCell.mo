within eCherry_Library.ElectrochemicalReactor.Utility.UnitTests;
model TestElectrochemicalReactionIdealConcentrationCell "Ideal concentration cell: no transport or ohmic overpotentials"

  import eCherry_Library.Data.DataRecords.Species.*;
  parameter SpeciesRecord specRec(species={H2O, Hp, OHm, H2});

  constant Data.DataRecords.ElecReaction.Reaction HER(
    species={"Proton","Hydrogen"},
    nu={-2,1},
    z=2,
    Eeq0=0,
    j0=657,
    alpha=0.15);

  parameter Temperature T = 298.15 "in K";
  parameter Length cellWidth = 1 "in m";
  parameter Length cellHeight = 1 "in m";
  parameter Concentration[specRec.nSpec] pH0 = {55.5e3, 1e3, 1e-11, 0} "concentrations in mol/m3, thus c[H+]=1e(0+3)=1e3!";
  parameter Concentration[specRec.nSpec] pH1 = {55.5e3, 1e2, 1e-10, 0} "concentrations in mol/m3, thus c[H+]=1e(-1+3)=1e2!";

  ElectrochemicalReactionSimple cathodeReaction(specRec=specRec, reac=HER, T=T, Y=cellWidth, Z=cellHeight);
  ElectrochemicalReactionSimple anodeReaction(specRec=specRec, reac=HER, T=T, Y=cellWidth, Z=cellHeight);

  MaterialDomain.Flows.FixedConcentrationsWithDiffFlow concentratedElectrolyte(
      specRec=specRec, c=pH0);
  MaterialDomain.Flows.FixedConcentrationsWithDiffFlow diluteElectrolyte(
      specRec=specRec, c=pH1);
  Modelica.Electrical.Analog.Basic.Ground ground;
  Modelica.Electrical.Analog.Basic.Resistor load(R=1e-5);

equation

  connect(cathodeReaction.flowFromElectrolyte, concentratedElectrolyte.diffFlow);
  connect(anodeReaction.flowFromElectrolyte, diluteElectrolyte.diffFlow);

  connect(anodeReaction.electrodePin, load.n);
  connect(load.p, cathodeReaction.electrodePin);
  connect(cathodeReaction.electrolytePin, anodeReaction.electrolytePin);
  connect(anodeReaction.electrolytePin, ground.p);

  // Expecting:
  // - Consumption of H+ and production of H2 at the cathode, and vice versa at the anode
  // - Higher potential at cathodeReaction.electrodePin than at anodeReaction.electrodePin
  // - At cathode, voltage (v!) and current of activation overpotential should be negative, at cathode positive

end TestElectrochemicalReactionIdealConcentrationCell;
