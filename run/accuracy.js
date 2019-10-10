const fs = require("fs")
const path = require("path")

// Example file structure:
//   Evaluated result: 0.490999996662, total_num: 10000, method: Top1Accuracy
//   Evaluated result: 0.887700021267, total_num: 10000, method: Top5Accuracy
//   Evaluated result: 2.11374759674, total_num: 79, method: Loss

// a list of files to process
const files = process.argv.slice(2)
const results = {}

files.forEach(file => {
	const content = fs.readFileSync(file, { encoding: "utf-8" })

	const [, top1, top1num] = content.match(/Evaluated result: (\d+\.?\d*), total_num: (\d+), method: Top1Accuracy/) || [, null, null]
	const [, top5, top5num] = content.match(/Evaluated result: (\d+\.?\d*), total_num: (\d+), method: Top5Accuracy/) || [, null, null]
	const [, loss, lossnum] = content.match(/Evaluated result: (\d+\.?\d*), total_num: (\d+), method: Loss/) || [, null, null]

	const node = { top1, top1num, top5, top5num, loss, lossnum }
	const name = path.basename(file)
	if (results[name])
		name = path
	results[name] = node
})

console.log(JSON.stringify(results))
