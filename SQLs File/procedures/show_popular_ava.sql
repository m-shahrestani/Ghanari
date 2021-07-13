delimiter //
create procedure show_popular_ava()
begin
    set @given_user_name = (select user_name
                            from logins
                            order by login_date desc limit 1);
	select  ava.sender, content, count(ava_id) as like_number 
	from likes natural join ava
	where @given_user_name not in (select blocked from blocks where blocker = sender)
	group by ava_id
	order by like_number desc;
end //
delimiter ;
