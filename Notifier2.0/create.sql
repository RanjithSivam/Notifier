create table notebook (
id int auto_increment,
title varchar(45) not null,
username varchar(45) not null,
primary key(id)
)

create table notes (
id int auto_increment,
title varchar(45) not null,
description varchar(500) not null,
start_date date not null,
end_date date not null,
tags varchar(100),
notebook_id int not null,
user_id int not null,
primary key(id)
)

create table notes (
id int auto_increment,
fullname varchar(45) not null,
username varchar(45) not null,
email varchar(45) not null,
`password` varchar(45) not null,
phone char(10),
primary key(id)
)