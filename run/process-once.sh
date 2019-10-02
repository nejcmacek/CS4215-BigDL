# Check if the required environment variables exist
dirname=$(dirname $0)
if ! bash "$dirname/variables-check.sh"; then
	exit 1
fi

# Check if curl is installed
curl --version > /dev/null
if [ "$?" -ne 0 ]; then
	echo "Plese install 'curl'."
	exit 1
fi

# Build the generator
echo "Building the sparkgen file"
cd "$BD_SPARKGEN"
export GOPATH=$(pwd)
cd "src/sparkgen"
go build sparkgen.go

if [ "$?" -ne 0 ]; then
	echo "Could not build sparkgen file."
	exit 1
fi

# Create spark configuration backup file, since it gets overwritten.
if [ -f "$SPARK_HOME/conf/spark-env.sh" ] && [ ! -f "$SPARK_HOME/conf/spark-env.template.sh" ]; then
	echo "Making spark config bacup file."
	cp "$SPARK_HOME/conf/spark-env.sh" "$SPARK_HOME/conf/spark-env.template.sh"
fi

echo "DONE!"
