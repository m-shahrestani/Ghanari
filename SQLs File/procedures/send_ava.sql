delimiter //
create procedure send_ava(in given_content varchar(256))
begin
    set @given_sender = (select user_name
                            from logins
                            order by login_date desc limit 1);   
	insert into ava(content, sender, parent_comment, send_date)
	values(given_content, @given_sender, null, now());
end //
delimiter ;
