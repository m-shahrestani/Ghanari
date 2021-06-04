select  ava.sender, content, count(ava_id) as like_number 
from likes natural join ava
where 'aak' not in (select blocked from blocks where blocker = sender)
group by ava_id
order by like_number desc;

select  ava.sender, content, count(ava_id) as like_number 
from likes natural join ava
where 'rak' not in (select blocked from blocks where blocker = sender)
group by ava_id
order by like_number desc;

select  ava.sender, content, count(ava_id) as like_number 
from likes natural join ava
where 'gak' not in (select blocked from blocks where blocker = sender)
group by ava_id
order by like_number desc;
