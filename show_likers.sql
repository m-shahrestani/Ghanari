select user_name 
from likes
where ava_id = 1 and 'gak' not in (select blocked
					from blocks, ava
					where blocker = user_name or blocker = (select sender from ava where ava_id = 1));
                    
select user_name 
from likes
where ava_id = 2 and 'gak' not in (select blocked
					from blocks, ava
					where blocker = user_name or blocker = (select sender from ava where ava_id = 2));    
                    