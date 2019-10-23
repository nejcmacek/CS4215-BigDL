#!/usr/bin/env python
# coding: utf-8
import pyDOE2
import pandas as pd

## The standard variables

out_start = "result/experiment"
server_url = "spark://10.164.0.2:7077"

## Set the default levels
labels = ["learningRate", "batchSize", "maxEpoch", "numberOfNodes", "lambda"]

levels = []
levels.append([0.005, 0.01, 0.02])
levels.append([64, 128, 256])
levels.append([5, 10, 20])
levels.append([1])
levels.append([0.0005])


for i in range(len(labels)):
    try:
        levels[i] = eval(input(labels[i] + " (default "+str(levels[i])+"): "))
    except:
        pass

level_sizes = []
for sub in levels:
    level_sizes.append(len(sub))
experiments = pd.DataFrame(pyDOE2.fullfact(level_sizes), columns=labels)
i = -1
for col in experiments.columns:
    i = i + 1
    experiments[col] = experiments[col].apply(lambda x: levels[i][int(x)])
    
print(experiments)


## Print the commands
try:
    number_rep = int(input("Number of repetitions (default 1): "))
except:
    number_rep = 1

try:
    runtime = int(input("Runtime in s (default 18000 - 5 hours): "))
except:
    runtime = 18000

file_n = input("What file?: ")

f= open(file_n,"w+")
f.write("#!/bin/bash\n")

for rep in range(number_rep):
    for i in range(len(experiments)):
        back_command = ""
        command = ""
        outdir = out_start + str((rep+1))

        for label in labels:
            back_command = back_command + " --" + label + " " + str(experiments[label][i])
            outdir = outdir + "_" + str(experiments[label][i])

        command = "./process-run.sh " + outdir + " --master " + server_url + " --runtime " + str(runtime) + " " + back_command
        print(command)
        f.write(command + "\n")