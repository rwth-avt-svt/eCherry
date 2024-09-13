import pandas as pd
from buildingspy.simulate.Dymola import Simulator
from buildingspy.io.outputfile import Reader
import matplotlib.pyplot as plt


### Note
# Unfortunately, I only got this running with modelica folder as working directory, so all files will be created there...

### Documentation
# https://simulationresearch.lbl.gov/modelica/buildingspy/

### Steps needed for setup ### (only tried with pycharm)
# 1) Install buildingspy, pandas and matplotlib python packages
# 2) Add Dymola.exe to your user path (windows: edit environmental variables for this users/umgebungsvariables für dieses konto ändern)
# 3) Set python working directory so that it ends with modelica folder '...ecrm\modelica' (not sure why everything else did not work for me)
# 4) Use and adapt this script

# plot setting
plt.rcParams.update({'font.size': 14})

# define model (and package) to simulate
s = Simulator(modelName="eCherry_Library.Examples.Pyschik2024.ElectrolyzerGraphicalFlowLOverpotentialExample", packagePath="eCherry_Library")

# whether to show dymola instance
s.showGUI(show=True)

# whether  or not to exit dymola automatically (else can close manually or check if simulation crashed)
#s.exitSimulator(exitAfterSimulation=False)

# solver settings
s.setSolver(solver="Dassl")
s.setTolerance(1e-12)

# simulation settings
N = 1000
s.setStopTime(300000)
s.setNumberOfIntervals(n=N)

# setting paramters
s.addParameters({'source.j0': 1})

# simulate model
s.simulate()

# define variable reader
r=Reader("ElectrolyzerGraphicalFlowLOverpotentialExample.mat", "dymola")
I = r.varNames()

# define variable data to extract (if not all data is extracted and put in dataframe/csv)
#I = ['source.j', 'source.v']

# extract data from simulation
data = pd.concat([pd.DataFrame(r.values(i)[1], columns=[i]) for i in I],axis=1)

for column in data.columns:
    #check which column if full with numeric values as then it also has the full time vector
    if data[column].count() == len(data.index):
        data = pd.concat([data, pd.DataFrame(r.values(column)[0], columns=['t'])],axis=1)
        break


#delete output files
s.deleteOutputFiles()

# print data
print(data)

# export data as csv
data.to_csv('simple_electrolyzer_results_all.csv')
# plot data
#plt.plot(data['source.j'], data['source.v'])
plt.plot(data['source.j'], -data['Cathode.reactions[1].actOp.etaRef'], label='Cathode act.')
plt.plot(data['source.j'], data['Anode.reactions[1].actOp.etaRef'], label='Anode act.')
plt.plot(data['source.j'], data['Catholyte.v'], label='Catholyte ohmic')
plt.plot(data['source.j'], data['Anolyte.v'], label='Anolyte ohmic')
plt.plot(data['source.j'], data['Diaphragm.v'], label='Diaphragm ohmic')

plt.ylabel('|$\eta$| / V')
plt.xlabel('$j$ / (A/m$^2$)')
plt.ylim(0,0.5)
plt.legend(frameon=False)
plt.tight_layout()
plt.savefig('Alkaline_Water_Electrolyzer_Example_separate.png')
plt.show()
plt.close()

data['tot_act'] = data['Anode.reactions[1].actOp.etaRef']-data['Cathode.reactions[1].actOp.etaRef']
data['tot_ohmic_bub_free'] = data['Catholyte.v']*(data['Catholyte.kappa']/data['Catholyte.kappa_L'][0]) + data['Anolyte.v']*(data['Anolyte.kappa']/data['Anolyte.kappa_L'][0]) + data['Diaphragm.v']
data['tot_ohmic_bub_add'] = data['Catholyte.v']- data['Catholyte.v']*(data['Catholyte.kappa']/data['Catholyte.kappa_L'][0]) + data['Anolyte.v'] - data['Anolyte.v']*(data['Anolyte.kappa']/data['Anolyte.kappa_L'][0])
data['j'] = data['source.j']
data[['tot_act', 'tot_ohmic_bub_free', 'tot_ohmic_bub_add', 'j']].to_csv('simple_electrolyzer_results.csv')

#plt.plot(data['source.j'], -data['Cathode.reactions[1].actOp.etaRef'], label='Cathode act.')
#plt.plot(data['source.j'], data['Anode.reactions[1].actOp.etaRef'], label='Anode act.')
print(data['Catholyte.v']*(data['Catholyte.kappa'][0]/data['Catholyte.kappa_L']) )
plt.plot(data['source.j'], data['Anode.reactions[1].actOp.etaRef']-data['Cathode.reactions[1].actOp.etaRef'], label='Total activation')
#plt.plot(data['source.j'], data['Catholyte.v'] + data['Anolyte.v'] + data['Diaphragm.v'], label='Total ohmic')
plt.plot(data['source.j'], data['Catholyte.v']*(data['Catholyte.kappa']/data['Catholyte.kappa_L'][0]) + data['Anolyte.v']*(data['Anolyte.kappa']/data['Anolyte.kappa_L'][0]) + data['Diaphragm.v'], label='Total ohmic (bubble free)')
plt.plot(data['source.j'], data['Catholyte.v']- data['Catholyte.v']*(data['Catholyte.kappa']/data['Catholyte.kappa_L'][0]) + data['Anolyte.v'] - data['Anolyte.v']*(data['Anolyte.kappa']/data['Anolyte.kappa_L'][0]), label='Add. bubble ohmic')

plt.ylabel('|$\eta$| / V')
plt.xlabel('$j$ / (A/m$^2$)')
plt.ylim(0,0.5)
plt.legend(frameon=False)
plt.tight_layout()
plt.savefig('Alkaline_Water_Electrolyzer_Example_total.png')
plt.show()
