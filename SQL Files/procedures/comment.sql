delimiter //
create procedure comment(in given_content varchar(256), in given_parent_comment int)
begin
    set @given_sender = (select user_name
                            from logins
                            order by login_date desc limit 1);
	insert into ava(content, sender, parent_comment, send_date)
	select given_content, @given_sender,  given_parent_comment, now()
	from ava
	where ava_id = given_parent_comment and (sender, @given_sender) not in (select * from blocks);
end //
delimiter ;