type Params = {
	outFile: string
	pathCodes: string
	pathSpark: string
	master: string
	lambda: number
	runtime: number
	batchSize: number
	maxEpoch: number
	learningRate: number
	learningrateDecay: number
}

type Args = {
	[key: string]: string
}