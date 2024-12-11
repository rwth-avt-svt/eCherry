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
s = Simulator(modelName="eCherry_Library.Examples.Pyschik2024.MultipleElectrochemicalReactions", packagePath="eCherry_Library")

# whether to show dymola instance
#s.showGUI(show=True)

# whether  or not to exit dymola automatically (else can close manually or check if simulation crashed)
#s.exitSimulator(exitAfterSimulation=False)

# solver settings
s.setSolver(solver="Dassl")
s.setTolerance(1e-12)

# simulation settings
N = 2000
s.setStopTime(5)
s.setNumberOfIntervals(n=N)

last_indices = {i: 0 for i in ['constantCurrentDensity.jFixed', 'constantCurrentDensity.v', 'FaradaicEffH2','FaradaicEffCO2']}
data_list = []
csv_file = 'simulation_results.csv'
initialized = False

# setting paramters
for j in range(100, 201, 50):
    # Set simulation parameters
    s.addParameters({'constantCurrentDensity.jFixed': j})

    # Simulate the model
    s.simulate()

    # Define the variable reader
    r = Reader("MultipleElectrochemicalReactions.mat", "dymola")

    # Define variables to extract
    I = ['constantCurrentDensity.jFixed', 'constantCurrentDensity.v', 'FaradaicEffH2','FaradaicEffCO2']

    # Extract data from the simulation
    new_data = {}
    for i in I:
        values = r.values(i)
        data_values = values[1]  # Extract the data portion

        # Ensure data_values is a 2D array (even if only one row) to avoid dimensionality issues
        if len(data_values.shape) == 1:
            data_values = data_values.reshape(-1, 1)

        # Store the last row data for this variable
        new_data[i] = data_values[-1]

    # Create a DataFrame from the new data
    new_data_df = pd.DataFrame(new_data, index=[0])

    # Append the new data DataFrame to the CSV file
    if not initialized:  # Write the header only once
        new_data_df.to_csv(csv_file, mode='w', header=True, index=False)
        initialized = True
    else:  # For subsequent iterations, append without the header
        new_data_df.to_csv(csv_file, mode='a', header=False, index=False)

    # Append the new data DataFrame to the data list for final inspection
    data_list.append(new_data_df)

s.deleteOutputFiles()
final_data = pd.concat(data_list, ignore_index=True)
# print data
print(final_data)

