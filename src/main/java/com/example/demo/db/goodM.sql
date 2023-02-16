SET SESSION FOREIGN_KEY_CHECKS=0;

/* Drop Tables */
DROP TABLE IF EXISTS diary;
DROP TABLE IF EXISTS diaryBoard;
DROP TABLE IF EXISTS likeList;
DROP TABLE IF EXISTS reply;
DROP TABLE IF EXISTS genBoard;
DROP TABLE IF EXISTS infoBoard;
DROP TABLE IF EXISTS map;
DROP TABLE IF EXISTS testResult;
DROP TABLE IF EXISTS users;


/* Create Tables */
CREATE TABLE diary 
(
	  uid VARCHAR(20) NOT NULL,
	  dayStr CHAR(8) NOT NULL,
	  anniversary VARCHAR(20),
	  title VARCHAR(80),
	  content VARCHAR(800),
	  sentiment VARCHAR(20),
	  isHoliday INT DEFAULT 0,
	  PRIMARY KEY(uid, dayStr)
	);

CREATE TABLE diaryBoard
(
	did int NOT NULL AUTO_INCREMENT,
	uid varchar(20) NOT NULL,
	title varchar(128) NOT NULL,
	content varchar(800), /* 800으로 변경 */
	modTime datetime DEFAULT CURRENT_TIMESTAMP NOT NULL,
	isDeleted int DEFAULT 0 NOT NULL,
	files varchar(100),
	score int NOT NULL,  /* 2/14추가함 */
	PRIMARY KEY (did)
);


CREATE TABLE genBoard
(
	genBid int NOT NULL AUTO_INCREMENT,
	uid varchar(20) NOT NULL,
	title varchar(128) NOT NULL,
	content varchar(128),
	modTime datetime DEFAULT CURRENT_TIMESTAMP NOT NULL,
	viewCount int DEFAULT 0 NOT NULL,
	replyCount int DEFAULT 0 NOT NULL,
	isDeleted int DEFAULT 0 NOT NULL,
	files varchar(100),
	PRIMARY KEY (genBid)
);


CREATE TABLE infoBoard
(
	infoBid int NOT NULL AUTO_INCREMENT,
	uid varchar(20) NOT NULL,
	title varchar(128) NOT NULL,
	content varchar(128),
	modTime datetime DEFAULT CURRENT_TIMESTAMP NOT NULL,
	viewCount int DEFAULT 0 NOT NULL,
	isDeleted int DEFAULT 0 NOT NULL,
	files varchar(100),
	PRIMARY KEY (infoBid)
);


CREATE TABLE likeList
(
	likeCount int DEFAULT 0 NOT NULL,
	uid varchar(20) NOT NULL,
	genBid int NOT NULL,
	infoBid int NOT NULL,
	PRIMARY KEY (likeCount)
);


CREATE TABLE map
(
	hid int NOT NULL,
	orgName varchar(50) NOT NULL,
	orgType varchar(40) NOT NULL,
	addr varchar(100) NOT NULL,
	homepage varchar(200),
	PRIMARY KEY (hid)
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
	PRIMARY KEY (uid)
);



/* Create Foreign Keys */

ALTER TABLE likeList
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


ALTER TABLE likeList
	ADD FOREIGN KEY (infoBid)
	REFERENCES infoBoard (infoBid)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE diaBoard
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


ALTER TABLE infoBoard
	ADD FOREIGN KEY (uid)
	REFERENCES users (uid)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE likeList
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



