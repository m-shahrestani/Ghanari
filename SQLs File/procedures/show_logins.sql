delimiter //
create procedure show_logins()
begin
    set @given__user_name = (select user_name
                            from logins
                            order by login_date desc limit 1);
	select login_date
	from logins
	where user_name = @given__user_name
	order by login_date desc;
end //
delimiter ;
