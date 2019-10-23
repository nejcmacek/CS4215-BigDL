#!/bin/bash
./process-run.sh result/experiment1_0.005_128_10_1_0.001 --master spark://10.164.0.2:7077 --runtime 18000 --learningRate 0.005 --batchSize 128 --maxEpoch 10 --numberOfNodes 1 --lambda 0.001
./process-run.sh result/experiment1_0.01_128_10_1_0.001 --master spark://10.164.0.2:7077 --runtime 18000 --learningRate 0.01 --batchSize 128 --maxEpoch 10 --numberOfNodes 1 --lambda 0.001
./process-run.sh result/experiment1_0.02_128_10_1_0.001 --master spark://10.164.0.2:7077 --runtime 18000 --learningRate 0.02 --batchSize 128 --maxEpoch 10 --numberOfNodes 1 --lambda 0.001
