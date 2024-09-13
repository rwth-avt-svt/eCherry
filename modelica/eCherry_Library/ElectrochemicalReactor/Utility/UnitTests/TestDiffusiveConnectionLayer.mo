within eCherry_Library.ElectrochemicalReactor.Utility.UnitTests;
model TestDiffusiveConnectionLayer

  import eCherry_Library.ElectrochemicalReactor.SpeciesPackage.*;

  parameter SpeciesRecord specRec(species={H2O, Hp, OHm});
  parameter Length cellWidth = 1 "in m";
  parameter Length cellHeight = 1 "in m";
  parameter Length connectionLayerWidth = 0.02 "in m";

  MaterialDomain.ConnectionLayers.DiffusiveConnectionLayer diffusiveConnection(
    specRec=specRec,
    Y=cellWidth,
    Z=cellHeight,
    dX=connectionLayerWidth,
    D={1e-4,1e-3,1e-4});

  MaterialDomain.Flows.FixedConcentrationsWithDiffFlowL leftSide(specRec=
        specRec, c={55.5,1e0,1e-14});
  MaterialDomain.Flows.FixedConcentrationsWithDiffFlowL rightSide(specRec=
        specRec, c={55.5,1e-14,1e0});

equation

  connect(leftSide.diffFlow, diffusiveConnection.leftFlow);
  connect(diffusiveConnection.rightFlow, rightSide.diffFlow);

  // Expectation:
  // Modeling 1D diffusion, namely H+ and OH- between pH=0 at the left side and pH=14 at right side
  // --> Expecting constant H+ flux from left to right and OH- flux from right to left.
  //     H+ flux should be larger b/c of higher DiffusionCoefficient
  // to be found @   Hp  diffusiveConnection.leftFlow.nFlow[2]
  //                 OHm diffusiveConnection.leftFlow.nFlow[3]
end TestDiffusiveConnectionLayer;
