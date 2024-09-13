within eCherry_Library.ElectrochemicalReactor.Utility;
function get_string_index "returns the index of string element in list"
  input String name;
  input String[:] list;
  output Integer index;
algorithm
  index := -1;
  for k in 1:size(list,1) loop
    if list[k] == name then
      index := k;
      return;
    end if;
  end for;
  return;
end get_string_index;
