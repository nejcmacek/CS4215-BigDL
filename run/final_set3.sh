#!/bin/bash
./process-run.sh result/experiment1_256_5_0.005_2 --master spark://10.164.0.2:7077 --runtime 28800  --learningRate 256 --batchSize 5 --maxEpoch 0.005 --Nodes 2
./process-run.sh result/experiment1_128_5_0.02_2 --master spark://10.164.0.2:7077 --runtime 28800  --learningRate 128 --batchSize 5 --maxEpoch 0.02 --Nodes 2