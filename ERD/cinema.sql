SET SESSION FOREIGN_KEY_CHECKS=0;

/* Drop Tables */

DROP TABLE IF EXISTS ci_user;




/* Create Tables */

CREATE TABLE ci_user
(
	id int NOT NULL AUTO_INCREMENT,
	username varchar(80) NOT NULL,
	password varchar(100) NOT NULL,
	name varchar(80) NOT NULL,
	authorities varchar(200) DEFAULT 'ROLE_MEMBER',
	regdate datetime DEFAULT now(),
	viewcnt int DEFAULT 0,
	PRIMARY KEY (id),
	UNIQUE (id),
	UNIQUE (username)
);



