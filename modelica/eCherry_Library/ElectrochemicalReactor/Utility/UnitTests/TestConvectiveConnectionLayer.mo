within eCherry_Library.ElectrochemicalReactor.Utility.UnitTests;
model TestConvectiveConnectionLayer

  import eCherry_Library.ElectrochemicalReactor.SpeciesPackage.*;

  parameter SpeciesRecord specRec(species={H2O, Hp, OHm});
  parameter Length cellWidth = 1 "in m";
  parameter Length cellHeight = 1 "in m";
  parameter Properties.MassTransferCoefficient h=1e-2 "in m/s";

  MaterialDomain.ConnectionLayers.ConvectiveConnectionLayer
    convectiveConnection(
    specRec=specRec,
    Y=cellWidth,
    Z=cellHeight,
    h=h);

  MaterialDomain.Flows.FixedConcentrationsWithDiffFlowL leftSide(specRec=
        specRec, c={55.5,1e0,1e-14});
  MaterialDomain.Flows.FixedConcentrationsWithDiffFlowL rightSide(specRec=
        specRec, c={55.5,1e-7,1e-7});

equation

  connect(leftSide.diffFlow, convectiveConnection.leftFlow);
  connect(convectiveConnection.rightFlow, rightSide.diffFlow);

  // Expectation:
  // Modeling convective transport between two compartments with fixed mass transfer coefficients.
  // Left side has pH=0 and right side has ph=7.
  // --> Expecting constant H+ flux from left to right and (much smaller) OH- flux from right to left
  // to be found @   Hp  diffusiveConnection.leftFlow.nFlow[2]
  //                 OHm diffusiveConnection.leftFlow.nFlow[3]
end TestConvectiveConnectionLayer;
