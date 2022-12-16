create table place (

					pla_id SERIAL not null,
					pla_name VARCHAR(60) not null,
					primary key (pla_id)
);

create table mediaitem (
	                med_id SERIAL not null,
					med_name VARCHAR(60) not null,
					med_pla_id int not null,
					primary key (med_id)	
);
		     		     
create table video (
	                vid_id SERIAL not null,
					vid_length VARCHAR(60) not null,
					vid_med_id int not null,
					primary key (vid_id)
);
		           
create table images (
					img_id SERIAL not null,
                    img_med_id int not null,
					img_cat_id int not null,
					primary key (img_id)
);

create table imgcategory (
					imgcat_id SERIAL not null,
					imgcat_name VARCHAR(60) not null,
					primary key (imgcat_id)
					
);
		           
create table song (
					song_id SERIAL not null, 			
					song_med_id int not null, 					
					song_length VARCHAR(60) not null,
					song_perf_id int not null,
					primary key (song_id)
);
		    
create table performer (
					perf_id SERIAL not null,
          		    perf_name VARCHAR(60) not null,					
					primary key (perf_id)
);		
		            		                 		    

create table videosong (
					vs_id SERIAL not null,
					vs_vid_id int not null,
					vs_song_id int not null,
					primary key (vs_id)
					
);

create table interactelement (
					interel_id SERIAL not null,
					interel_name VARCHAR(60) not null,
					interel_med_id int not null,
					interel_intertype_id int not null,
					primary key (interel_id)
					
);

create table interacttype (
					intertype_id SERIAL not null,
					intertype_name VARCHAR(60) not null,
					primary key (intertype_id)
					
);

create table usermedia (
					umedia_id SERIAL not null,
					umedia_med_id int not null,
					umedia_usr_id int not null,
					primary key (umedia_id)
					
);

create table usr (
					usr_id SERIAL not null,
					usr_name VARCHAR(60) not null,
					usr_age int not null,
					usr_gender VARCHAR(1) not null,
					usr_avt_id int not null, 		
					primary key (usr_id)
					
);

create table avatar (
					avt_id SERIAL not null,
					avt_tor_id int not null,
					avt_leg_id int not null,
					avt_head_id int not null, 								
					primary key (avg_id)
					
);


-- Foreign Keys

alter table mediaitem 
add constraint mediaitem_fk_place
foreign key (med_pla_id) references place(pla_id) 
ON DELETE NO ACTION ON UPDATE NO ACTION;

alter table video 
add constraint video_fk_mediaitem
foreign key (vid_med_id) references mediaitem(med_id) 
ON DELETE NO ACTION ON UPDATE NO ACTION;
            
alter table images 
add constraint image_fk_mediaitem
add constraint image_fk_imgcategory
foreign key (img_med_id) references mediaitem(med_id)
foreign key (img_cat_id) references imgcategory(imgcat_id) 
ON DELETE NO ACTION ON UPDATE NO ACTION;
            
alter table song
add constraint song_fk_mediaitem
add constraint song_fk_performer
foreign key(song_perf_id) references performer(perf_id)
foreign key (song_med_id) references mediaitem(med_id) 
ON DELETE NO ACTION ON UPDATE NO ACTION;            
            
alter table videosong
add constraint videosong_fk_video
add constraint videosong_fk_song
foreign key (vs_vid_id) references video(vid_id)
foreign key (vs_song_id) references song(song_id) 
ON DELETE NO ACTION ON UPDATE NO ACTION;            

alter table interactelement 
add constraint intearctelement_fk_mediaitem
add constraint intearctelement_fk_interacttype
foreign key (interel_med_id) references mediaitem(med_id)
foreign key (interel_intertype_id) references interacttype(intertype_id) 
ON DELETE NO ACTION ON UPDATE NO ACTION; 
                        
alter table usermedia 
add constraint usermedia_fk_mediaitem
add constraint usermedia_fk_usr
foreign key (umedia_med_id) references mediaitem(med_id)
foreign key (umedia_usr_id) references usr(usr_id)
ON DELETE NO ACTION ON UPDATE NO ACTION; 

alter table usr 
add constraint usr_fk_avatar
foreign key (usr_avt_id) references avatar(avt_id)
ON DELETE NO ACTION ON UPDATE NO ACTION;

alter table avatar
add constraint avatar_fk_torso
add constraint avatar_fk_legs
add constraint avatar_fk_head
foreign key (avt_tor_id) references torso(tor_id)
foreign key (avt_head_id) references head(head_id)
foreign key (avt_leg_id) references legs(leg_id)
ON DELETE NO ACTION ON UPDATE NO ACTION; 
