#!/bin/bash
./process-run.sh result/experiment1_256_5_0.005_0.001_2 --master spark://10.164.0.2:7077 --runtime 18000  --batchSize 256 --maxEpoch 5 --learningRate 0.005 --lambda 0.001 --numberOfNodes 2