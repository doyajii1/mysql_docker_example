echo "starting container..."
docker run -it -d -p 3306:3306 -v $PWD/mysql_data/:/var/lib/mysql -v $PWD/charset.cnf:/etc/mysql/conf.d/charset.cnf -e MYSQL_ROOT_PASSWORD=root --rm --name mysql mysql_docker:v0.1
docker ps
echo "started!"
