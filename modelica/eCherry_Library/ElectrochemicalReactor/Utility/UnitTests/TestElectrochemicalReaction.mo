within eCherry_Library.ElectrochemicalReactor.Utility.UnitTests;
model TestElectrochemicalReaction

  import eCherry_Library.Data.DataRecords.Species.*;
  parameter SpeciesRecord specRec(species={H2O, Hp, OHm, H2});

  constant Data.DataRecords.ElecReaction.Reaction HER(
    species={"Proton","Hydrogen"},
    nu={-2,1},
    z=2,
    Eeq0=0,
    j0=657,
    alpha=0.5,
    RO={1,1},
    dH_app=0);
  //constant Reaction HER(species={"Proton", "Hydrogen"}, nu={-2, 1}, z=2, Eeq0=0, j0=657, alpha=0.5);

  parameter Temperature T = 298.15 "in K";
  parameter Length cellWidth = 1 "in m";
  parameter Length cellHeight = 1 "in m";
  parameter Concentration[specRec.nSpec] pH1 = {55.5e3, 1e2, 1e-10, 0} "concentrations in mol/m3, thus c[H+]=1e(-1+3)=1e2!";

  ElectrochemicalReactionSimple elChemReac(specRec=specRec, reac=HER, T=T, Y=cellWidth, Z=cellHeight);

  MaterialDomain.Flows.FixedConcentrationsWithDiffFlow electrolyte(specRec=
        specRec, c=pH1);
  ElectricalDomain.Source.Current_Source.LinearCurrentDensity source(
    j0=-10000,
    dj=2000,
    Y=cellWidth,
    Z=cellHeight);
  Modelica.Electrical.Analog.Basic.Ground ground;

equation

  connect(ground.p, source.p);
  connect(source.p, elChemReac.electrodePin);
  connect(source.n, elChemReac.electrolytePin);
  connect(elChemReac.flowFromElectrolyte, electrolyte.diffFlow);

  // Expecting:
  // - Reaction initially running at oxidation, when j crossing 0 as reduction
  // - Equilibrium potential constant at -0.059 V (see Pourbaix diagram of water at pH=1
  // - Voltage (v!) of activation overpotential model starting positive (oxidation), then crossing zero and going negative (reduction)
  // - Activation overpotential (eta) first decreasing, going to zero as j crosses zero, than sharp increase again
  annotation (experiment(StopTime=100, __Dymola_Algorithm="Dassl"));
end TestElectrochemicalReaction;
