insert into ava(content, sender, parent_comment, send_date)
select 'ava comment', 'gak',  1, now()
from ava
where ava_id = 1 and (sender, 'gak') not in (select * from blocks);

insert into ava(content, sender, parent_comment, send_date)
select 'ava comment2', 'rak',  1, now()
from ava
where ava_id = 1 and (sender, 'rak') not in (select * from blocks);

insert into ava(content, sender, parent_comment, send_date)
select 'ava comment3', 'rak',  2, now()
from ava
where ava_id = 2 and (sender, 'rak') not in (select * from blocks);

insert into ava(content, sender, parent_comment, send_date)
select 'ava comment4', 'aak',  2, now()
from ava
where ava_id = 2 and (sender, 'aak') not in (select * from blocks);

select * from ava;

