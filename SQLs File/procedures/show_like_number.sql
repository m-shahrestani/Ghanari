delimiter //
create procedure show_like_number(in given_ava_id int)
begin
    set @given_user_name = (select user_name
                            from logins
                            order by login_date desc limit 1);
	select count(user_name) as like_number 
	from likes natural join ava
	where @given_user_name not in (select blocked from blocks where blocker = sender)
		and ava_id = given_ava_id;
end //
delimiter ;

