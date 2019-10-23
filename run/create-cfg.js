/**
 * Usage: node create-cfg --arg0 val0 --arg1 val1 --arg2 val2 ...
 */

const path = require("path")
const fs = require("fs")

/**
 * Parameters and their default values.
 * Specify these via CLI like this: "node program.js --path '/home/test/bd' --lambda 0.004"
 */
const defaultParams = {
	outFile: "config.json",
	runScript: "lenet5.py",
	pathCodes: "/home/test/bd/codes", // provided by the bash script
	pathSpark: "/home/test/bd/spark", // provided by the bash script
	master: "spark://localhost:7077",
	lambda: 0.5, // real default value: 0.004
	runtime: 3, // real default value: 3600
	preemptJobs: 0,
	batchSize: 128,
	maxEpoch: 5,
	learningRate: 0.01,
	learningrateDecay: 0.0002,
	driverCores: 1,
	totalExecutorCores: 1,
	executorCores: 1,
	executorMemory: "1G",
	numberOfNodes: 1
}

/**
 * Checks if arguments are in the correct format - and throws an error if not.
 * @param {Args} args 
 * @returns {Params}
 */
const buildParams = args => {
	const params = {}
	Object.entries(args).forEach(([name, val]) => {
		if (!(name in defaultParams))
			throw new Error(`Parameter "${name}" unrecognised.`)

		const isNum = !isNaN(Number(val))
		if ((typeof defaultParams[name] === "number") !== isNum)
			throw new Error(`Parameter "${name}" has an invalid type number/string.`)

		params[name] = isNum ? Number(val) : val
	})
	return { ...defaultParams, ...params }
}

/** 
 * Builds arguments from the given argv array.
 * @param {string[]} argv
 * @returns {Args}
 */
const buildArgs = argv => {
	const args = {}
	for (let i = 0; i < argv.length; i += 2) {
		if (!argv[i].startsWith("--"))
			throw new Error("Arguments must be specified with the -- prefix.")
		args[argv[i].substr(2)] = argv[i + 1]
	}
	return args
}

/**
 * Creates a configuration from the template, with given parameters.
 * @param {Params} params 
 */
const buildConfig = params => ({
	jobClassParameters: [{
		systemParameters: {
			driverCores: params.driverCores.toString(),
			driverMemory: "1G",
			totalExecutorCores: params.totalExecutorCores.toString(),
			executorCores: params.executorCores.toString(),
			executorMemory: params.executorMemory,
			pyFiles: path.resolve(params.pathSpark, "lib/bigdl-0.8.0-python-api.zip") + "," + path.resolve(params.pathCodes, params.runScript),
			propertiesFile: path.resolve(params.pathSpark, "conf/spark-bigdl.conf"),
			jars: path.resolve(params.pathSpark, "lib/bigdl-SPARK_2.3-0.8.0-jar-with-dependencies.jar"),
			conf: [
				"spark.driver.extraClassPath=" + path.resolve(params.pathSpark, "lib/bigdl-SPARK_2.3-0.8.0-jar-with-dependencies.jar"),
				"spark.executer.extraClassPath=bigdl-SPARK_2.3-0.8.0-jar-with-dependencies.jar " + path.resolve(params.pathCodes, params.runScript),
			],
			action: "train",
			dataPath: "~/bd/datasets/mnist",
		},
		hyperParameters: {
			batchSize: params.batchSize.toString(),
			maxEpoch: params.maxEpoch.toString(),
			learningRate: params.learningRate.toString(),
			learningrateDecay: params.learningrateDecay.toString(),
		},
		classProbability: 1,
		priorities: [{
			priority: 1,
			probability: 1,
		}],
	}],
	master: params.master,
	lambda: params.lambda,
	runtime: params.runtime,
	preemptJobs: params.preemptJobs,
	numberOfNodes: params.numberOfNodes,
})

const run = () => {
	const argv = process.argv.slice(2)
	const args = buildArgs(argv)
	const params = buildParams(args)
	const config = buildConfig(params)
	const content = JSON.stringify(config, null, "\t")
	fs.writeFileSync(params.outFile, content)
}

run()
