#!/bin/bash
./process-run.sh result/experiment1_0.005_64_5_1_0.0005 --master spark://10.164.0.2:7077 --runtime 18000  --learningRate 0.005 --batchSize 64 --maxEpoch 5 --numberOfNodes 1 --lambda 0.0005
./process-run.sh result/experiment1_0.01_64_5_1_0.0005 --master spark://10.164.0.2:7077 --runtime 18000  --learningRate 0.01 --batchSize 64 --maxEpoch 5 --numberOfNodes 1 --lambda 0.0005
./process-run.sh result/experiment1_0.02_64_5_1_0.0005 --master spark://10.164.0.2:7077 --runtime 18000  --learningRate 0.02 --batchSize 64 --maxEpoch 5 --numberOfNodes 1 --lambda 0.0005

#!/bin/bash
./process-run.sh result/experiment1_0.005_128_5_1_0.0005 --master spark://10.164.0.2:7077 --runtime 18000  --learningRate 0.005 --batchSize 128 --maxEpoch 5 --numberOfNodes 1 --lambda 0.0005
./process-run.sh result/experiment1_0.01_128_5_1_0.0005 --master spark://10.164.0.2:7077 --runtime 18000  --learningRate 0.01 --batchSize 128 --maxEpoch 5 --numberOfNodes 1 --lambda 0.0005
./process-run.sh result/experiment1_0.02_128_5_1_0.0005 --master spark://10.164.0.2:7077 --runtime 18000  --learningRate 0.02 --batchSize 128 --maxEpoch 5 --numberOfNodes 1 --lambda 0.0005

#!/bin/bash
./process-run.sh result/experiment1_0.005_256_5_1_0.0005 --master spark://10.164.0.2:7077 --runtime 18000  --learningRate 0.005 --batchSize 256 --maxEpoch 5 --numberOfNodes 1 --lambda 0.0005
./process-run.sh result/experiment1_0.01_256_5_1_0.0005 --master spark://10.164.0.2:7077 --runtime 18000  --learningRate 0.01 --batchSize 256 --maxEpoch 5 --numberOfNodes 1 --lambda 0.0005
./process-run.sh result/experiment1_0.02_256_5_1_0.0005 --master spark://10.164.0.2:7077 --runtime 18000  --learningRate 0.02 --batchSize 256 --maxEpoch 5 --numberOfNodes 1 --lambda 0.0005

#!/bin/bash
./process-run.sh result/experiment1_0.005_64_10_1_0.0005 --master spark://10.164.0.2:7077 --runtime 18000  --learningRate 0.005 --batchSize 64 --maxEpoch 10 --numberOfNodes 1 --lambda 0.0005
./process-run.sh result/experiment1_0.01_64_10_1_0.0005 --master spark://10.164.0.2:7077 --runtime 18000  --learningRate 0.01 --batchSize 64 --maxEpoch 10 --numberOfNodes 1 --lambda 0.0005
./process-run.sh result/experiment1_0.02_64_10_1_0.0005 --master spark://10.164.0.2:7077 --runtime 18000  --learningRate 0.02 --batchSize 64 --maxEpoch 10 --numberOfNodes 1 --lambda 0.0005

#!/bin/bash
./process-run.sh result/experiment1_0.005_128_10_1_0.0005 --master spark://10.164.0.2:7077 --runtime 18000  --learningRate 0.005 --batchSize 128 --maxEpoch 10 --numberOfNodes 1 --lambda 0.0005
./process-run.sh result/experiment1_0.01_128_10_1_0.0005 --master spark://10.164.0.2:7077 --runtime 18000  --learningRate 0.01 --batchSize 128 --maxEpoch 10 --numberOfNodes 1 --lambda 0.0005
./process-run.sh result/experiment1_0.02_128_10_1_0.0005 --master spark://10.164.0.2:7077 --runtime 18000  --learningRate 0.02 --batchSize 128 --maxEpoch 10 --numberOfNodes 1 --lambda 0.0005

#!/bin/bash
./process-run.sh result/experiment1_0.005_256_10_1_0.0005 --master spark://10.164.0.2:7077 --runtime 18000  --learningRate 0.005 --batchSize 256 --maxEpoch 10 --numberOfNodes 1 --lambda 0.0005
./process-run.sh result/experiment1_0.01_256_10_1_0.0005 --master spark://10.164.0.2:7077 --runtime 18000  --learningRate 0.01 --batchSize 256 --maxEpoch 10 --numberOfNodes 1 --lambda 0.0005
./process-run.sh result/experiment1_0.02_256_10_1_0.0005 --master spark://10.164.0.2:7077 --runtime 18000  --learningRate 0.02 --batchSize 256 --maxEpoch 10 --numberOfNodes 1 --lambda 0.0005

#!/bin/bash
./process-run.sh result/experiment1_0.005_64_20_1_0.0005 --master spark://10.164.0.2:7077 --runtime 18000  --learningRate 0.005 --batchSize 64 --maxEpoch 20 --numberOfNodes 1 --lambda 0.0005
./process-run.sh result/experiment1_0.01_64_20_1_0.0005 --master spark://10.164.0.2:7077 --runtime 18000  --learningRate 0.01 --batchSize 64 --maxEpoch 20 --numberOfNodes 1 --lambda 0.0005
./process-run.sh result/experiment1_0.02_64_20_1_0.0005 --master spark://10.164.0.2:7077 --runtime 18000  --learningRate 0.02 --batchSize 64 --maxEpoch 20 --numberOfNodes 1 --lambda 0.0005

#!/bin/bash
./process-run.sh result/experiment1_0.005_128_20_1_0.0005 --master spark://10.164.0.2:7077 --runtime 18000  --learningRate 0.005 --batchSize 128 --maxEpoch 20 --numberOfNodes 1 --lambda 0.0005
./process-run.sh result/experiment1_0.01_128_20_1_0.0005 --master spark://10.164.0.2:7077 --runtime 18000  --learningRate 0.01 --batchSize 128 --maxEpoch 20 --numberOfNodes 1 --lambda 0.0005
./process-run.sh result/experiment1_0.02_128_20_1_0.0005 --master spark://10.164.0.2:7077 --runtime 18000  --learningRate 0.02 --batchSize 128 --maxEpoch 20 --numberOfNodes 1 --lambda 0.0005

#!/bin/bash
./process-run.sh result/experiment1_0.005_256_20_1_0.0005 --master spark://10.164.0.2:7077 --runtime 18000  --learningRate 0.005 --batchSize 256 --maxEpoch 20 --numberOfNodes 1 --lambda 0.0005
./process-run.sh result/experiment1_0.01_256_20_1_0.0005 --master spark://10.164.0.2:7077 --runtime 18000  --learningRate 0.01 --batchSize 256 --maxEpoch 20 --numberOfNodes 1 --lambda 0.0005
./process-run.sh result/experiment1_0.02_256_20_1_0.0005 --master spark://10.164.0.2:7077 --runtime 18000  --learningRate 0.02 --batchSize 256 --maxEpoch 20 --numberOfNodes 1 --lambda 0.0005
