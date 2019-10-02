#
# Usage: 
# 	bash process-run
# 		<out-dir>                   # directory to store output files in
# 		[--master <val>]            # sparkgen parameter
# 		[--lambda <val>]            # sparkgen parameter
# 		[--runtime <val>]           # sparkgen parameter
# 		[--preemptJobs <val>]       # sparkgen parameter
# 		[--batchSize <val>]         # bigdl hyperparameter
# 		[--maxEpoch <val>]          # bigdl hyperparameter
# 		[--learningRate <val>]      # bigdl hyperparameter
# 		[--learningrateDecay <val>] # bigdl hyperparameter
#
# Check create-cfg.js for default values of optional parameters 
# denoted with [...].
#

# Check if the required environemnt variables exist
if [ -z "$SPARK_HOME" ]; then
	echo "Please set the SPARK_HOME variable."
	echo "It's default value is '~/bd/spark'."
	exit 1
fi

if [ -z "$BD_CODES" ]; then
	echo "Please set the BD_CODES variable."
	echo "It's default value is '~/bd/codes'."
	exit 1
fi

# Check number of arguments
if [ "$#" -lt 1 ]; then 
	echo "Invalid number of arguments."
	exit 1
fi

# Friendly variable names
outdir="$1"
dirname=$(dirname $0)

# Create outdir
mkdir -p $outdir

# Create the config file by running the nodejs process
echo "Generating config file..."
node $dirname/create-cfg \
	--outFile "$outdir/config.json" \
	--pathSpark "$SPARK_HOME" \
	--pathCodes "$BD_CODES" "${@:2}"

# Check if the config file was generated successfully
if [ "$?" -ne 0 ]; then
	echo "Error creating config file."
	exit 1;
fi

# Run the generator & analyse the result
echo "Running the generator..."
${BD_SPARKGEN}/src/sparkgen/sparkgen -r -d -c $outdir/config.json |& tee "$outdir/sparkgen-log.txt" | node $dirname/summary "$outdir/summary.json"

# Copy the first result files
if [ -f "test/0.100000.out" ]; then
	cp "test/0.100000.out" "$outdir/spark-log-0.100000.out"
fi

if [ -f "test/0.100000.err" ]; then
	cp "test/0.100000.err" "$outdir/spark-log-0.100000.err"
fi

echo "DONE!"
