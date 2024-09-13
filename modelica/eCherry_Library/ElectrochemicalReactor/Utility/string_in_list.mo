within eCherry_Library.ElectrochemicalReactor.Utility;
function string_in_list
  input String name;
  input String[:] list;
  output Boolean nameIsInList;
algorithm
  nameIsInList := false;
  for i in 1:size(list,1) loop
    if list[i] == name then
      nameIsInList := true;
      return;
    end if;
  end for;
  return;
end string_in_list;
