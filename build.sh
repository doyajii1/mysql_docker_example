#backup data directory if directoy exist
#checks if /mysql_data folder exists
if [ -d "./mysql_data" ] 
then
    #creates backup directory
    echo "Directory ./mysql_data exists. Creating backup..." 
    if [[ ! -e "./backup" ]]; then
        mkdir "./backup"
    fi
    date_dir_path=$(date +'%Y/%m/%d')
    time=$(date +%H-%M-%S)
    #prepares backup directory in Year/Month/Date/time/
    #-p parameter creates directories if any of them are not found
    mkdir -p ./backup/$date_dir_path/$time/
    echo "Moved ./mysql_data to ./backup/$date_dir_path/$time" 
    mv -f ./mysql_data ./backup/$date_dir_path/$time/
else
    echo "Directory ./mysql_data does not exists. Nothing to backup..."
fi


echo "attempt to stop any mysql container..."
docker stop mysql

echo "execute docker-compose build..."
docker build --tag mysql_docker:v0.1 .
docker run -it -d -p 3306:3306 --rm --name mysql mysql_docker:v0.1

echo "copying database file to host..."
docker cp mysql:/var/lib/mysql/ ./mysql_data/

echo "stopping container..."
docker stop mysql

echo "finished!"