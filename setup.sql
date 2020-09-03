/*This script was copied from "https://github.com/lindycoder/prepopulated-mysql-container-example"*/

CREATE DATABASE myexample;

USE myexample;

CREATE TABLE mytable (myfield VARCHAR(20));

INSERT INTO mytable VALUES ('Hello'), ('Dolly');
