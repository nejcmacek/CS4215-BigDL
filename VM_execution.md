## Installation guide on new machines
    wget --no-check-certificate -r 'https://docs.google.com/uc?export=download&id=1kwQcWZNRVQ_kBfNvQJCEeedRV81dw63b' -O bd.zip
    sudo apt install unzip
    unzip bd.zip
    sudo add-apt-repository ppa:webupd8team/java
    sudo apt update
    sudo apt install openjdk-8-jdk

## Run the master
    bash bd/spark/sbin/start-master.sh

## Run the slave
    bash bd/spark/sbin/start-slave.sh spark://#MASTER SERVER#:7077

## Dependencies
    sudo apt-get install python --yes ; sudo apt-get install python-pip --yes ; sudo pip install bigdl ; sudo pip install matplotlib ; sudo pip install pandas ; sudo pip install numpy

## Install GO
    git clone https://github.com/canha/golang-tools-install-script ; cd golang-tools-install-script ; bash goinstall.sh

## Add link
    sudo ln -s /home/martijn01_vermeulen /home/test

## Add to ~/.bashrc
    sudo nano ~/.bashrc
    
    export SPARK_HOME="/home/test/bd/spark/"                                                                            
    export BIGDL_HOME="/home/test/bd/spark/"                                                                            
    export BD_CODES="/home/test/bd/codes"                                                                               
    export BD_SPARKGEN="/home/test/bd/sparkgen-bigdl"   
    export PATH=${SPARK_HOME}bin:$PATH
    export PATH=${SPARK_HOME}sbin:$PATH
    
    source ~/.bashrc

## Git clone
    git clone https://github.com/nejcmacek/CS4215-BigDL

## Start master:
    bash process-start.sh 1 0 10.164.0.2 7077 10.164.0.2:8080
    bash process-start.sh 1 0 34.90.55.237 7077 34.90.55.237:8080          


## Start slaves:
    bash process-start.sh 0 1 10.164.0.2 7077 10.164.0.2:8080
    bash process-start.sh 0 1 34.90.55.237 7077 34.90.55.237:8080      

## Then run on master
    bash process-run.sh results

## Stop it
    bash process-end.sh

## Copy the files from the git
    # While in sparkgen_go 
    mv $BD_SPARKGEN/src/sparkgen/sparkgen.go $BD_SPARKGEN/src/sparkgen/sparkgen_old.go 
    cp sparkgen.go $BD_SPARKGEN/src/sparkgen/
    
    # While in py_files
    mv $BD_CODES/lenet5.py $BD_CODES/lenet5_old.py
    cp lenet5_train_test.py $BD_CODES/lenet5.py
 
## Run the php server
    sudo php -S 0.0.0.0:81 &> /dev/null &