delimiter //
create procedure add_hashtag_ava(in given_hashtag char(6), in given_ava_id int)
begin
	insert into hashtag(text)
	values(given_hashtag);
    
    insert into hashtags(text, ava_id)
	values(given_hashtag, given_ava_id);
end //
delimiter ;