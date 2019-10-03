# RUN Scripts

This directory contains helper functions used for running jobs on spark.


## Prerequisites

These scripts utilize Node.js, which you can install via

```bash
sudo apt install nodejs
node --version # check
```

Also, make sure `curl` is installed, too:

```bash
sudo apt install curl
curl --version # check
```


## Script Descriptions

Note that, due to portability reasons, I decided to keep certain paths not hardcoded but accessible via environmental variables. Thus, make sure that you have there set:
- `BD_SPARKGEN` - the directory of sparkgen, default is `/home/test/bd/sparkgen-bigdl`
- `SPARK_HOME` - the spark directory, default is `/home/test/bd/spark`
- `BD_CODES` - the directory of the provided custom codes, the default is `/home/test/bd/codes`

You can run `variables-check.sh` to check if these are defined. Make sure to define them globally, and for every run. You can do so by modifying the `/etc/environment` file (though you need to log out and log in again for this to take effect). This is exactly what the `variables-set.sh` does. Modify this file and run it, if you want to make things simple.

### process-once.sh

There's `process-once.sh`, which should be run only once, when these scripts are copied there. This check if all the required environmental variables are there, compiles the spark job generator (sparkgen), and backs-up some files.

### process-start.sh

The `process-start.sh` should be run one, before batch processing. It sets spark configuration, starts the master and the slave spark nodes, and checks that the spark server is running.

It takes three arguments, all of which are optional:

| arg                  | default          | description                      |
| -------------------- | ---------------- | -------------------------------- |
| master-url           | `localhost`      | url of master spark node         |
| master-port          | `7077`           | port of master spark node        |
| masterspark-web-addr | `localhost:8080` | address of the spark http server |

### process-end.sh

The `process-end.sh` is the opposite of `process-start.sh`. It terminates the slave and the master nodes.

### process-run.sh

The `process-run.sh` script runs the spark job generator on a spark cluster. It:
- generates the config file,
- runs sparkgen against that config file,
- neatly stores and analyses the produced output in an output directory.

It accepts several arguments, the first two are required:

| arg                       | default                  | description                        |
| ------------------------- | ------------------------ | ---------------------------------- |
| out-dir                   | (required)               | directory to store output files in |
| --master [val]            | `spark://localhost:7077` | sparkgen parameter                 |
| --lambda [val]            | `0.5`                  | sparkgen parameter                 |
| --runtime [val]           | `3`                   | sparkgen parameter                 |
| --preemptJobs [val]       | `0`                      | sparkgen parameter                 |
| --batchSize [val]         | `128`                    | bigdl hyperparameter               |
| --maxEpoch [val]          | `5`                      | bigdl hyperparameter               |
| --learningRate [val]      | `0.01`                   | bigdl hyperparameter               |
| --learningrateDecay [val] | `0.0002`                 | bigdl hyperparameter               |
| --executorMemory [val]    | `1G`
The system check for correct spelling of the flags to avoid issues that could go undetected. As usual, the flags don't need to be in order.

Note that defaults for `--lambda` and `--runtime` are adjusted such that running with no arguments doesn't take an hour (for testing purposes).

The output directory is created if not existent, the contents are overwritten, if existent. In that folder, you will find the configuration file, log files, and a summary file with (presumably) relevant info.

A `test` directory will be created in the current working directory from where the `process-run.sh` was run. This is the default behaviour of sparkgen, which puts output and error log files in this directory. This directory is not deleted by this script.
