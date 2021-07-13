delimiter //
create procedure follow(in gievn_followed varchar(20))
begin
    set @given_follower = (select user_name
                            from logins
                            order by login_date desc limit 1);
    insert into followers(follower , followed)
	values (@given_follower, gievn_followed);
end //
delimiter ;