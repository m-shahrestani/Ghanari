delimiter //
create procedure show_following_activity()
begin
    set @given_user_name = (select user_name
                            from logins
                            order by login_date desc limit 1);
	select content, sender, send_date
	from ava
	where sender in (select followed from followers where follower = @given_user_name)
		and sender not in (select blocker from blocks where blocked = @given_user_name )
	order by send_date desc;
end //
delimiter ;