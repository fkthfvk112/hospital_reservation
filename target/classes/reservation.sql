drop table reservation;

create table user_reservation(
	id int auto_increment primary key,
	wdate timestamp not null,
	state int not null,
	description varchar(300),
	user_id varchar(100) not null,
	hospital_id int not null
);

select * from reservation;

alter table reservation
add
constraint fk_reserv_user
foreign key(user_id)
references user(id);

alter table reservation
add
constraint fk_reserv_hosp
foreign key(hospital_id)
references hospital(id);

insert into reservation(wdate,state,description,user_id,hospital_id)
values("2023-07-25 17:30:00",1,"치과 정기검진","바나나",1);
insert into reservation(wdate,state,description,user_id,hospital_id)
values("2023-07-28 17:30:00",1,"골절 진료받기","바나나",3);
insert into reservation(wdate,state,description,user_id,hospital_id)
values("2023-05-28 17:30:00",1,"팔뼈 금간거같음 ㅠ","바나나",3);

insert into reservation(wdate,state,description,user_id,hospital_id)
values("2023-07-24 17:30:00",1,"치과 스케일링","복숭아",1);
insert into reservation(wdate,state,description,user_id,hospital_id)
values("2023-07-24 19:30:00",1,"딸 이비인후과","복숭아",2);

select id, wdate, state, user_id, hospital_id, description
		from
			(	select row_number()over(partition by substr(wdate,1,8) order by wdate asc) as rnum, id, wdate, state, user_id, hospital_id, description
				from reservation
				where user_id= "복숭아" and substr(wdate,1,7) = "2023-07" ) a
		where rnum between 1 and 5

-- 안 됨
select r.id as rid, r.wdate as rdate, r.state as rstate, r.description as rdescription,
	r.user_id as userId, r.hospital_id as hospitalId, h.id as htitle, h.sort as hsort
from reservation r, hospital h
where h.id =
	(select hospital_id
	 from reservation
	 where id=2);

-- 됨
select r.id as rid, r.wdate as rdate, r.state as rstate, r.description as rdescription,
	r.user_id as userId, r.hospital_id as hospitalId, h.id as htitle, h.sort as hsort
from reservation r, hospital h
where h.id =
	(select hospital_id
	 from reservation
	 where id=2)
	 and r.id = 2;
	 
-- 안됨	 
select hospital_id
	 from reservation
	 where id=2;


select distinct (r.id) as rid, r.wdate as rdate, r.state as rstate, r.description as rdescription,
	r.user_id as userId, r.hospital_id as hospitalId, h.id as htitle, h.sort as hsort
from reservation r, hospital h
where h.id =1;

-- 됨
select r.id as rid, r.wdate as rdate, r.state as rstate, r.description as rdescription,
	r.user_id as userId, r.hospital_id as hospitalId, h.id as htitle, h.sort as hsort
from reservation r, hospital h
where r.id = 2 and h.id = r.hospital_id;

delete from reservation
where id=5;