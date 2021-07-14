delimiter //
create procedure login(in given_user_name varchar(20), in given_password varchar(128))
begin
	select count(user_name) 
	from user
	where user.user_name = given_user_name and user.password = sha2(given_password, 512);
	insert into logins(user_name, login_date)
	select user.user_name , sysdate()
	from user
	where user.user_name = given_user_name and user.password = sha2(given_password, 512);
end //
delimiter ;