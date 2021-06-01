select content, sender, send_date
from ava
where sender in (select followed from followers where follower = 'rak')
	and sender not in (select blocker from blocks where blocked = 'rak' )
order by send_date desc;

select content, sender, send_date
from ava
where sender in (select followed from followers where follower = 'gak')
	and sender not in (select blocker from blocks where blocked = 'gak' )
order by send_date desc;
