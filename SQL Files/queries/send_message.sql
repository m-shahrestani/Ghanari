insert into message(type, ava_content, text_content, sender, receiver, send_date)
select 1, null,'text message', 'aak', 'rak', now()
where 'aak' not in (select blocked from blocks where blocker = 'rak');

insert into message(type, ava_content, text_content, sender, receiver, send_date)
select 1, null,'text message', 'gak', 'aak', now()
where 'gak' not in (select blocked from blocks where blocker = 'aak');

insert into message(type, ava_content, text_content, sender, receiver, send_date)
select 0, 1, null, 'aak', 'rak', now()
where 'aak' not in (select blocked from blocks where blocker = 'rak')
	and 'aak' not in (select blocked from blocks where blocker = (select sender from ava where ava_id = 1 ));
    
insert into message(type, ava_content, text_content, sender, receiver, send_date)
select 0, 1, null, 'gak', 'aak', now()
where 'gak' not in (select blocked from blocks where blocker = 'aak')
	and 'gak' not in (select blocked from blocks where blocker = (select sender from ava where ava_id = 1 ));
    
insert into message(type, ava_content, text_content, sender, receiver, send_date)
select 1, null,'text message2', 'rak', 'aak', now()
where 'rak' not in (select blocked from blocks where blocker = 'aak');

insert into message(type, ava_content, text_content, sender, receiver, send_date)
select 1, null,'I will block you', 'aak', 'gak', now()
where 'rak' not in (select blocked from blocks where blocker = 'gak');

insert into message(type, ava_content, text_content, sender, receiver, send_date)
select 1, null,'text message3', 'gak', 'rak', now()
where 'aak' not in (select blocked from blocks where blocker = 'gak');

select * from message;