insert into likes(user_name, ava_id)
select 'rak', 1
where 'rak' not in (select blocked 
					from blocks
					where blocker = (select sender from ava where ava_id = 1));

insert into likes(user_name, ava_id)
select 'gak', 1
where 'gak' not in (select blocked 
					from blocks
					where blocker = (select sender from ava where ava_id = 1));
                    
insert into likes(user_name, ava_id)
select 'aak', 1
where 'aak' not in (select blocked 
					from blocks
					where blocker = (select sender from ava where ava_id = 1));
                    
insert into likes(user_name, ava_id)
select 'aak', 2
where 'aak' not in (select blocked 
					from blocks
					where blocker = (select sender from ava where ava_id = 2));

insert into likes(user_name, ava_id)
select 'rak', 2
where 'rak' not in (select blocked 
					from blocks
					where blocker = (select sender from ava where ava_id = 2));
                    
insert into likes(user_name, ava_id)
select 'gak', 3
where 'gak' not in (select blocked 
					from blocks
					where blocker = (select sender from ava where ava_id = 3));
                    
select * from likes;