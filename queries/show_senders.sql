 select distinct sender, last_message
 from (select sender , max(send_date) as last_message
		from message
		where receiver = 'aak'
		group by sender
		order by max(send_date) desc) as temp;
        
 select distinct sender, last_message
 from (select sender , max(send_date) as last_message
		from message
		where receiver = 'gak'
		group by sender
		order by max(send_date) desc) as temp;
        
 select distinct sender, last_message
 from (select sender , max(send_date) as last_message
		from message
		where receiver = 'rak'
		group by sender
		order by max(send_date) desc) as temp;