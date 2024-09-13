within eCherry_Library.Data.DataRecords.BulkReaction;
record ReactionHom "Storing relevant data for electrochemical Reaction"

//actual definition
 constant String[:] species;
 constant Real[:] nu       "used to formulate the balance equation";
 constant Real[:] nu_modified=nu  "used for the kinetic/equilibrium reaction, where some concentrations might be neglected e.g. water";
                             // Per default these two are identical
                             // However, if the reaction ignores water as a solvent
                             // or if it is weird or different or might have a different reaction order this can be useful.
                             // This solution is slightly inelegant, but offers flexibility/generalizability
  constant ReactionType reac_type=ReactionType.non;
 constant Real k "Kinetic constant";
 constant Real K "Equilibrium constant";
 constant Temperature T0=298.15;

end ReactionHom;
