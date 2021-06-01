select * 
from ava
where parent_comment = 1 and 'rak' not in (select blocked
											from blocks join ava on blocks.blocker = ava.sender
											where blocker = ava.sender or blocker = (select sender from ava where ava_id = 1));    


select * 
from ava
where parent_comment = 2 and 'rak' not in (select blocked
											from blocks join ava on blocks.blocker = ava.sender
											where blocker = ava.sender or blocker = (select sender from ava where ava_id = 2)); 
 
select * 
from ava
where parent_comment = 2 and 'gak' not in (select blocked
											from  blocks join ava on blocks.blocker = ava.sender
											where blocker = (select sender from ava where ava_id = 2));
                                            


