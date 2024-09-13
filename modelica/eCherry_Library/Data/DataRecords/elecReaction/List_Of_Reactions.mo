within eCherry_Library.Data.DataRecords.ElecReaction;
record List_Of_Reactions

   constant Reaction FCOR(
    species={"ferrocenium","ferrocene"},
    nu={-1,1},
    RO={-1,1},
    z=1,
    Eeq0=0.000,
    j0=21200,
    alpha_a=0.33,
    dH_app=0);     //1351,

   constant Reaction HERdummy(
    species={"Water","Hydrogen","Hydroxide"},
    nu={-2,1,2},
    RO={-2,1,2},
    z=2,
    Eeq0=-0.829,
    j0=1000,
    alpha_a=0.5,
    dH_app=0,
    Eth0=0.5809);

   constant Reaction OERdummy(
    species={"Oxygen","Water","Hydroxide"},
    nu={-0.5,-1,2},
    RO={-0.5,-1,1},
    z=2,
    Eeq0=0.401,
    j0=7,
    alpha_a=0.5,
    dH_app=0,
    Eth0=0.9002);

   constant Reaction COERAg(
    species={"Proton","CO2","CO","Water"},
    nu={-2,-1,1,1},
    RO={-2,-1,1,1},
    z=2,
    Eeq0=-0.103,
    j0=1.65*10^(-2),
    alpha_a=0.75,
    dH_app=0);     //0.75,
              //*10^(-2),
               //j0=2.12e-3, alpha_a=0.43

   constant Reaction HER(
    species={"Proton","Hydrogen"},
    nu={-2,1},
    RO={-2,1},
    z=2,
    Eeq0=0,
    j0=19.63*10^(-7),
    alpha_a=0.66,
    dH_app=0,
    Eth0=0.5809);    //0.64,
              //e-10,
                   //j0=6.57e-3, alpha_a=0.5

   constant Reaction OER(
    species={"Proton","Oxygen","Water"},
    nu={-2,-0.5,1},
    RO={-2,-0.5,1},
    z=2,
    Eeq0=1.229,
    j0=7.16,
    alpha_a=0.89,
    dH_app=0,
    Eth0=0.9002);

    constant Reaction HERdummy_EB_validation(
    species={"Water","Hydrogen","Hydroxide"},
     nu={-2,1,2},
     RO={-2,1,2},
     z=2,
     Eeq0=0,
     j0=0,
     alpha_a=0.5,
     Eth0=0.5809);

   constant Reaction OERdummy_EB_validation(
    species={"Oxygen","Water","Hydroxide"},
    nu={-0.5,-1,2},
    RO={-0.5,-1,1},
    z=2,
    Eeq0=0,
    j0=0,
    alpha_a=0.5,
    Eth0=0.9002);

  constant Reaction HERdummy_Sakas2022(
    species={"Water","Hydrogen","Hydroxide"},
    nu={-2,1,2},
    RO={-2,1,2},
    z=2,
    Eeq0=0,
    j0=0,
    alpha_a=0.5,
    reacEeq0TModel=ElectrochemicalReactor.Electrodes.Electrochemistry.Eeq0.Eeq0Tmodel.WaterElectrolysisEmpiric_Sakas2022);

  constant Reaction OERdummy_Sakas2022(
    species={"Oxygen","Water","Hydroxide"},
    nu={-0.5,-1,2},
    RO={-0.5,-1,1},
    z=2,
    Eeq0=0,
    j0=0,
    alpha_a=0.5,
    reacEeq0TModel=ElectrochemicalReactor.Electrodes.Electrochemistry.Eeq0.Eeq0Tmodel.WaterElectrolysisEmpiric_Sakas2022);

  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end List_Of_Reactions;
