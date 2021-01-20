CREATE TABLE `tblMember` (
  `id` char(20) NOT NULL,
  `pass` char(20) NOT NULL,
  `name` char(20) NOT NULL,
  `sex` char(1) ,
  `birthday` char(6) ,
  `email` char(30) ,
  `zipcode` char(7) ,
  `address` char(50) ,
  `hobby` char(5) ,
  `job` char(20) ,
  PRIMARY KEY (`id`)
);

CREATE TABLE `tblZipcode` (
  `zipcode` char(7) NOT NULL,
  `area1` char(10) DEFAULT NULL,
  `area2` char(20) DEFAULT NULL,
  `area3` char(40) DEFAULT NULL,
  `area4` char(20) DEFAULT NULL
)