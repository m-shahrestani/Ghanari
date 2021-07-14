select user_name 
from likes
where ava_id = 1 and 'gak' not in (select blocked
									from blocks join ava on blocks.blocker = ava.sender
									where ava_id = 1)
				and 'gak' not in (select blocked
									from blocks 
									where blocker = user_name);

select user_name 
from likes
where ava_id = 2 and 'gak' not in (select blocked
									from blocks join ava on blocks.blocker = ava.sender
									where ava_id = 2)
				and 'gak' not in (select blocked
									from blocks 
									where blocker = user_name);
						
select user_name 
from likes
where ava_id = 1 and 'rak' not in (select blocked
									from blocks join ava on blocks.blocker = ava.sender
									where ava_id = 1)
				and 'rak' not in (select blocked
									from blocks 
									where blocker = user_name);
                                    
select user_name 
from likes
where ava_id = 1 and 'aak' not in (select blocked
									from blocks join ava on blocks.blocker = ava.sender
									where ava_id = 1)
				and 'aak' not in (select blocked
									from blocks 
									where blocker = user_name);