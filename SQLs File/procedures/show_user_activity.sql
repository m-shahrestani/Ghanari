delimiter //
create procedure show_user_activity(in sender_user_name varchar(20))
begin
    set @given_user_name = (select user_name
                            from logins
                            order by login_date desc limit 1);
	select content , send_date
	from ava
	where sender = sender_user_name and @given_user_name not in (select blocked 
											from blocks
											where blocker = sender_user_name)
	order by send_date desc;
end //
delimiter ;