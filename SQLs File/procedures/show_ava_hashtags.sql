delimiter //
create procedure show_ava_hashtags(in given_hashtag char(6))
begin
    set @given_user_name = (select user_name
                            from logins
                            order by login_date desc limit 1);
	select content, sender, send_date
	from hashtags natural join ava
	where text = given_hashtag and @given_user_name not in (select blocked from blocks where blocker = sender )
	order by send_date desc;
end //
delimiter ;