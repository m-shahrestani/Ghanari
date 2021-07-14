delimiter //
create procedure show_messages(in given_sender varchar(20))
begin
    set @given_receiver = (select user_name
                            from logins
                            order by login_date desc limit 1);
	select message.sender, message.receiver, ava_content, text_content, message.send_date 
	from message
	where message.sender = given_sender
		and message.receiver = @given_receiver
	order by send_date desc;
end //
delimiter ;