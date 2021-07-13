delimiter //
create trigger new_ava after insert on ava for each row
begin
  insert into new_ava(ava_id, sender, send_date)
			values(NEW.ava_id, NEW.sender,  NEW.send_date);
end //
delimiter ;