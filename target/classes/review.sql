create table review(
	id	int not null primary key auto_increment,
	hospital_id	int not null,
	user_id	varchar(100) not null,
	content	varchar(100) not null,
	wdate timestamp not null,
	score int not null
);


alter table review
add foreign key(hospital_id) references hospital(id);

alter table review
add foreign key(user_id) references user(id);
	
	
select * from review;

병원아이디 기준) 최신순 조회
select id, hospital_id, user_id, content, wdate, score
from review
where hospital_id=1
order by wdate desc

병원아이디 기준) 평점 높은순
(AVG, SUM등의 집계함수는 집계함수를 제외한 컬럼을 GROUP BY절로 묶어 주어야 한다.)
SELECT id, hospital_id, user_id, content, wdate, score, AVG(score) 
FROM review
where hospital_id=1
GROUP BY id
order by AVG(score) desc;
    
    
병원아이디 기준) 평점 낮은순
SELECT id, hospital_id, user_id, content, wdate, score, AVG(score) 
FROM review
where hospital_id=1
GROUP BY id
order by AVG(score) asc;


delete from review;
where id=4;

drop table review;



hospital 테이블
create table hospital(
	id	int primary key auto_increment, 
	title varchar(50),
	description	varchar(300),
	sort	varchar(50),
	location_latitude	varchar(150),
	location_longitude	varchar(150),
	staff_id	varchar(100),
	del_date	timestamp,
	opertime	varchar(200)
);

select * from hospital;

delete from hospital;
where id=2;

drop table hospital;
