/**
 * Usage: node summary <output-file>
 */

const fs = require("fs")
const readline = require("readline")

let isShuttingDown = false
const stats = {
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
		stats.jobCount = jobs
		stats.start = date
	} else if (content == "Shutting down ...") {
		stats.shutdown = date
		isShuttingDown = true
	} else if (isShuttingDown && content == " done!") {
		stats.end = date
	} else if (/^\[DIS-\d+\.\d+\] Starting job \d+:/.test(content)) {
		const job = Number(content.match(/^\[DIS-\d+\.\d+\] Starting job (\d+):/)[1])
		stats.jobs[job] = [date, null]
	} else if (/\[LOG-\d+\.\d+\] Job \d+ of class .+ ended with status/.test(content)) {
		const job = Number(content.match(/^\[LOG-\d+\.\d+\] Job (\d+) /)[1])
		if (stats.jobs[job])
			stats.jobs[job][1] = date
		else
			stats.jobs[job] = [null, date]
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

