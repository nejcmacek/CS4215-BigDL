#!/usr/bin/env python
# coding: utf-8
import pyDOE2
import pandas as pd

## The standard variables

out_start = "result/experiment"
server_url = "spark://10.164.0.2:7077"

## Input

experiments = pd.DataFrame.from_dict(eval(input("Input experiment dict: ")))
print(experiments)
labels = experiments.columns.to_list()

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