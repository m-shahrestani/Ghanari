create table user (
first_name varchar(20) not null
,last_name varchar(20) not null
,user_name varchar(20) not null primary key unique key
,password varchar(128) not null
,birth_date date not null
,join_date date not null
,bio varchar(64) not null
);

create table ava (
ava_id int not null primary key unique key auto_increment
,content varchar(256) not null
,sender varchar(20) not null references user(user_name)
,parent_comment int references ava(ava_id)
,send_date datetime not null
);

create table message (
message_id int not null primary key unique key auto_increment
,type int not null -- ava or text
,ava_content int references ava(ava_id)
,text_content varchar(256)
,sender varchar(20) not null references user(user_name)
,receiver varchar(20) not null references user(user_name)
,send_date datetime not null
);

create table hashtag (
text char(6) check (text like '#_____') not null primary key unique key
);

create table hashtags (
text char(6) check (text like '#_____') not null references hashtag(text)
,ava_id int not null references ava(ava_id)
,primary key (text, ava_id)
);

create table logins (
login_id int  not null primary key unique key auto_increment
,user varchar(20) not null references user(user_name)
,login_date datetime not null
);

create table likes (
user_name varchar(20) not null references user(user_name)
,ava_id int not null references ava(ava_id)
,PRIMARY KEY (user_name, ava_id)
);

create table blocks (
blocker varchar(20) not null references user(user_name)
,blocked varchar(20) not null references user(user_name)
,primary key (blocker, blocked)
);

create table followers (
follower varchar(20) not null references user(user_name)
,followed varchar(20) not null references user(user_name)
,primary key (follower, followed)
);