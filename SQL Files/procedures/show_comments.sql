delimiter //
create procedure show_comments(in given_ava_id int)
begin
    set @given_user_name = (select user_name
                            from logins
                            order by login_date desc limit 1);
	select * 
	from ava
	where parent_comment = given_ava_id and @given_user_name not in (select blocked
												from blocks join ava on blocks.blocker = ava.sender
												where ava.ava_id = given_ava_id)
							and @given_user_name not in (select blocked
												from blocks 
												where blocker = ava.sender);
end //
delimiter ;	