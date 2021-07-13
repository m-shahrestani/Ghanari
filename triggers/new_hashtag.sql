delimiter //
create trigger new_hashtag after insert on ava for each row
begin
    set @i = 1;
    loop_label:  loop
		if  @i > length(NEW.content) THEN 
		  LEAVE  loop_label;
		end if;
		if substr(NEW.content, @i , 6) like '#_____' then
		  call add_hashtag(substr(NEW.content, @i , 6), NEW.ava_id );
		end if;
    set  @i = @i + 1;
	end loop;
end //
delimiter ;