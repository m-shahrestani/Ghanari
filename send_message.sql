insert into message(type, ava_content, text_content, sender, receiver, send_date)
select 1, null,'text message', 'aak', 'rak', now()
where 'aak' not in (select blocked from blocks where blocker = 'rak');

insert into message(type, ava_content, text_content, sender, receiver, send_date)
select 0, 1, null, 'aak', 'rak', now()
where 'aak' not in (select blocked from blocks where blocker = 'rak')
	and 'aak' not in (select blocked from blocks where blocker = (select sender from ava where ava_id = 1 ));
    
select * from message;