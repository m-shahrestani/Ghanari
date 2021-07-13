delimiter //
create procedure show_user_avas()
begin
    set @given_user_name = (select user_name
                            from logins
                            order by login_date desc limit 1);
	select content,  send_date
	from ava
	where sender = @given_user_name
	order by send_date desc;
end //
delimiter ;