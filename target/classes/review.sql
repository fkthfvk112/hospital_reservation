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

insert into review(wdate,score,content,user_id,hospital_id)
values(now(),3,"친절해요.","abc123",2);
insert into review(wdate,score,content,user_id,hospital_id)
values(now(),5,"한번에 두군데 진찰 쌉가능~","abc123",4);

select r.id as rid, r.wdate as rwdate, r.score as rscore, r.content as rcontent,
	   hospital_id, user_id,
	   h.title as htitle, h.sort as hsort,
	   location_latitude, location_longitude
from review r, hospital h
where user_id = "abc123"
      and r.hospital_id = h.id;
