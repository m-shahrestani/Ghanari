insert into logins(user, login_date)
select user.user_name , sysdate()
from user
where user.user_name = 'aak' and user.password = sha2('aliak90', 512)