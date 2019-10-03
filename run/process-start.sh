#
# Usage:
# 	bash process-start
#     [start-master]   # whether to run this node as a master
#     [start-slave]    # whether to run this node as a slave
#     [master-url]     # url of master spark node (default: localhost)
# 		[master-port]    # port of master spark node (default: 7077)
# 		[spark-web-addr] # address of spark http server (default: localhost:8080)
#

# Give arguments meaningful name and provide default values
useMaster=${1:-1}
useSlave=${2:-0}
masterURL=${3:-localhost}
port=${4:-7077}
httpsparkaddr=${5:-localhost:8080}
httpsparkurl="http://$httpsparkaddr/"

# Check if the required environemnt variables exist
if [ -z "$SPARK_HOME" ]; then
  echo "Please set the SPARK_HOME variable."
  echo "It's default value is '~/bd/spark'."
  exit 1
fi

# Create spark configuration file
echo "Creating spark config file..."
echo "SPARK_MASTER_HOST='$masterURL'" >$SPARK_HOME/conf/spark-env.sh

if [ "$useMaster" -eq "1" ]; then
  # Start the master node
  echo "Starting master node..."
  ${SPARK_HOME}/sbin/start-master.sh
fi

if [ "$useSlave" -eq "1" ]; then
  # Start the slave node
  echo "Starting slave node..."
  ${SPARK_HOME}/sbin/start-slave.sh "spark://$masterURL:$port"
fi
echo "Contacting spark http server..."
curl --head $httpsparkurl >/dev/null 2>&1 || {
  echo "Could not reach http spark server at '$httpsparkurl'"
  exit 1
}

echo "DONE!"
