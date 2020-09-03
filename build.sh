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