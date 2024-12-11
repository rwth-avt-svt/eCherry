import pandas as pd
from buildingspy.simulate.Dymola import Simulator
from buildingspy.io.outputfile import Reader
import matplotlib.pyplot as plt
import math
### INSTRUCTION IS IN OTHER PYTHON FILE ###


plt.rcParams.update({'font.size': 14})

s = Simulator(modelName="eCherry_Library.Examples.Pyschik2024.CyclicVoltammetry", packagePath="eCherry_Library")

#s.showGUI(show=True)
#s.exitSimulator(exitAfterSimulation=False)

s.setSolver(solver="Dassl")
s.setTolerance(1e-12)


N = 1000
n_slices = 500

CV_data = pd.DataFrame()

for v in [10]: #[0.05, 0.1, 0.2, 0.5, 1,2,5, 10]:
    tau = 2 * 0.7 / v
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
    s.addParameters({'Anolyte.n_slices':n_slices})

    s.simulate()
    r=Reader("CyclicVoltammetry.mat", "dymola")

    I = r.varNames()
    I = ['source.i', 'source.v', 'Anode.reactions[1].actOp.etaRef', 'Anode.reactions[1].actOp.i']

    for i in range(1,n_slices+1):
        I.append(f'Anolyte.slices[{i}].c[1]')
        I.append(f'Anolyte.slices[{i}].c[2]')
        I.append(f'Anolyte.slices[{i}].c[3]')

    data = pd.concat([pd.DataFrame(r.values(i)[1], columns=[i]) for i in I],axis=1)

    for column in data.columns:
        #check which column if full with numeric values as then it also has the full time vector
        if data[column].count() == len(data.index):
            data = pd.concat([data, pd.DataFrame(r.values(column)[0], columns=['t'])],axis=1)
            break

    data = data[int(len(data)/2):-1]
    data = data.reset_index()
    c1_0 = []
    c1_1 = []
    c1_2 = []
    c1_3 = []
    E_j_c_data = pd.DataFrame()
    len = len(data.index)
    idx = [0, round(len/2), round(len*2/3), len-1]
    E_j_c_data['i_' + str(v)] = data.iloc[idx]['Anode.reactions[1].actOp.etaRef']
    E_j_c_data['E_' + str(v)] = data.iloc[idx]['Anode.reactions[1].actOp.i']
    E_j_c_data['E_' + str(v)] = E_j_c_data['E_' + str(v)]*(3.14)*(0.003**2)/4*10**6/10

    for i in range(1,int(n_slices+1)):
        c1_0.append(data.iloc[0][f'Anolyte.slices[{i}].c[1]'])
        c1_1.append(data.iloc[round(len/2)][f'Anolyte.slices[{i}].c[1]'])
        c1_2.append(data.iloc[round(len*2/3)][f'Anolyte.slices[{i}].c[1]'])
        c1_3.append(data.iloc[len-1][f'Anolyte.slices[{i}].c[1]'])


    c1_0.append(data.iloc[0][f'Anolyte.slices[{i}].c[1]'])
    c1_1.append(data.iloc[round(len/2)][f'Anolyte.slices[{i}].c[1]'])
    c1_2.append(data.iloc[round(len*2/3)][f'Anolyte.slices[{i}].c[1]'])
    c1_3.append(data.iloc[len-1][f'Anolyte.slices[{i}].c[1]'])

    plt.plot(data['Anode.reactions[1].actOp.etaRef'])
    plt.show()
    plt.close()
    plt.plot(c1_0, label='0/3 t')
    plt.plot(c1_1, label='1/2 t')
    plt.plot(c1_2, label='2/3 t')
    plt.plot(c1_3, label='3/3 t')
    plt.legend()
    plt.savefig(f'conc_{v}.png')
    plt.show()
    plt.close()
    CV_data['E_' + str(v)] = data['Anode.reactions[1].actOp.etaRef']
    CV_data['i_' + str(v)] = data['Anode.reactions[1].actOp.i']*(3.14)*(0.003**2)/4*10**6/10
    c_data = pd.DataFrame()
    c_data['c1_0_' + str(v)] = c1_0
    c_data['c1_1_' + str(v)] = c1_1
    c_data['c1_2_' + str(v)] = c1_2
    c_data['c1_3_' + str(v)] = c1_3
    c_data['x'] = [elm*dx/(n_slices + 1) for elm in list(c_data.index)]

    plt.plot(data['Anode.reactions[1].actOp.etaRef'], data['Anode.reactions[1].actOp.i']*(3.14)*(0.003**2)/4*10**6/10, label=str(v) + 'V/s')

s.deleteOutputFiles()
plt.gca().invert_xaxis()
plt.gca().invert_yaxis()
plt.legend(frameon=False)
plt.tight_layout()
plt.show()
data.to_csv('output.csv')
CV_data.to_csv('CV_results.csv')
E_j_c_data.to_csv('E_j_c_data.csv')
c_data.to_csv('CV_conc_results.csv')