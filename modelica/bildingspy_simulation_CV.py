import pandas as pd
from buildingspy.simulate.Dymola import Simulator
from buildingspy.io.outputfile import Reader
import matplotlib.pyplot as plt
import math
### INSTRUCTION IS IN OTHER PYTHON FILE ###


plt.rcParams.update({'font.size': 14})

s = Simulator(modelName="eCherry_Library.Examples.Pyschik2024.ElectrolyzerGraphical1DCVExample", packagePath="eCherry_Library")

#s.showGUI(show=True)
#s.exitSimulator(exitAfterSimulation=False)

s.setSolver(solver="Dassl")
s.setTolerance(1e-12)


N = 1000

CV_data = pd.DataFrame()

for v in [0.5]: #[0.05, 0.1, 0.2, 0.5, 1,2,5, 10]:
    tau = 2 * 1 / v
    d_n = (math.pi* 2.9 * 10 ** -9 * tau)**0.5
    dx = 10*d_n
    t = 2*tau
    s.setStopTime(t)
    s.setNumberOfIntervals(n=N)
    s.addParameters({'source.Scanrate':v})
    s.addParameters({'Anolyte.X_difflayer':dx})
    if True:
        Z = 10
        s.addParameters({'Anolyte.Z':Z})
        s.addParameters({'electrolyte.Z':Z})
        s.addParameters({'diffusiveConnectionLayer.Z':Z})
        s.addParameters({'Anode.Z':Z})
        s.addParameters({'source.Z':Z})
    s.addParameters({'Anolyte.n_slices':500})

    s.simulate()
    r=Reader("ElectrolyzerGraphical1DCVExample.mat", "dymola")

    I = r.varNames()
    I = ['source.i', 'source.v', 'Anode.reactions[1].actOp.etaRef', 'Anode.reactions[1].actOp.i']

    data = pd.concat([pd.DataFrame(r.values(i)[1], columns=[i]) for i in I],axis=1)

    for column in data.columns:
        #check which column if full with numeric values as then it also has the full time vector
        if data[column].count() == len(data.index):
            data = pd.concat([data, pd.DataFrame(r.values(column)[0], columns=['t'])],axis=1)
            break

    print(data)
    data = data[int(len(data)/2):-1]
    CV_data['E_' + str(v)] = data['Anode.reactions[1].actOp.etaRef']
    CV_data['i_' + str(v)] = data['Anode.reactions[1].actOp.i']*(3.14)*(0.003**2)/4*10**6/10

    plt.plot(data['Anode.reactions[1].actOp.etaRef'], data['Anode.reactions[1].actOp.i']*(3.14)*(0.003**2)/4*10**6/10, label=str(v) + 'V/s')
    # plt.xlabel('$E$ / V')
    # plt.ylabel('$i$ / $\mathrm{\mu}$A')

s.deleteOutputFiles()
plt.gca().invert_xaxis()
plt.gca().invert_yaxis()
plt.legend(frameon=False)
plt.tight_layout()
# plt.savefig('CV_Example_Simulation_500elm_10m2_all.png')
plt.show()
# data.to_csv('output.csv')
# CV_data.to_csv('CV_results.csv')
# plt.close()

