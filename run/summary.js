/**
 * Usage: node summary <output-file>
 */

const fs = require("fs")
const readline = require("readline")

let isShuttingDown = false
const stats = {
	duration: -1,
	jobCount: -1,
	start: null,
	shutdown: null,
	end: null,
	jobs: []
}

const processLine = line => {
	line = line.trim()
	if (!line)
		return

	const date = new Date(line.substr(0, 19)) // e.g. "2019/10/02 13:03:17"
	const content = line.substr(20).trimLeft()

	if (content.startsWith("Running for ")) {
		const res = content.match(/Running for (\d+) seconds/)
		if (!res) {
			console.log("'Running for' statement corrupted.")
			return
		}
		const jobs = Number(res[1])
		stats.duration = jobs
		stats.start = date
	} else if (content == "Shutting down ...") {
		stats.shutdown = date
		isShuttingDown = true
	} else if (isShuttingDown && content == " done!") {
		stats.end = date
	} else if (content.startsWith("[GEN] Generated new job ")) {
		const [, id] = content.match(/^\[GEN\] Generated new job (\d+)/)
		const num = Number(id) + 1
		stats.jobCount = Math.max(stats.jobCount, num)
	} else if (content.startsWith("[LOG-DONE]")) {
		const [, id, arrive, start, end] = content.match(/^\[LOG-DONE\] \d+,(\d+),\w+,(\d+\.?\d*),(\d+\.?\d*),(\d+\.?\d*)/)
		stats.jobs[id] = {
			arrive,
			start,
			end,
		}
	}
}

const onFinish = () => {
	const argv = process.argv.slice(2)
	const outFile = argv[0] || "summary.json"
	const content = JSON.stringify(stats, null, "\t")
	fs.writeFileSync(outFile, content)
}

const run = () => {
	const rl = readline.createInterface({ input: process.stdin })
	rl.on("line", processLine)
	rl.on("close", () => {
		rl.close()
		onFinish()
	})
}

run()

