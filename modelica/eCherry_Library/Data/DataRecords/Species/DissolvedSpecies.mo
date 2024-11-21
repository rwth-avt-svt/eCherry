within eCherry_Library.Data.DataRecords.Species;
record DissolvedSpecies "package for dissolved species"
    // Dissolved species
    // m after the chemical implies negative charge
    // mm after the chemical implies double negative charge
    // p after the chemical implies positive charge
    //TODO: THINGS TO BE ADDED ONE DAY BY KAEB (For the glycol reduction etc. - see below)

  constant Species Hp(
    name="Proton",
    M=1.00728e-3,
    charge=1,
    D=9.31*10^(-9),
    state=State.DissolvedInLiquid);
  constant Species OHm(
    name="Hydroxide",
    M=17.00734e-3,
    charge=-1,
    D=5.27*10^(-9),
    h0=229.756,
    state=State.DissolvedInLiquid);
  constant Species K2SO4(
    name="K2SO4",
    M=174.2592e-3,
    D=ElectrochemicalReactor.Utility.Common.Ddummy,
    state=State.DissolvedInLiquid);
                  //Potassium sulfate
  constant Species H2SO4(
    name="H2SO4",
    M=98.078e-3,
    D=ElectrochemicalReactor.Utility.Common.Ddummy,
    state=State.DissolvedInLiquid);
                  //Sulfuric Acid
  constant Species KHCO3(
    name="KHCO3",
    M=100.1151e-3,
    D=ElectrochemicalReactor.Utility.Common.Ddummy,
    state=State.DissolvedInLiquid);
  constant Species Kp(
    name="Kp",
    M=39.09830e-3,
    charge=1,
    D=1.96*10^(-9),
    state=State.DissolvedInLiquid);
               //Potassium Ion
  constant Species Nap(
    name="Nap",
    M=22.990e-3,
    charge=1,
    D=ElectrochemicalReactor.Utility.Common.Ddummy,
    state=State.DissolvedInLiquid);
               //Sodium Ion
   constant Species Lip(
    name="Lip",
    M=6.940e-3,
    charge=1,
    D=ElectrochemicalReactor.Utility.Common.Ddummy,
    state=State.DissolvedInLiquid);
               //Lithium Ion
  constant Species HCO3m(
    name="HCO3m",
    M=61.0168e-3,
    charge=-1,
    D=1.18*10^(-9),
    state=State.DissolvedInLiquid);
  constant Species CO3mm(
    name="CO3mm",
    M=60.0089e-3,
    charge=-2,
    D=0.955*10^(-9),
    state=State.DissolvedInLiquid);
  constant Species H2CO3(
    name="H2CO3",
    M=62.0248e-3,
    D=ElectrochemicalReactor.Utility.Common.Ddummy,
    state=State.DissolvedInLiquid);
  constant Species SO4mm(
    name="SO4mm",
    M=96.0626e-3,
    charge=-2,
    D=1.07*10^(-9),
    state=State.DissolvedInLiquid);
  constant Species HSO4m(
    name="HSO4m",
    M=97.0705e-3,
    charge=-1,
    D=1.33*10^(-9),
    state=State.DissolvedInLiquid);
  constant Species KOH(
    name="KOH",
    M=56.10564e-3,
    D=ElectrochemicalReactor.Utility.Common.Ddummy,
    state=State.DissolvedInLiquid);
  constant Species NaOH(
    name="NaOH",
    M=39.997e-3,
    D=ElectrochemicalReactor.Utility.Common.Ddummy,
    state=State.DissolvedInLiquid);
  constant Species NaHCO3(
    name="NaHCO3",
    M=84.01e-3,
    D=ElectrochemicalReactor.Utility.Common.Ddummy,
    state=State.DissolvedInLiquid);
    // Sodium bicarbonate aka baking soda
  constant Species KSO4m(
    name="KSO4m",
    M=135.16e-3,
    charge=-1,
    D=ElectrochemicalReactor.Utility.Common.Ddummy,
    state=State.DissolvedInLiquid);
  constant Species Na2SO4(
    name="Na2SO4",
    M=142.04e-3,
    D=ElectrochemicalReactor.Utility.Common.Ddummy,
    state=State.DissolvedInLiquid);
  constant Species Li2SO4(
    name="Li2SO4",
    M=109.94e-3,
    D=ElectrochemicalReactor.Utility.Common.Ddummy,
    state=State.DissolvedInLiquid);
  constant Species HCl(
    name="HCl",
    M=36.46e-3,
    D=ElectrochemicalReactor.Utility.Common.Ddummy,
    state=State.DissolvedInLiquid);
  constant Species Clm(
    name="Clm",
    M=35.454e-3,
    charge=-1,
    D=ElectrochemicalReactor.Utility.Common.Ddummy,
    state=State.DissolvedInLiquid);
    //Chlorine anion
  constant Species KH2PO4(
    name="KH2PO4",
    M=136.0855e-3,
    D=ElectrochemicalReactor.Utility.Common.Ddummy,
    state=State.DissolvedInLiquid);
    // Potassium phosphate, monobasic
  constant Species H2PO4m(
    name="H2PO4m",
    M=96.9878e-3,
    charge=-1,
    D=ElectrochemicalReactor.Utility.Common.Ddummy,
    state=State.DissolvedInLiquid);
          // H2PO4 anion

  constant Species Fe3p(
    name="Fe3p",
    M=55.845e-3,
    charge=3,
    D=0.604*10^(-9),
    state=State.DissolvedInLiquid);
  constant Species Fe2p(
    name="Fe2p",
    M=55.845e-3,
    charge=2,
    D=0.719*10^(-9),
    state=State.DissolvedInLiquid);
  constant Species Fc(
    name="ferrocene",
    M=186.04e-3,
    charge=0,
    D=2.7*10^(-9),
    state=State.DissolvedInLiquid);
   constant Species Fcp(
    name="ferrocenium",
    M=186.04e-3,
    charge=1,
    D=2.9*10^(-9),
    state=State.DissolvedInLiquid);
   constant Species NH3(
    name="Ammonia",
    M=17.031e-3,
    charge=0,
    D=ElectrochemicalReactor.Utility.Common.Ddummy,
    state=State.DissolvedInLiquid);

//EMPTY TEMPLATE
//   constant Species (
//     name="",
//     M=e-3,
//     charge=,
//     D=ElectrochemicalReactor.Utility.Common.Ddummy,
//     state=State.DissolvedInLiquid);

//TODO: THINGS TO BE ADDED ONE DAY BY KAEB (For the glycol reduction etc.)
/*
//glycerol oxidation products:
  constant Species GLA(name="GLA", M=106.08e-3, H0=-777010.64);//state=State.LiquidSolvent,
  constant Species GLAD(name="GLAD", M=90.08e-3, H0=-513209.44);//state=State.LiquidSolvent,
  constant Species DHA(name="DHA", M=90.08e-3, H0=-502205.52, cp1=-451944e3, cp2=4532.58e3, cp3=-7.49987e3, cp4=0, cp5=0, cp6=210.361, cp7=380.4);//state=State.LiquidSolvent,
  constant Species HPA(name="HPA", M=104.96e-3,H0=-668394, cp1=130829e3, cp2=-688.071e3, cp3=2.6648e3, cp4=0, cp5=0, cp6=290.906, cp7=526.05);// state=State.LiquidSolvent,
  constant Species TA(name="TartronicAcid", M=120.06e-3, H0=-964704.88, cp1=130829e3, cp2=-688.071e3, cp3=2.6648e3, cp4=0, cp5=0, cp6=411.736, cp7=744.55);//state=State.LiquidSolvent,
  constant Species MA(name="MA", M=118.04e-3, H0=-812114.4);//state=State.LiquidSolvent,
  constant Species LA(name="LacticAcid", M=90.08e-3, H0=-620194.32);//state=State.LiquidSolvent,
  constant Species GA(name="GA", M=76.05e-3, H0=-572203.84, cp1=-170580e3, cp2=1789.72e3, cp3=-2.06291e3, cp4=0, cp5=0, cp6=212.988, cp7=385.15);//state=State.LiquidSolvent,
  constant Species GLOA(name="GLOA", M=74.04e-3, H0=-466181.28, cp1=-96443.3e3, cp2=809.033e3, cp3=-0.538922e3, cp4=0, cp5=0, cp6=212.435, cp7=384.12);//state=State.LiquidSolvent,
  constant Species OA(name="OA", M=90.03e-3, H0=-722786, cp1=-59814.6, cp2=1013.11e3, cp3=-0.822139e3, cp4=0, cp5=0, cp6=352.952, cp7=638.25);//state=State.LiquidSolvent,
  constant Species AA(name="AceticAcid", M=60.05e-3,H0=-430115.2, cp1=45764.7e3, cp2=242.89e3, cp3=0.0390699e3, cp4=0, cp5=0, cp6=216.029, cp7=390.65);// state=State.LiquidSolvent,
  constant Species FA(name="FormicAcid", M=46.03e-3, H0=-377020.24, cp1=-120303e3, cp2=1326.59e3, cp3=-1.97802e3, cp4=0, cp5=0, cp6=206.628, cp7=373.65);//state=State.LiquidSolvent,*/

end DissolvedSpecies;
