SET SESSION FOREIGN_KEY_CHECKS=0;

/* Drop Tables */

DROP TABLE IF EXISTS diary;
DROP TABLE IF EXISTS diaryBoard;
DROP TABLE IF EXISTS genLikeTable;
DROP TABLE IF EXISTS reply;
DROP TABLE IF EXISTS genBoard;
DROP TABLE IF EXISTS infoLikeTable;
DROP TABLE IF EXISTS infoBoard;
DROP TABLE IF EXISTS map;
DROP TABLE IF EXISTS testResult;
DROP TABLE IF EXISTS users;




/* Create Tables */

CREATE TABLE diary
(
	uid varchar(20) NOT NULL,
	dayStr char(8) NOT NULL,
	anniversary varchar(20),
	title varchar(80),
	content varchar(800),
	sentiment varchar(20),
	isHoliday int DEFAULT 0,
	score int
);


CREATE TABLE diaryBoard
(
	did int NOT NULL AUTO_INCREMENT,
	uid varchar(20) NOT NULL,
	title varchar(80) NOT NULL,
	content varchar(800),
	modTime datetime DEFAULT CURRENT_TIMESTAMP NOT NULL,
	isDeleted int DEFAULT 0 NOT NULL,
	files varchar(100),
	score int NOT NULL,
	dDate char(8),
	PRIMARY KEY (did)
);


CREATE TABLE genBoard
(
	genBid int NOT NULL AUTO_INCREMENT,
	uid varchar(20) NOT NULL,
	title varchar(80) NOT NULL,
	content varchar(2000),
	modTime datetime DEFAULT CURRENT_TIMESTAMP NOT NULL,
	viewCount int DEFAULT 0 NOT NULL,
	replyCount int DEFAULT 0 NOT NULL,
	isDeleted int DEFAULT 0 NOT NULL,
	files varchar(100),
	likeCount int DEFAULT 0 NOT NULL,
	PRIMARY KEY (genBid)
);


CREATE TABLE genLikeTable
(
	lid int NOT NULL AUTO_INCREMENT,
	genBid int NOT NULL,
	uid varchar(20) NOT NULL,
	likeTime datetime DEFAULT CURRENT_TIMESTAMP NOT NULL,
	PRIMARY KEY (lid)
);


CREATE TABLE infoBoard
(
	infoBid int NOT NULL AUTO_INCREMENT,
	uid varchar(20) NOT NULL,
	title varchar(80) NOT NULL,
	content varchar(5000),
	modTime datetime DEFAULT CURRENT_TIMESTAMP NOT NULL,
	viewCount int DEFAULT 0 NOT NULL,
	isDeleted int DEFAULT 0 NOT NULL,
	files varchar(100),
	likeCount int DEFAULT 0 NOT NULL,
	PRIMARY KEY (infoBid)
);


CREATE TABLE infoLikeTable
(
	lid int NOT NULL AUTO_INCREMENT,
	infoBid int NOT NULL,
	uid varchar(20) NOT NULL,
	likeTime datetime DEFAULT CURRENT_TIMESTAMP NOT NULL,
	PRIMARY KEY (lid)
);


CREATE TABLE map
(
	orgName varchar(50) NOT NULL,
	orgType varchar(50) NOT NULL,
	addr varchar(200) NOT NULL,
	homepage varchar(200)
);


CREATE TABLE reply
(
	rid int NOT NULL AUTO_INCREMENT,
	content varchar(128) NOT NULL,
	regDate datetime DEFAULT CURRENT_TIMESTAMP NOT NULL,
	isMine int NOT NULL,
	uid varchar(20) NOT NULL,
	genBid int NOT NULL,
	PRIMARY KEY (rid)
);


CREATE TABLE testResult
(
	uid varchar(20) NOT NULL,
	result varchar(200) NOT NULL
);


CREATE TABLE users
(
	uid varchar(20) NOT NULL,
	pwd char(60) NOT NULL,
	uname varchar(20) NOT NULL,
	email varchar(32),
	regDate date DEFAULT (CURRENT_DATE),
	isDeleted int DEFAULT 0 NOT NULL,
	filename varchar(50),
	admin varchar(20) DEFAULT 'user',
	restoreRequest int DEFAULT 0,
	PRIMARY KEY (uid)
);



/* Create Foreign Keys */

ALTER TABLE genLikeTable
	ADD FOREIGN KEY (genBid)
	REFERENCES genBoard (genBid)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE reply
	ADD FOREIGN KEY (genBid)
	REFERENCES genBoard (genBid)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE infoLikeTable
	ADD FOREIGN KEY (infoBid)
	REFERENCES infoBoard (infoBid)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE diary
	ADD FOREIGN KEY (uid)
	REFERENCES users (uid)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE diaryBoard
	ADD FOREIGN KEY (uid)
	REFERENCES users (uid)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE genBoard
	ADD FOREIGN KEY (uid)
	REFERENCES users (uid)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE genLikeTable
	ADD FOREIGN KEY (uid)
	REFERENCES users (uid)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE infoBoard
	ADD FOREIGN KEY (uid)
	REFERENCES users (uid)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE infoLikeTable
	ADD FOREIGN KEY (uid)
	REFERENCES users (uid)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE reply
	ADD FOREIGN KEY (uid)
	REFERENCES users (uid)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE testResult
	ADD FOREIGN KEY (uid)
	REFERENCES users (uid)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;



