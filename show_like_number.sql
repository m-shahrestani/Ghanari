select count(user_name) as like_number 
from likes natural join ava
where 'gak' not in (select blocked from blocks where blocker = sender)
	and ava_id = 1;

select count(user_name) as like_number 
from likes natural join ava
where 'gak' not in (select blocked from blocks where blocker = sender)
	and ava_id = 2;
