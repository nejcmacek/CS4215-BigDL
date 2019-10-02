# Check if the required environemnt variables exist
if [ -z "$SPARK_HOME" ]; then
	echo "Please set the SPARK_HOME variable."
	echo "It's default value is '~/bd/spark'."
	exit 1
fi

# Stop the slave node
echo "Shutting down the slave node..."
${SPARK_HOME}/sbin/stop-slave.sh

# Stop the master node
echo "Shutting down the master node..."
${SPARK_HOME}/sbin/stop-master.sh

echo "DONE!"
