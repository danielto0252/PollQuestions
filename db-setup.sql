create database clickr;
create table FRquestions(Question_numb int NOT NULL AUTO_INCREMENT,
						Question varchar(255) NOT NULL, 
						Response varchar(255),
						PRIMARY KEY (Question_numb));