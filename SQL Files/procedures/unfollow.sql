delimiter //
create procedure unfollow(in given_followed varchar(20))
begin
    set @given_follower = (select user_name
                            from logins
                            order by login_date desc limit 1);
	delete from followers
	where follower = @given_follower and followed = given_followed;
end //
delimiter ;