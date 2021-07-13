delimiter //
create procedure like_ava(in given_ava_id int)
begin     
    set @given_user_name = (select user_name
                            from logins
                            order by login_date desc limit 1);        
	insert into likes(user_name, ava_id)
	select @given_user_name, given_ava_id
	where @given_user_name not in (select blocked 
					from blocks
					where blocker = (select sender from ava where ava_id = given_ava_id));
end //
delimiter ;