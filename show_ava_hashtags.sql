select content, sender, send_date
from hashtags natural join ava
where text = '#abs5h' and 'gak' not in (select blocked from blocks where blocker = sender )
order by send_date desc;

select content, sender, send_date
from hashtags natural join ava
where text = '#abs5h' and 'rak' not in (select blocked from blocks where blocker = sender )
order by send_date desc;
