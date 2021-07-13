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
,sender varchar(20) not null
,parent_comment int
,send_date datetime not null
,foreign key(sender) references user(user_name)
,foreign key(parent_comment) references ava(ava_id)
);

create table message (
message_id int not null primary key unique key auto_increment
,type int not null -- ava or text
,ava_content int references ava(ava_id)
,text_content varchar(256)
,sender varchar(20) not null
,receiver varchar(20) not null
,send_date datetime not null
,foreign key(sender) references user(user_name)
,foreign key(receiver) references user(user_name)
);

create table hashtag (
text char(6) check (text like '#_____') not null primary key unique key
);

create table hashtags (
text char(6) check (text like '#_____') not null
,ava_id int not null
,primary key (text, ava_id)
,foreign key(text) references hashtag(text)
,foreign key(ava_id) references ava(ava_id)
);

create table logins (
user_name varchar(20) not null
,login_date datetime not null
,foreign key(user_name) references user(user_name)
);

create table likes (
user_name varchar(20) not null
,ava_id int not null
,primary key (user_name, ava_id)
,foreign key(user_name) references user(user_name)
,foreign key(ava_id) references ava(ava_id)
);

create table blocks (
blocker varchar(20) not null
,blocked varchar(20) not null
,primary key (blocker, blocked)
,foreign key(blocker) references user(user_name)
,foreign key(blocked) references user(user_name)
);

create table followers (
follower varchar(20) not null
,followed varchar(20) not null
,primary key (follower, followed)
,foreign key(follower) references user(user_name)
,foreign key(followed) references user(user_name)
);