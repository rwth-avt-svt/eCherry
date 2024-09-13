within eCherry_Library.Data.DataRecords.ElecReaction;
record Reaction "Storing relevant data for electrochemical Reaction"
 constant String[:] species;
 constant Real[:] nu;
 parameter Real [:] RO={0,0};                                         //default value since not always used
 constant Integer z "number of electrons transferred (positive)";
 Real Eeq0 "for Nernst equation";
 Real j0 "for BV equation";
 Real alpha_a "for BV equation";
 Real alpha_c=1-alpha_a "for BV equation";
 parameter Voltage Eth0=0 "Standard Thermoneutral Voltage"; //default value since not always used
 parameter Real Cp=0 "Heat capacity"; //=sum(\nu_i*cp_i for in in 1:nSpec)
 parameter Real dH_app=-100000 "for j0 T-dependence in BV equation";  //default value since not always used
 parameter Real dS_r = 0 "for Eeq0 T-dependence in Nernst equation";  //default value since not always used
  constant ElectrochemicalReactor.Electrodes.Electrochemistry.Eeq0.Eeq0Tmodel
    reacEeq0TModel=ElectrochemicalReactor.Electrodes.Electrochemistry.Eeq0.Eeq0Tmodel.Constant
    "specifying the model for Eeq0 T-dependence";

end Reaction;
