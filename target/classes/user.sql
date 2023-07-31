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

insert into user(id, pw, name, email, auth, warning, myHospital_id)
values ('asdf', '1234', 'testName', 'testEmail@naver.com', 1, 0, 0);

select * from user;

delete from user;

-- 일반 유저가 병원 관계자 신청 -> 관리자가 체크 후 승인 -> 디비에 해당 유저 auth 변경 
update user
set auth = 2
where id = "1234qwer";

update user
set auth = 2
where id = "patient1";