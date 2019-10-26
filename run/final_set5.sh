#!/bin/bash
./process-run.sh result/experiment1_128_5_0.02_0.001_4 --master spark://10.164.0.2:7077 --runtime 18000  --batchSize 128 --maxEpoch 5 --learningRate 0.02 --lambda 0.001 --numberOfNodes 4
