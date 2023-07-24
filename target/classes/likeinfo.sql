
create table likeinfo(
	id	int primary key auto_increment,
	user_id	varchar(100) not null,
	hospital_id	int not null
);

select * from likeinfo;

alter table likeinfo
add
constraint fk_like_user
foreign key(user_id)
references user(id);

alter table likeinfo
add
constraint fk_like_hosp
foreign key(hospital_id)
references hospital(id);

/*
select * -- 뽑으려는 데이터 컬럼 적기
from hospital h, likeinfo l
where h.id = l.hospital_id
	and l.user_id = random;
*/

insert into likeinfo(user_id,hospital_id)
values("복숭아",1);
insert into likeinfo(user_id,hospital_id)
values("복숭아",2);
insert into likeinfo(user_id,hospital_id)
values("바나나",2);

delete from likeinfo
where user_id="복숭아" and hospital_id=2;
		
select * from likeinfo;

		
-- 외래키를 써서 join하는 법
select h.id, h.title, h.description, h.sort, h.location_latitude, h.location_longitude, h.opertime, h.staff_id, h.del_date
from likeinfo l, hospital h
where h.id = l.hospital_id
	and l.hospital_id = 1;
	

select *
from hospital
where id in 
	(select hospital_id
	from likeinfo
	where user_id="복숭아");