select sender, content, count(user) as count_like 
from likes as ll 
join voice on ll.liked_voice = id_voice
where 'farzad80' not in (select blocked from blocks where blocker = (select sender from ava where ava_id = ll.ava_id ))
	and ll.ava_id = 8
