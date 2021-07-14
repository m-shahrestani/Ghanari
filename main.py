import sys
import mysql.connector as sql


class DB:
    proc_number = {
        1: "register_account",
        2: "login",
        3: "comment",
        4: "follow",
        5: "like_ava",
        6: "block",
        7: "unblock",
        8: "add_hashtag_ava",
        9: "send_ava",
        10: "send_message",
        11: "unfollow",
        12: "show_comments",
        13: "show_following_activity",
        14: "show_like_number",
        15: "show_likers",
        16: "show_logins",
        17: "show_messages",
        18: "show_popular_ava",
        19: "show_senders",
        20: "show_user_activity",
        21: "show_user_avas",
        22: "show_ava_hashtags",
        23: "make_tables"
    }

    def __init__(self):
        self._db = sql.connect(
            host='localhost',
            user='root',
            password='1234',
            database='ghanari'
        )
        self.check_table()

    def check_table(self):
        cursor = self._db.cursor(buffered=True)
        cursor.execute('show tables;')
        tables = cursor.fetchall()
        if not tables:
            cursor.close()
            self.create_tables()

    def create_tables(self):
        cursor = self._db.cursor(buffered=True)
        cursor.callproc(self.proc_number[23])
        for result in cursor.stored_results():
            print(result.fetchall())
        cursor.close()

    def call_proc(self, code, args):
        try:
            cursor = self._db.cursor(buffered=True)
            cursor.callproc(self.proc_number[code], args)
            self._db.commit()
            hold = []
            for result in cursor.stored_results():
                hold.append(result.fetchall())
            for x in hold:
                for y in x:
                    for i in range(len(y)):
                        print(y[i], end='\t')
                    print()
            print("Done.")
            cursor.close()
        except Exception:
            print(self.proc_number[code] + " is unsuccessful.")
            pass

    def close_DB(self):
        self._db.close()


def print_help():
    print(
        'Enter \'/\' between arguments.\n'
        'send_message\t\t/<type (0=ava or 1=text)>/<ava id (int)>/<text (string)>/<receiver send_message(string)> - to send message\n'
        'comment\t\t\t\t/<ava comment (string)>/<ava (int)>\t\t\t\t\t\t\t\t\t\t\t\t\t\t - to comment ava for other ava\n'
        'add_hashtag_ava\t\t/<hashtag (string with #______ pattern)>/<ava id (int)>\t\t\t\t\t\t\t\t\t - to assign hashtag for one ava\n'
        'show_ava_hashtags\t/<hashtag (string with #______ pattern)>\t\t\t\t\t\t\t\t\t\t\t\t - to show avas of one hashtag\n'
        'send_ava\t\t\t/<ava content (string)>\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t - to send ava\n'
        'follow\t\t\t\t/<username (string)>\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t - to follow others\n'
        'unfollow\t\t\t/<username (string)>\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t - to unfollow others\n'
        'block\t\t\t\t/<username (string)>\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t - to block others\n'
        'unblock\t\t\t\t/<username (string)>\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t - to unblock others\n'
        'show_comments\t\t/<ava id (int)>\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t - to show comments of one ava\n'
        'like_ava\t\t\t/<ava id (int)>\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t - to like ava\n'
        'show_like_number\t/<ava id (int)>\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t - to show like number of one ava\n'
        'show_likers\t\t\t/<ava id (int)>\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t - to show likers of one ava\n'
        'show_messages\t\t/<username (string)>\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t - to show messages of one person\n'
        'show_user_activity\t/<username (string)>\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t - to show ava of one person\n'
        'show_following_activity\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t - to show ava timeline\n'
        'show_popular_ava \t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t - to show most popular ava\n'
        'show_user_avas \t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t - to show self avas\n'
        'show_senders \t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t - to show list of message senders\n'
        'show_logins \t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t - to show time of logins\n'
        'sign_out \t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t - to sign out')


def check_login(db, com):
    cursor = db._db.cursor(buffered=True)
    cursor.callproc(db.proc_number[2], com)
    db._db.commit()
    hold = []
    for result in cursor.stored_results():
        hold.append(result.fetchall())
    cursor.close()
    if hold[0][0][0] == 1:
        print("login is successful.")
        return True
    else:
        print("Username or Password is wrong.")
        return False


def login(db):
    print_help()
    while True:
        com = input().split('/')
        if com[0] == "comment" and len(com) - 1 == 2:
            db.call_proc(3, com[1:])
        elif com[0] == "follow" and len(com) - 1 == 1:
            db.call_proc(4, com[1:])
        elif com[0] == "like_ava" and len(com) - 1 == 1:
            db.call_proc(5, com[1:])
        elif com[0] == "block" and len(com) - 1 == 1:
            db.call_proc(6, com[1:])
        elif com[0] == "unblock" and len(com) - 1 == 1:
            db.call_proc(7, com[1:])
        elif com[0] == "add_hashtag_ava" and len(com) - 1 == 2:
            db.call_proc(8, com[1:])
        elif com[0] == "send_ava" and len(com) - 1 == 1:
            db.call_proc(9, com[1:])
        elif com[0] == "send_message" and len(com) - 1 == 4:
            db.call_proc(10, com[1:])
        elif com[0] == "unfollow" and len(com) - 1 == 1:
            db.call_proc(11, com[1:])
        elif com[0] == "show_comments" and len(com) - 1 == 1:
            db.call_proc(12, com[1:])
        elif com[0] == "show_following_activity" and len(com) - 1 == 0:
            db.call_proc(13, com[1:])
        elif com[0] == "show_like_number" and len(com) - 1 == 1:
            db.call_proc(14, com[1:])
        elif com[0] == "show_likers" and len(com) - 1 == 1:
            db.call_proc(15, com[1:])
        elif com[0] == "show_logins" and len(com) - 1 == 0:
            db.call_proc(16, com[1:])
        elif com[0] == "show_messages" and len(com) - 1 == 1:
            db.call_proc(17, com[1:])
        elif com[0] == "show_popular_ava" and len(com) - 1 == 0:
            db.call_proc(18, com[1:])
        elif com[0] == "show_senders" and len(com) - 1 == 0:
            db.call_proc(19, com[1:])
        elif com[0] == "show_user_activity" and len(com) - 1 == 1:
            db.call_proc(20, com[1:])
        elif com[0] == "show_user_avas" and len(com) - 1 == 0:
            db.call_proc(21, com[1:])
        elif com[0] == "show_ava_hashtags" and len(com) - 1 == 1:
            db.call_proc(22, com[1:])
        elif com[0] == "sign_out":
            return False
        else:
            print("Wrong input.")
            print_help()


if __name__ == '__main__':
    Ghanari = DB()
    while True:
        sign_flag = True
        inp = input('Please enter a number:\n'
                    '1- Sign Up\n'
                    '2- Sign In\n'
                    '3- Exit\n')
        if inp == "1":
            while True:
                command = input('Please enter first_name/last_name/user_name/password/birth_date/bio \n'
                                'for example: Ali/Hassan/ali98/123456/1998-1-1/from Tehran\n').split('/')
                if len(command) == 6:
                    Ghanari.call_proc(1, command)
                    break
                else:
                    print("Wrong input.")
        elif inp == "2":
            while True:
                command = input('Please enter user_name/password\n'
                                'for example: ali98/123456\n').split('/')
                if len(command) == 2:
                    if check_login(Ghanari, command):
                        sign_flag = login(Ghanari)
                        if sign_flag:
                            print("Signed out.")
                            break
                    else:
                        sign_flag = False
                if not sign_flag:
                    break
                else:
                    print("Wrong input.")
        elif inp == "3":
            Ghanari.close_DB()
            sys.exit(0)
        elif sign_flag:
            print("Wrong input.")
