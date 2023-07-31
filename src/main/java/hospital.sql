
create table hospital(
	id	int primary key auto_increment, 
	title varchar(50),
	description	varchar(300),
	sort varchar(50),
	location_latitude varchar(150),
	location_longitude varchar(150),
	opertime	varchar(200),
	staff_id	varchar(100),
	del_date	timestamp
);

select * from hospital;

alter table hospital
add
constraint fk_hosp_user
foreign key(staff_id)
references user(id);

insert into hospital(title,description,sort,location_latitude,location_longitude,opertime,staff_id,del_date)
values("김사랑 치과","건강한 치아 관리","치과","20","30","15,16","바나나",null);

insert into hospital(title,description,sort,location_latitude,location_longitude,opertime,staff_id,del_date)
values("코끼리 이비인후과","아동 이비인후과","이비인후과","20","30","8,17","banana",null);

insert into hospital(title,description,sort,location_latitude,location_longitude,opertime,staff_id,del_date)
values("강철본드 정형외과","한번 붙은 뼈는 다시 안 부러지도록","정형외과","20","30","13,17","banana",null);

insert into hospital(title,description,sort,location_latitude,location_longitude,opertime,staff_id,del_date)
values("만능 종합병원","여기저기 아플 땐 만능병원으로","정형외과,치과,이비인후과","20","30","10,17","banana",null);

delete from hospital;