type Params = {
	outFile: string
	runScript: string
	pathCodes: string
	pathSpark: string
	master: string
	lambda: number
	runtime: number
	batchSize: number
	maxEpoch: number
	learningRate: number
	learningrateDecay: number
	driverCores: number
	totalExecutorCores: number
	executorCores: number
	executorMemory: string
	preemptJobs: number
	numberOfNodes: number
}

type Args = {
	[key: string]: string
}