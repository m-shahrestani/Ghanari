delimiter //
create procedure show_likers(in given_ava_id int)
begin
    set @given_user_name = (select user_name
                            from logins
                            order by login_date desc limit 1);
	select user_name 
	from likes
	where ava_id = given_ava_id and @given_user_name not in (select blocked
										from blocks join ava on blocks.blocker = ava.sender
										where ava_id = given_ava_id)
					and @given_user_name not in (select blocked
										from blocks 
										where blocker = user_name);
end //
delimiter ;