delimiter //
create procedure unblock(in given_blocked varchar(20))
begin
    set @given_blocker = (select user_name
                            from logins
                            order by login_date desc limit 1);
	delete from blocks
	where blocker = @given_blocker and blocked = given_blocked;
end //
delimiter ;