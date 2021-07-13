delimiter //
create procedure block(in given_blocked varchar(20))
begin
    set @given_blocker = (select user_name
                            from logins
                            order by login_date desc limit 1);
	insert into blocks(blocker, blocked)
	values (@given_blocker, given_blocked);
end //
delimiter ;