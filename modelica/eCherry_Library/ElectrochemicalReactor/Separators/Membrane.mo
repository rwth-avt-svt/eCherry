within eCherry_Library.ElectrochemicalReactor.Separators;
model Membrane
  extends Separator_Base;

equation

  for k in 1:specRec.nSpec loop
    if specRec.species[k].name == "Water" then
      catCon. molFlow_vec[k] = 0; //
    elseif specRec.species[k].name == "Proton" then
      p.i = -catCon. molFlow_vec[k] * F; // link proton transport and current flow
    else
      catCon. molFlow_vec[k] = 0;
    end if;
  end for;

end Membrane;
