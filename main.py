import sys
import mysql.connector as sql


class DB:
    proc_number = {
                    1: "add_hashtag_ava",
                    2: "block",
                    3: "comment",
                    4: "follow",
                    5: "like_ava",
                    6: "login",
                    7: "make_tables",
                    8: "register_account",
                    9: "send_ava",
                    10: "send_message",
                    11: "show_ava_hashtags",
                    12: "show_comments",
                    13: "show_following_activity",
                    14: "show_like_number",
                    15: "show_likers",
                    16: "show_logins",
                    17: "show_massages",
                    18: "show_popular_ava",
                    19: "show_senders",
                    20: "show_user_activity",
                    21: "show_user_avas",
                    22: "unblock",
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
        cursor = self._db.cursor(buffered=True)
        cursor.callproc(self.proc_number[code], args)
        for result in cursor.stored_results():
            print(result.fetchall())
        cursor.close()

    def close_DB(self):
        self._db.close()


def print_help():
    print('send <message>\t\t- to send message\n'
          'send -e <message>\t- to send encrypt message\n'
          'upload <location>\t- upload file in the server\n'
          'exec <command>\t\t- run command in server\n'
          'scan <ipsrc/ipdes>\t- to scan port for example scan 192.168.1.0-192.168.1.3\n'
          'exit\t\t\t\t- to leave program\n')


if __name__ == '__main__':
    Ghanari = DB()
    print_help()
    Ghanari.call_proc(2, ["a", "b"])
    while True:
        command = input('> ').split(' ')
        if len(command) == 1:
            if command[0] == 'history':
                print("ff")
            elif command[0] in ['?', 'help']:
                print_help()
            elif command[0] == 'exit':
                sys.exit(0)
            else:
                print('command not found please type ?/help')
        elif len(command) >= 2:
            if command[0] == 'upload':
                print('message')
            elif command[0] == 'send':
                if command[1] == '-e':
                    if len(command) > 2:
                        text = " ".join(command[i]
                                        for i in range(2, len(command)))
                        print('message')
                else:
                    print('message')
            else:
                print('command not found please type ?/help')
