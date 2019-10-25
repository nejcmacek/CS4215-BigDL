#!/bin/bash
./process-run.sh result/experiment1_256_5_0.005_1 --master spark://10.164.0.2:7077 --runtime 28800  --learningRate 256 --batchSize 5 --maxEpoch 0.005 --numberOfNodes 1
