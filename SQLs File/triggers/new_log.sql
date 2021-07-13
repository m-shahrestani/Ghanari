delimiter //
create trigger new_log after insert on user for each row
begin
	insert into new_log(user_name, join_date)
	values(NEW.user_name, NEW.join_date);
end //
delimiter ;