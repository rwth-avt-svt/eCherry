within eCherry_Library.ElectrochemicalReactor;
package DiscretizationZ "Package for discretizations on the Z axes"
  model cathodeGDE
    "fixed volume and pressure with convective in- and outflow + connection to cathode where N2 and H2 is exchanged to the channel"

    // package handling
    parameter Data.DataRecords.Species.SpeciesRecord specRec;
    parameter Data.DataRecords.Geometry GeoRec;
    parameter Data.DataRecords.Geometry GeoRecMem;
    parameter Data.DataRecords.Geometry GeoRecElec;
    parameter Data.DataRecords.Conditions CondRec;

    // discretization
    parameter Integer slices "number of segments";

    // input for cathode and anode
    parameter Integer nReac_A=size(reac_A,1);
    parameter Integer nReac_C=size(reac_C,1);
    parameter Data.DataRecords.ElecReaction.Reaction reac_A[:];
    parameter Data.DataRecords.ElecReaction.Reaction reac_C[:];
    constant Boolean CathodeElCat = true;
    constant Boolean CathodeElAn = false;
    parameter Real splitFactor = 0 "Quotient of H2 flow in Electrolyte versus in NitrogenChannel";

    // initial input for electrolyte and gas channel
    parameter Concentration c0_Electrolyte[specRec.nSpec] "initial concentration of electrolyte";
    constant Real mol_vec_frac0[specRec.nSpec] "fraction of initial amount of gas in the compartment; [0,1]";

    // model instances
    eCherry_Library.ElectrochemicalReactor.MaterialDomain.Compartments.Gas.GasChannel channel_n[slices](
      each specRec=specRec,
      each GeoRec=GeoRec,
      each CondRec=CondRec,
      each mol_vec_frac0=mol_vec_frac0);

    eCherry_Library.ElectrochemicalReactor.Electrodes.Electrode_GasDiffusion
      cathode_n[slices](
      each specRec=specRec,
      each GeoRec=GeoRec,
      each CondRec=CondRec,
      each splitFactor=splitFactor,
      each CathodeEl=CathodeElCat,
      each reac=reac_C);

    eCherry_Library.ElectrochemicalReactor.Electrolytes.Liquid.Electrolyte_Conti_0D_L catholyte_n[slices](
      each specRec=specRec,
      each GeoRec=GeoRecElec,
      each CondRec=CondRec,
      each c0=c0_Electrolyte);

    eCherry_Library.ElectrochemicalReactor.Separators.Diaphragm_Hydroxide
      membrane_n[slices](
      each specRec=specRec,
      each GeoRec=GeoRecMem,
      each CondRec=CondRec);

    eCherry_Library.ElectrochemicalReactor.Electrolytes.Liquid.Electrolyte_Conti_0D_L anolythe_n[slices](
      each specRec=specRec,
      each GeoRec=GeoRecElec,
      each CondRec=CondRec,
      each c0=c0_Electrolyte);

    eCherry_Library.ElectrochemicalReactor.Electrodes.Electrode_Planar anode_n[
      slices](
      each specRec=specRec,
      each GeoRec=GeoRec,
      each CondRec=CondRec,
      each reac=reac_A,
      each CathodeEl=CathodeElAn);

    // connectors
    Modelica.Electrical.Analog.Interfaces.PositivePin pin_p
      annotation (Placement(transformation(extent={{-110,-10},{-90,10}})));
    Modelica.Electrical.Analog.Interfaces.NegativePin pin_n
      annotation (Placement(transformation(extent={{90,-10},{110,10}})));
    MaterialDomain.Connectors.Material_Simple flowInAnolythe(specRec=specRec)
      annotation (Placement(transformation(extent={{-100,-110},{-80,-90}})));
    MaterialDomain.Connectors.Material_Simple flowInCatholyte(specRec=specRec)
      annotation (Placement(transformation(extent={{-10,-110},{10,-90}})));
    MaterialDomain.Connectors.Material_Simple flowInGasChannel(specRec=specRec)
      annotation (Placement(transformation(extent={{80,-110},{100,-90}})));
    MaterialDomain.Connectors.Material_Simple flowOutAnolythe(specRec=specRec)
      annotation (Placement(transformation(extent={{-100,90},{-80,110}})));
    MaterialDomain.Connectors.Material_Simple flowOutCatholyte(specRec=specRec)
      annotation (Placement(transformation(extent={{-10,90},{10,110}})));
    MaterialDomain.Connectors.Material_Simple flowOutGasChannel(specRec=specRec)
      annotation (Placement(transformation(extent={{80,90},{100,110}})));

  equation
    // connecting all submodels in order left to right
    // connect GasChannel segments with each other, connect first and last segment with model - vertical
    for i in 1:slices-1 loop
      connect(channel_n[i].flowOut, channel_n[i+1].flowIn);
    end for;
    connect(channel_n[1].flowIn, flowInGasChannel);
    connect(channel_n[end].flowOut, flowOutGasChannel);

    // connect catholyte segments with each other, connect first and last segment with model - vertical
    for i in 1:slices-1 loop
      connect(catholyte_n[i].outFlow, catholyte_n[i+1].inFlow);
    end for;
    connect(catholyte_n[1].inFlow, flowInCatholyte);
    connect(catholyte_n[end].outFlow, flowOutCatholyte);

    // connect anolythe segments with each other, connect first and last segment with model - vertical
    for i in 1:slices-1 loop
      connect(anolythe_n[i].outFlow, anolythe_n[i+1].inFlow);
    end for;
    connect(anolythe_n[1].inFlow, flowInAnolythe);
    connect(anolythe_n[end].outFlow, flowOutAnolythe);

    // connect each GasChannel segment with cathode segment - horizontal
    // connect each cathode segment with catholyte segment - horizontal
    // connect each catholyte segment with membrane segment - horizontal
    // connect each membrane segment with anolythe segment - hoorizontal
    // connect each anolythe segment with anode segment - horizontal
    for i in 1:slices loop
      connect(channel_n[i].flowFromElectrode, cathode_n[i].flowFromGas);
      connect(cathode_n[i].flowFromElectrolyte, catholyte_n[i].rightFlow);
      connect(catholyte_n[i].leftFlow, membrane_n[i].catCon);
      connect(membrane_n[i].anCon, anolythe_n[i].rightFlow);
      connect(anolythe_n[i].leftFlow, anode_n[i].flowFromElectrolyte);
    end for;

    // connect electrical circuit, electrolyte model segments (horizontal) connected in parallel, same outer voltage for each segment, i = sum(i_n)
    for i in 1:slices loop
      connect(pin_n, cathode_n[i].n);
      connect(cathode_n[i].p, catholyte_n[i].n);
      connect(catholyte_n[i].p, membrane_n[i].n);
      connect(membrane_n[i].p, anolythe_n[i].n);
      connect(anolythe_n[i].p, anode_n[i].n);
      connect(anode_n[i].p, pin_p);
    end for;

    annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
          coordinateSystem(preserveAspectRatio=false)));
  end cathodeGDE;
end DiscretizationZ;
