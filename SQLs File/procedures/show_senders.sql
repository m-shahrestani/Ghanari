delimiter //
create procedure show_senders()
begin
    set @given_user_name = (select user_name
                            from logins
                            order by login_date desc limit 1);
	 select distinct sender, last_message
	 from (select sender , max(send_date) as last_message
			from message
			where receiver = @given_user_name
			group by sender
			order by max(send_date) desc) as temp;
end //
delimiter ;