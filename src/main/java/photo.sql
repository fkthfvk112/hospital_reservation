
create table photo(
	id int primary key auto_increment,
	hospital_id int not null,
	url varchar(150),
	newfilename varchar(150) 	
);

select * from photo;

alter table photo
add
constraint fk_photo_hosp
foreign key(hospital_id)
references user(id);

insert into photo(hospital_id,url)
values (1,"http://www.dentalnews.or.kr/data/photos/20180937/art_15368133845175_2f0190.jpg");
insert into photo(hospital_id,url)
values (1,"https://www.kuksiwon.or.kr/images/sub/img_job03.jpg");
insert into photo(hospital_id,url)
values (3,"http://wonh.kr/img/tit-clinic-03.jpg");

select *
from photo
where hospital_id=1
limit 1;
