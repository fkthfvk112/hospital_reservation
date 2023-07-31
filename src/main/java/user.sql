drop table user;

create table user(
	id	varchar(100) not null primary key,
	pw	varchar(100) not null,
	name	varchar(100) not null,
	email	varchar(100) not null,
	auth	int not null,
	warning	int not null,
	myHospital_id int
);

alter table user
add
constraint fk_user_hosp
foreign key(myHospital_id)
references hospital(id);

insert into user(id, pw, name, email, auth, warning, myHospital_id)
values ('asdf', '1234', 'testName', 'testEmail@naver.com', 1, 0, 0);

select * from user;

delete from user;