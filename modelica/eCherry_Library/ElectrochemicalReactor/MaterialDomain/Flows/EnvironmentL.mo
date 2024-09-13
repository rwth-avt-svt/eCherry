within eCherry_Library.ElectrochemicalReactor.MaterialDomain.Flows;
model EnvironmentL "Integrating an outflow, not imposing anything"

  // Species handling
  parameter Data.DataRecords.Species.SpeciesRecord specRec(nSpec=0);
  AmountOfSubstance mol_vec[specRec.nSpec]
                                          "collected amount";

  // Connectors
  Connectors.Material_Simple convFlow(specRec=specRec) annotation (Placement(
        transformation(extent={{0,-100},{20,-80}}), iconTransformation(extent={
            {-20,-120},{20,-80}})));
initial equation
  mol_vec=zeros(specRec.nSpec);
equation
  der(mol_vec)=convFlow.molFlow_vec;

  annotation (
    Icon(coordinateSystem(preserveAspectRatio=true,  extent={{-100,-100},{
          100,100}}), graphics={Ellipse(
        extent={{-100,100},{100,-100}},
        fillPattern=FillPattern.Sphere,
        fillColor={170,213,255}), Text(
        extent={{-150,12},{150,-18}},
        textString="V")}));
end EnvironmentL;
