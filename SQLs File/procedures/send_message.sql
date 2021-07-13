delimiter //
create procedure send_message(in given_type int, in given_ava_content int, in given_text_content varchar(256), in given_receiver varchar(20))
begin
    set @given_sender = (select user_name
                            from logins
                            order by login_date desc limit 1);
    if (given_type = 0) then
		insert into message(type, ava_content, text_content, sender, receiver, send_date)
		select given_type, given_ava_content, null, @given_sender, given_receiver, now()
		where @given_sender not in (select blocked from blocks where blocker = given_receiver)
			and @given_sender not in (select blocked from blocks where blocker = (select sender from ava where ava_id = given_ava_content));
	end if;
    if (given_type = 1) then
		insert into message(type, ava_content, text_content, sender, receiver, send_date)
		select given_type, null, given_text_content, @given_sender, given_receiver, now()
		where @given_sender not in (select blocked from blocks where blocker = given_receiver);
    end if;
end //
delimiter ;