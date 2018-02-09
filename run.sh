TC_DATA=`pwd`/tc_data
TC_LOGS=`pwd`/tc_logs
mkdir -p $TC_DATA
mkdir -p $TC_LOGS
IMAGE="jetbrains/teamcity-server"

runningImages=`docker ps -aq -f "ancestor=$IMAGE"`
for i in $runningImages; do
    docker rm -f $i
done

docker run -it -d --name teamcity-server-instance  \
       -v $TC_DATA:/data/teamcity_server/datadir \
       -v $TC_LOGS:/opt/teamcity/logs  \
       -p 8111:8111 \
       $IMAGE
