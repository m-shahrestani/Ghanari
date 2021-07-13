delimiter //
create procedure register_account(in given_first_name varchar(20), in given_last_name varchar(20), in given_user_name varchar(20), in given_password varchar(128), in given_birth_date date, in given_bio varchar(64))
begin
	insert into user(first_name, last_name, user_name, password, birth_date, join_date, bio )
	values(given_first_name, given_last_name, given_user_name, sha2(given_password, 512), given_birth_date, curdate(), given_bio);
end //
delimiter ;