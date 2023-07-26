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

-- pw 컬럼의 속성을 수정하여 NULL을 허용하도록 변경
ALTER TABLE user MODIFY pw varchar(100) NULL;


insert into user(id, pw, name, email, auth, warning, myHospital_id)
values ('testId', '123', 'testName', 'testEmail@naver.com', 1, 0, 0);

insert into user(id, pw, name, email, auth, warning, myHospital_id)
values ('test123', '123', 'testName', 'testEmail@naver.com', 1, 0, 0);

select * from user;

select pw from user
where id="qwe";

delete from user
where id='2924185105';

update user set pw = SHA2(pw, 256);