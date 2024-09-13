within eCherry_Library.ElectrochemicalReactor.Utility.array_functions;
function get_diffusion_distances "for a given vector you get the average of the width of adjacent elements divided by two,
  think the distance between the centers of finite distances"
  input  Real vec[:] "Input vector [n]";
  input Integer n = size(vec, 1); //this variable here should not need to exist
  output Real distances[n-1] "vector of distances between adjacent elements n-1";
protected
    Real distancesLocal[n-1];

algorithm
  // Calculate distances
  for i in 1:n-1 loop
    distancesLocal[i] := (vec[i] + vec[i+1])/2;
  end for;

  distances := distancesLocal;
end get_diffusion_distances;
