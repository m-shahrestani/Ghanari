select content , send_date
from ava
where sender = 'aak' and 'gak' not in (select blocked 
										from blocks
										where blocker = 'aak')
order by send_date desc;

select content , send_date
from ava
where sender = 'aak' and 'rak' not in (select blocked 
										from blocks
										where blocker = 'aak')
order by send_date desc;
