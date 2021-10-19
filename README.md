# Prepopulated mysql container + specifying data folder at host

Build mysql image with prepopulated data and specify data at the host OS for future managing.

## Available Scripts

In the project directory, you can run below commands

### `./build.sh`

builds mysql docker image along with copying over database directory folder from container to Host.
setup.sql is also executed while preparing the mysql docker image.
change the root password on the Dockerfile.

### `./run.sh`

starts mysql docker image while mounting pre-initialized database directory.
change the root password on the Dockerfile.

### `./stop.sh`

stops mysql container

## Define examples

### Define prepopulated database

setup.sql included script to prepopulate database

### Define charset

charset is defined at 'charset.cnf' file

## How to check predefined database

`docker run -it --rm --link mysql mariadb:latest mysql -hmysql -uroot -proot myexample -e "select \* from mytable;"`

## How to access mysql through terminal

`mysql -h localhost -P 3306 --protocol=tcp -u root`
