#!/bin/bash
./process-run.sh result/experiment1_64_20_0.02_0.001_2 --master spark://10.164.0.2:7077 --runtime 28800  --batchSize 64 --maxEpoch 20 --learningRate 0.02 --lambda 0.001 --numberOfNodes 2
./process-run.sh result/experiment1_256_5_0.005_0.001_4 --master spark://10.164.0.2:7077 --runtime 28800  --batchSize 256 --maxEpoch 5 --learningRate 0.005 --lambda 0.001 --numberOfNodes 4
