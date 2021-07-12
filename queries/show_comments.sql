select * 
from ava
where parent_comment = 1 and 'gak' not in (select blocked
											from blocks join ava on blocks.blocker = ava.sender
											where ava.ava_id = 1)
						and 'gak' not in (select blocked
											from blocks 
                                            where blocker = ava.sender);

select * 
from ava
where parent_comment = 2 and 'gak' not in (select blocked
											from blocks join ava on blocks.blocker = ava.sender
											where ava.ava_id = 2)
						and 'gak' not in (select blocked
											from blocks 
                                            where blocker = ava.sender);
                                            
select * 
from ava
where parent_comment = 2 and 'rak' not in (select blocked
											from blocks join ava on blocks.blocker = ava.sender
											where ava.ava_id = 2)
						and 'rak' not in (select blocked
											from blocks 
                                            where blocker = ava.sender);		
                                            
select * 
from ava
where parent_comment = 1 and 'rak' not in (select blocked
											from blocks join ava on blocks.blocker = ava.sender
											where ava.ava_id = 1)
						and 'rak' not in (select blocked
											from blocks 
                                            where blocker = ava.sender);	