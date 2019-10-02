# Check if the required environemnt variables exist
if [ -z "$BD_SPARKGEN" ]; then
	echo "Please set the BD_SPARKGEN variable."
	echo "It's default value is '~/bd/sparkgen-bigdl'."
	exit 1
fi

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
