within eCherry_Library.ElectrochemicalReactor.Separators;
model Diaphragm_Hydroxide
  "Model of proton exchange membrane with instant proton transport"
  extends Separator_Base;

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

end Diaphragm_Hydroxide;
