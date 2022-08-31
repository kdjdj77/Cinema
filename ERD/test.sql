SET SESSION FOREIGN_KEY_CHECKS=0;

/* Drop Tables */

DROP TABLE IF EXISTS test;




/* Create Tables */

CREATE TABLE test
(
	id int NOT NULL AUTO_INCREMENT,
	PRIMARY KEY (id),
	UNIQUE (id)
);



