within eCherry_Library.ElectrochemicalReactor.Separators;
model DiaphragmHydroxide
  "Model of proton exchange membrane with instant proton transport"
  extends MembraneBase;

equation

  for k in 1:specRec.nSpec loop
    if specRec.species[k].name == "Water" then
      catCon.molFlow_vec[k] = 0; //
    elseif specRec.species[k].name == "Hydroxide" then
      p.i = catCon.molFlow_vec[k] * F; // link proton transport and current flow
    else
      catCon.molFlow_vec[k] = 0;
    end if;
  end for;

end DiaphragmHydroxide;
