select message.sender, message.sender, ava_content, text_content, message.send_date 
from message
where message.sender = 'aak'
    and message.receiver = 'rak'
order by send_date desc;

select message.sender, message.sender, ava_content, text_content, message.send_date 
from message
where message.sender = 'gak'
    and message.receiver = 'aak'
order by send_date desc;

select message.sender, message.sender, ava_content, text_content, message.send_date 
from message
where message.sender = 'rak'
    and message.receiver = 'aak'
order by send_date desc;
