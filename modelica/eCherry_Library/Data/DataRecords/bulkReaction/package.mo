within eCherry_Library.Data.DataRecords;
package BulkReaction "Contains the homogeneneous chemical reactions as instances of record Reaction_homo."
  // the reactions are homogeneneous reactions
  //new type for defining which kind of reaction it is
  /////////////////TEMPLATE FOR REACTIONS
//     constant Reaction_homo NAME(
//       species={"","",""},
//       reac_type=reaction_type.equ,
//       reac_type=reaction_type.kin,
//       nu={-1,1,1},
//       nu_modified={0,1,1},
//       K=,
//       k=);

///////////////Actual Reactions below:////////////
  constant ReactionHom Water_equ(
    species={"Water","Proton","Hydroxide"},
    reac_type=ReactionType.equ,
    nu={-1,1,1},
    nu_modified={0,1,1},
    K=1e-14);

//////////////Electrolyte Disassociation Reactions
//////////////The CO2-Reactions Equilibria
  constant ReactionHom Carbonic_equ_I(
    species={"H2CO3","HCO3m","Proton"},
    reac_type=ReactionType.equ,
    nu={-1,1,1},
    K=0);
  constant ReactionHom Carbonic_equ_II(
    species={"HCO3m","CO3mm","Proton"},
    reac_type=ReactionType.equ,
    nu={-1,1,1},
    K=0);
  constant ReactionHom Carbonic_equ_0(
    species={"CO2","H2O","H2CO3"},
    reac_type=ReactionType.equ,
    nu={-1,1,1},
    K=0);

//////////////The CO2-Reactions Kinetics
  constant ReactionHom Carbonic_kin_I_forward(
    species={"H2CO3","HCO3m","Proton"},
    reac_type=ReactionType.kin,
    nu={-1,1,1},
    k=0);
  constant ReactionHom Carbonic_kin_I_backward(
    species={"H2CO3","HCO3m","Proton"},
    reac_type=ReactionType.kin,
    nu={-1,1,1}*(-1),
    k=0);
  constant ReactionHom Carbonic_kin_II_forward(
    species={"HCO3m","CO3mm","Proton"},
    reac_type=ReactionType.kin,
    nu={-1,1,1},
    k=0);
  constant ReactionHom Carbonic_kin_II_backward(
    species={"HCO3m","CO3mm","Proton"},
    reac_type=ReactionType.kin,
    nu={-1,1,1*(-1)},
    k=0);
  constant ReactionHom Carbonic_kin_0_forward(
    species={"CO2","H2O","H2CO3"},
    reac_type=ReactionType.kin,
    nu={-1,1,1},
    k=0);
  constant ReactionHom Carbonic_kin_0_backward(
    species={"CO2","H2O","H2CO3"},
    reac_type=ReactionType.kin,
    nu={-1,1,1}*(-1),
    k=0);

end BulkReaction;
