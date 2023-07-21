#!/usr/bin/python3


from prettytable import PrettyTable
from mysql.connector.connection import MySQLConnection, MySQLCursorBuffered
import mysql.connector
import inspect
import readline
import time
import re

## db connection & cursor
con: MySQLConnection
cur: MySQLCursorBuffered

current_user = None
# current_user = "t"  ### username: t password: t

## db connect config
db_host = "127.0.0.1"
db_port = 3306
db_password = "password"
if False: ## user & db for PROJ2 database (without data)
    db_user = "s_user"
    db_database = "PROJ2"
else: ## user & db for PROJ1 database (with data)
    db_user = "newuser"
    db_database = "PROJ1"

# sql_files_path = "./sql_files/{}.sql"
sql_files_path = "./sql_files/queries/{}.sql"
call_procedure = "p_{}"
connection_reset_wait = 0.02
pattern = '^[#][a-zA-Z][a-zA-Z][a-zA-Z][a-zA-Z][a-zA-Z]$'




commands_help = {

    "help": "show help",
    "create <first_name> <last_name> <username> <password>": "create new user",
    "login <username> <password>": "login user. use username 't' and password 't'. ex: 'login t t'",
    "logout": "logout user",
    "logins": "list login history",
    "ava <ava_text>": "send ava",
    "add_spec <ava_id> <spec>": "add spec to ava",
    "my_ava": "show current user ava",
    "follow <target_username>": "follow user",
    "unfollow <target_username>": "unfollow user",
    "block <target_username>": "block user",
    "unblock <target_username>": "unblock user",
    "feeds": "show following users feed",
    "feed <target_username>": "show user feeds",
    "comment <ava_id> <comment_text>": "send comment to ava or another comment",
    "comments <ava_id>": "get ava comments",
    "specs <spec_text>": "get all ava with spec",
    "like <ava_id>": "like ava",
    "likes_count <ava_id>": "show ava likes count",
    "likes <ava_id>": "ava likes list",
    "popular": "get most popular ava",
    "message <target_username> <text>": "message to another user",
    "forward <ava_id> <target_username>": "forward ava (message) to another user",
    "messages <target_username>": "get all messages from another user",
    "all_messages": "get all messages",
    "reset": "disconnect and reconnect to database",
    "exit": "disconnect and exit",

}

queries_map = {
    "create": "ایجاد حساب کاربری",
    "login": "ورود به حساب کاربری",
    "logins": "بررسی ورودهای کاربر",
    "ava": "ارسال آوا",
    "add_spec": "اضافه کردن علامت ویژه به آوا",
    "my_ava": "دریافت آواهای شخصی",
    "follow": "دنبال کردن",
    "unfollow": "توقف دنبال کردن",
    "block": "مسدود کردن",
    "unblock": "آزاد کردن",
    "feeds": "دربافت فعالیت دنبال شوندگان",
    "feed": "دربافت فعالیت کاربران",
    "comment": "نظر دادن",
    "comments": "دریافت نظرات آوا",
    "specs": "دریافت آواهای یک علامت ویژه",
    "like": "پسندیدن آوا",
    "likes_count": "دریافت تعداد پسندها",
    "likes": "دریافت لیست پسندیدگان",
    "popular": "دریافت اواهای پرطرفدار",
    "message": "ارسال پیام",
    "forward": "ارسال پیام به صورت آوا",
    "messages": "دریافت لیست پیام های دریافتی از کاربر",
    "all_messages": "دریافت لیست ارسال کنندگان پیام",

}
command_usage = {
    "create": "first_name = str(args[0])\nlast_name = str(args[1])\nusername = str(args[2])\npassword = str(args[3])",
    "login": "username = str(args[0])\npassword = str(args[1])",
    "ava": "ava_text = str(args[0])",
    "follow": "target_username = str(args[0])",
    "unfollow": "target_username = str(args[0])",
    "block": "target_username = str(args[0])",
    "unblock": "target_username = str(args[0])",
    "feed": "target_username = str(args[0])",
    "comment": "ava_id = str(args[0])\ncomment_text = str(args[1])",
    "comments": "ava_id = str(args[0])",
    "add_spec": "ava_id = str(args[0])\nspec = str(args[1])",
    "specs": "spec = str(args[0])",
    "like": "ava_id = str(args[0])",
    "likes_count": "ava_id = str(args[0])",
    "likes": "ava_id = str(args[0])",
    "message": "target_username = str(args[0])\ntext = str(args[1])",
    "forward": "ava_id = str(args[0])\ntarget_username = str(args[1])",
    "messages": "target_username = str(args[0])",

}



def connect() -> None:
    global con
    con = mysql.connector.connect(
        host=db_host,
        user=db_user,
        port=db_port,
        password=db_password,
        database=db_database,
    )
    con.get_warnings = True

    global cur
    cur = con.cursor(buffered=True)

def disconnect() -> None:
    cur.close()
    con.close()


def show_help() -> bool:
    x = PrettyTable()
    x.field_names = ["Command", "Description"]
    for command in commands_help:
        x.add_row([command, commands_help[command]])
    x._set_align('l')
    print(x)
    return True

def create(args) -> bool:
    if args.__len__() != 4:
        print("create usage:\n" + command_usage[inspect.currentframe().f_code.co_name])
        return False
    first_name = str(args[0])
    last_name = str(args[1])
    username = str(args[2])
    password = str(args[3])

    # with open(sql_files_path.format(queries_map[inspect.currentframe().f_code.co_name]), 'r') as sql_file:
    #     try:
    #         cur.execute(sql_file.read(), {
    #             "first_name": first_name,
    #             "last_name": last_name,
    #             "user_name": username,
    #             "password": password,
    #         },)
    #     except:
    #         print("duplicate username!")
    #         return False

    cur.callproc(call_procedure.format(inspect.currentframe().f_code.co_name),
        [
            first_name,
            last_name,
            username,
            password,
            0,
        ])

    con.commit()
    return True

def login(args) -> bool:
    global current_user
    if current_user != None:
        print("logout current account first!")
        return False

    if args.__len__() != 2:
        print("login usage:\n" + command_usage[inspect.currentframe().f_code.co_name])
        return False
    username = str(args[0])
    password = str(args[1])

    # with open(sql_files_path.format(queries_map[inspect.currentframe().f_code.co_name]), 'r') as sql_file:
    #     cur.execute(sql_file.read(), {
    #         "user_name": username,
    #         "password": password,
    #     },)

    result = cur.callproc(call_procedure.format(inspect.currentframe().f_code.co_name),
        [
            username,
            password,
            0,
        ])[2]

    # if cur.rowcount != 0:
    #     current_user = username
    #     successful_login = True
    # else:
    #     successful_login = False

    if result == '0':
        current_user = username
        successful_login = True
    elif result == '1':
        successful_login = False
    else:
        print("unknown error!")
        return False

    con.commit()
    return successful_login

def logout() -> bool:
    global current_user
    if current_user == None:
        print("no account logged in!")
        return False

    current_user = None
    return True

def logins() -> bool:
    global current_user
    if current_user == None:
        print("no account logged in!")
        return False

    cur.callproc(call_procedure.format(inspect.currentframe().f_code.co_name),
        [current_user, 0])

    for result in cur.stored_results():
        logs = result.fetchall()

    x = PrettyTable()
    x.field_names = ["Login Dates"]
    for log in logs:
        x.add_row([log[0]])
    x._set_align('l')
    print(x)

    return True

def ava(args) -> bool:
    global current_user
    if current_user == None:
        print("no account logged in!")
        return False

    if args.__len__() != 1:
        print("ava usage:\n" + command_usage[inspect.currentframe().f_code.co_name])
        return False
    ava_text = str(args[0])

    ava_specs = []
    for word in ava_text.split(' '):
        if word[0] == '#' and re.match(pattern, word):
            ava_specs.append(word)

    # ##* add ava
    # try:
    #     with open(sql_files_path.format(queries_map[inspect.currentframe().f_code.co_name]), 'r') as sql_file:
    #         for result in cur.execute(sql_file.read(), {
    #                 "context": ava_text,
    #                 "user_name": current_user,
    #             }, multi=True):
    #             if result.with_rows:
    #                 ava_id = result.fetchone()[0]
    # except:
    #     return False
    # con.commit()

    cur.callproc(call_procedure.format(inspect.currentframe().f_code.co_name),
        [ava_text, current_user, 0])

    for result in cur.stored_results():
        logs = result.fetchall()
        ava_id = int(logs[0][0])
    con.commit()

    for spec in ava_specs:
        if not add_spec([ava_id, spec]):
            return False
    return True

def add_spec(args) -> bool:
    global current_user
    if current_user == None:
        print("no account logged in!")
        return False

    if args.__len__() != 2:
        print("add_spec usage:\n" + command_usage[inspect.currentframe().f_code.co_name])
        return False
    ava_id = str(args[0])
    spec = str(args[1])

    con.get_warnings = False
    added = False
    with open(sql_files_path.format(queries_map[inspect.currentframe().f_code.co_name]), 'r') as sql_file:
        try:
            results = cur.execute(sql_file.read(), {
                "spec_text": spec,
                "ava_id": ava_id,
                "username": current_user,
            }, multi=True)
            q = 0
            if results != None:
                for r in results:
                    if q == 1 and r.rowcount != 0:
                        added = True
                    q += 1
        except:
            con.get_warnings = True
            print("spec is already added to ava or bad format!")
            return False
        con.commit()
    con.get_warnings = True

    if not added:
        print("you dont have permission!")
        return False

    return True

def my_ava() -> bool:
    global current_user
    if current_user == None:
        print("no account logged in!")
        return False

    # with open(sql_files_path.format(queries_map[inspect.currentframe().f_code.co_name]), 'r') as sql_file:
    #     cur.execute(sql_file.read(), {
    #         "user_name": current_user,
    #     },)

    cur.callproc(call_procedure.format(inspect.currentframe().f_code.co_name),
        [current_user])

    for result in cur.stored_results():
        results = result.fetchall()

    x = PrettyTable()
    x.field_names = ["Ava ID", "Context", "Date"]
    for log in results:
        x.add_row([log[0], log[1], log[2]])
    x._set_align('l')
    print(x)

    return True

def follow(args) -> bool:
    global current_user
    if current_user == None:
        print("no account logged in!")
        return False

    if args.__len__() != 1:
        print("follow usage:\n" + command_usage[inspect.currentframe().f_code.co_name])
        return False
    target_username = str(args[0])

    # with open(sql_files_path.format(queries_map[inspect.currentframe().f_code.co_name]), 'r') as sql_file:
    #     cur.execute(sql_file.read(), {
    #         "follower": current_user,
    #         "followed": target_username,
    #     },)
    # con.commit()

    cur.callproc(call_procedure.format(inspect.currentframe().f_code.co_name),
        [current_user, target_username])
    con.commit()

    # if cur.rowcount != 0:
    #     return True
    # print("cant follow because of target_username does not exists or already followed!")
    # return False
    return True

def unfollow(args) -> bool:
    global current_user
    if current_user == None:
        print("no account logged in!")
        return False

    if args.__len__() != 1:
        print("unfollow usage:\n" + command_usage[inspect.currentframe().f_code.co_name])
        return False
    target_username = str(args[0])

    # with open(sql_files_path.format(queries_map[inspect.currentframe().f_code.co_name]), 'r') as sql_file:
    #     cur.execute(sql_file.read(), {
    #         "follower_username": current_user,
    #         "followed_username": target_username,
    #     },)
    # con.commit()

    cur.callproc(call_procedure.format(inspect.currentframe().f_code.co_name),
        [current_user, target_username])
    con.commit()

    # if cur.rowcount != 0:
    #     return True
    # print("cant unfollow because of target_username does not exists or already unfollowed!")
    # return False
    return True

def block(args) -> bool:
    global current_user
    if current_user == None:
        print("no account logged in!")
        return False

    if args.__len__() != 1:
        print("block usage:\n" + command_usage[inspect.currentframe().f_code.co_name])
        return False
    target_username = str(args[0])

    # with open(sql_files_path.format(queries_map[inspect.currentframe().f_code.co_name]), 'r') as sql_file:
    #     cur.execute(sql_file.read(), {
    #         "blocker": current_user,
    #         "blocked": target_username,
    #     },)
    # con.commit()

    cur.callproc(call_procedure.format(inspect.currentframe().f_code.co_name),
        [current_user, target_username])
    con.commit()

    # if cur.rowcount != 0:
    #     return True
    # print("cant block because of target_username does not exists or already blocked!")
    # return False
    return True

def unblock(args) -> bool:
    global current_user
    if current_user == None:
        print("no account logged in!")
        return False

    if args.__len__() != 1:
        print("unblock usage:\n" + command_usage[inspect.currentframe().f_code.co_name])
        return False
    target_username = str(args[0])

    # with open(sql_files_path.format(queries_map[inspect.currentframe().f_code.co_name]), 'r') as sql_file:
    #     cur.execute(sql_file.read(), {
    #         "blocker_username": current_user,
    #         "blocked_username": target_username,
    #     },)
    # con.commit()

    cur.callproc(call_procedure.format(inspect.currentframe().f_code.co_name),
        [current_user, target_username])
    con.commit()

    # if cur.rowcount != 0:
    #     return True
    # print("cant unblock because of target_username does not exists or already unblocked!")
    # return False
    return True

def feeds() -> bool:
    global current_user
    if current_user == None:
        print("no account logged in!")
        return False

    # with open(sql_files_path.format(queries_map[inspect.currentframe().f_code.co_name]), 'r') as sql_file:
    #     cur.execute(sql_file.read(), {
    #         "user_name": current_user,
    #     },)

    cur.callproc(call_procedure.format(inspect.currentframe().f_code.co_name),
        [current_user])

    for result in cur.stored_results():
        results = result.fetchall()

    x = PrettyTable()
    x.field_names = ["Ava ID", "Sender", "Context", "Date", "Comment to Ava ID"]
    for log in results:
    # for log in cur.fetchall():
        x.add_row([log[0], log[1], log[2], log[3], log[4]])
    x._set_align('l')
    print(x)

    return True

def feed(args) -> bool:
    global current_user
    if current_user == None:
        print("no account logged in!")
        return False

    if args.__len__() != 1:
        print("feed usage:\n" + command_usage[inspect.currentframe().f_code.co_name])
        return False
    target_username = str(args[0])

    # with open(sql_files_path.format(queries_map[inspect.currentframe().f_code.co_name]), 'r') as sql_file:
    #     cur.execute(sql_file.read(), {
    #         "target_username": target_username,
    #         "request_from_username": current_user,
    #     },)
    cur.callproc(call_procedure.format(inspect.currentframe().f_code.co_name),
        [current_user, target_username])

    for result in cur.stored_results():
        results = result.fetchall()

    x = PrettyTable()
    x.field_names = ["Ava ID", "Context", "Date"]
    for log in results:
    # for log in cur.fetchall():
        x.add_row([log[0], log[1], log[2]])
    x._set_align('l')
    print(x)

    return True

def comment(args) -> bool:
    global current_user
    if current_user == None:
        print("no account logged in!")
        return False

    if args.__len__() != 2:
        print("comment usage:\n" + command_usage[inspect.currentframe().f_code.co_name])
        return False
    ava_id = str(args[0])
    comment_text = str(args[1])

    # with open(sql_files_path.format(queries_map[inspect.currentframe().f_code.co_name]), 'r') as sql_file:
    #     try:
    #         cur.execute(sql_file.read(), {
    #             "user_name": current_user,
    #             "ava_id": ava_id,
    #             "context": comment_text,
    #         },)
    #     except:
    #         print("ava id not found!")
    #         return False
    # con.commit()

    cur.callproc(call_procedure.format(inspect.currentframe().f_code.co_name),
        [current_user, comment_text, ava_id])
    con.commit()

    return True

def comments(args) -> bool:
    global current_user
    if current_user == None:
        print("no account logged in!")
        return False

    if args.__len__() != 1:
        print("comments usage:\n" + command_usage[inspect.currentframe().f_code.co_name])
        return False
    ava_id = str(args[0])

    # with open(sql_files_path.format(queries_map[inspect.currentframe().f_code.co_name]), 'r') as sql_file:
    #     cur.execute(sql_file.read(), {
    #         "username": current_user,
    #         "ava_id": ava_id,
    #     },)
    cur.callproc(call_procedure.format(inspect.currentframe().f_code.co_name),
        [current_user, ava_id])

    for result in cur.stored_results():
        results = result.fetchall()

    x = PrettyTable()
    # print(cur.fetchall())
    x.field_names = ["Ava ID(comment id)", "Sender", "Context", "Date"]
    for log in results:
    # for log in cur.fetchall():
        x.add_row([log[0], log[1], log[2], log[3]])
    x._set_align('l')
    print(x)

    return True

def specs(args) -> bool:
    global current_user
    if current_user == None:
        print("no account logged in!")
        return False

    if args.__len__() != 1:
        print("specs usage:\n" + command_usage[inspect.currentframe().f_code.co_name])
        return False
    spec = str(args[0])

    # with open(sql_files_path.format(queries_map[inspect.currentframe().f_code.co_name]), 'r') as sql_file:
    #     cur.execute(sql_file.read(), {
    #         "user_name": current_user,
    #         "spec_text": spec,
    #     })
    cur.callproc(call_procedure.format(inspect.currentframe().f_code.co_name),
        [current_user, spec])

    for result in cur.stored_results():
        results = result.fetchall()

    x = PrettyTable()
    x.field_names = ["Ava ID", "Sender", "Context", "Date", "Comment to ava"]

    for log in results:
    # for log in cur.fetchall():
        x.add_row([log[0], log[1], log[2], log[3], log[4]])
    x._set_align('l')
    print(x)

    return True

def like(args) -> bool:
    global current_user
    if current_user == None:
        print("no account logged in!")
        return False

    if args.__len__() != 1:
        print("like usage:\n" + command_usage[inspect.currentframe().f_code.co_name])
        return False
    ava_id = str(args[0])

    # with open(sql_files_path.format(queries_map[inspect.currentframe().f_code.co_name]), 'r') as sql_file:
    #     cur.execute(sql_file.read(), {
    #         "user_name": current_user,
    #         "ava_id": ava_id,
    #     },)
    # con.commit()

    cur.callproc(call_procedure.format(inspect.currentframe().f_code.co_name),
        [current_user, ava_id])
    con.commit()

    # if cur.rowcount != 0:
    #     return True
    # print("cant like because of target_username does not exists or ava already liked or you are block!")
    # return False
    return True

def likes_count(args) -> bool:
    global current_user
    if current_user == None:
        print("no account logged in!")
        return False

    if args.__len__() != 1:
        print("likes_count usage:\n" + command_usage[inspect.currentframe().f_code.co_name])
        return False
    ava_id = str(args[0])

    # with open(sql_files_path.format(queries_map[inspect.currentframe().f_code.co_name]), 'r') as sql_file:
    #     cur.execute(sql_file.read(), {
    #         "user_name": current_user,
    #         "ava_id": ava_id,
    #     },)

    # try:
    #     count = int(cur.fetchone()[0])
    #     print(count)
    #     return True
    # except:
    #     print("something went wrong!")
    #     return False
    cur.callproc(call_procedure.format(inspect.currentframe().f_code.co_name),
        [current_user, ava_id])

    for result in cur.stored_results():
        results = result.fetchall()
    print(results[0][0])
    return True

def likes(args) -> bool:
    global current_user
    if current_user == None:
        print("no account logged in!")
        return False

    if args.__len__() != 1:
        print("likes_count usage:\n" + command_usage[inspect.currentframe().f_code.co_name])
        return False
    ava_id = str(args[0])

    # with open(sql_files_path.format(queries_map[inspect.currentframe().f_code.co_name]), 'r') as sql_file:
    #     cur.execute(sql_file.read(), {
    #         "user_name": current_user,
    #         "ava_id": ava_id,
    #     },)

    cur.callproc(call_procedure.format(inspect.currentframe().f_code.co_name),
        [current_user, ava_id])

    for result in cur.stored_results():
        results = result.fetchall()

    x = PrettyTable()
    x.field_names = ["Username"]
    for log in results:
    # for log in cur.fetchall():
        x.add_row([log[0],])
    x._set_align('l')
    print(x)

    return True

def popular() -> bool:
    global current_user
    if current_user == None:
        print("no account logged in!")
        return False

    # with open(sql_files_path.format(queries_map[inspect.currentframe().f_code.co_name]), 'r') as sql_file:
    #     cur.execute(sql_file.read(), {
    #         "user_name": current_user,
    #     },)
    cur.callproc(call_procedure.format(inspect.currentframe().f_code.co_name),
        [current_user])

    for result in cur.stored_results():
        results = result.fetchall()

    x = PrettyTable()
    x.field_names = ["Ava ID", "Sender", "Context", "Date"]
    for log in results:
    # for log in cur.fetchall():
        x.add_row([log[0], log[1], log[2], log[3]])
    x._set_align('l')
    print(x)

    return True

def message(args) -> bool:
    global current_user
    if current_user == None:
        print("no account logged in!")
        return False

    if args.__len__() != 2:
        print("message usage:\n" + command_usage[inspect.currentframe().f_code.co_name])
        return False
    target_username = str(args[0])
    text = str(args[1])

    # with open(sql_files_path.format(queries_map[inspect.currentframe().f_code.co_name]), 'r') as sql_file:
    #     cur.execute(sql_file.read(), {
    #         "sender_username": current_user,
    #         "receiver_username": target_username,
    #         "context": text,
    #     },)
    # con.commit()

    # if cur.rowcount != 0:
    #     return True
    # print("cant send message because of target_username does not exists or target blocked you!")
    # return False
    cur.callproc(call_procedure.format(inspect.currentframe().f_code.co_name),
        [text, current_user, target_username])
    con.commit()

    return True

def forward(args) -> bool:
    global current_user
    if current_user == None:
        print("no account logged in!")
        return False

    if args.__len__() != 2:
        print("message usage:\n" + command_usage[inspect.currentframe().f_code.co_name])
        return False
    ava_id = str(args[0])
    target_username = str(args[1])

    # with open(sql_files_path.format(queries_map[inspect.currentframe().f_code.co_name]), 'r') as sql_file:
    #     cur.execute(sql_file.read(), {
    #         "sender_username": current_user,
    #         "receiver_username": target_username,
    #         "ava_id": ava_id,
    #     },)
    # con.commit()

    # if cur.rowcount != 0:
    #     return True
    # print("cant forward because of target_username does not exists or ava_id does not exists or target blocked you or ava_sender blocked you!")
    # return False
    try:
        cur.callproc(call_procedure.format(inspect.currentframe().f_code.co_name),
            [ava_id, current_user, target_username])
    except:
        return False
    con.commit()
    return True

def messages(args) -> bool:
    global current_user
    if current_user == None:
        print("no account logged in!")
        return False

    if args.__len__() != 1:
        print("messages usage:\n" + command_usage[inspect.currentframe().f_code.co_name])
        return False
    target_username = str(args[0])

    # with open(sql_files_path.format(queries_map[inspect.currentframe().f_code.co_name]), 'r') as sql_file:
    #     cur.execute(sql_file.read(), {
    #         "receiver_username": current_user,
    #         "sender_username": target_username,
    #     },)
    # results = cur.fetchall()

    cur.callproc(call_procedure.format(inspect.currentframe().f_code.co_name),
        [current_user, target_username])
    for result in cur.stored_results():
        results = result.fetchall()

    m = PrettyTable()
    a = PrettyTable()
    m.field_names = ["MSG ID", "Context", "Date"]
    a.field_names = ["MSG ID", "Ava ID", "Context", "Date"]
    for result in results:
        if result[2] == None: ## ava id is null
            m.add_row([result[0], result[1], result[3]])
        else: ## message is ava
            a.add_row([result[0], result[2], result[3], result[4]])
    m._set_align('l')
    a._set_align('l')
    print("messages as text:")
    print(m)
    print("\nmessages as forwarded ava:")
    print(a)
    print()

    return True

def all_messages() -> bool:
    global current_user
    if current_user == None:
        print("no account logged in!")
        return False

    # with open(sql_files_path.format(queries_map[inspect.currentframe().f_code.co_name]), 'r') as sql_file:
    #     cur.execute(sql_file.read(), {
    #         "username": current_user,
    #     },)
    # results = cur.fetchall()
    cur.callproc(call_procedure.format(inspect.currentframe().f_code.co_name),
        [current_user])

    for result in cur.stored_results():
        results = result.fetchall()

    m = PrettyTable()
    a = PrettyTable()
    m.field_names = ["MSG ID", "Sender", "Context", "Date"]
    a.field_names = ["MSG ID", "Ava ID", "Sender", "Context", "Date"]
    for result in results:
        if result[3] == None: ## ava id is null
            m.add_row([result[0], result[1], result[2], result[4]])
        else: ## message is ava
            a.add_row([result[0], result[3], result[1], result[5], result[4]])
    m._set_align('l')
    a._set_align('l')
    print("messages as text:")
    print(m)
    print("\nmessages as forwarded ava:")
    print(a)
    print()

    return True


def reset() -> bool:
    disconnect()
    # print("database disconnected")

    time.sleep(connection_reset_wait)

    connect()
    # print("connected to " + str(db_database) + " as " + str(db_user) + " ...")
    return True

def my_exit() -> None:
    disconnect()
    print()
    print()
    print("database disconnected")
    print("bye")
    exit()

def get_user_input() -> list:
    ##* get and prepare input
    print()
    tag = "> "
    if current_user != None:
        tag = str(current_user) + tag
    try:
        user_input = input(tag)
    except KeyboardInterrupt:
        my_exit()

    ##* prepare input
    user_input = user_input.strip()
    if user_input.__len__() == 0:
        return None, None
    if user_input.count('"') % 2 != 0:
        print("count of \" is even!")
        return None, None
    while user_input.find('  ') != -1: user_input = user_input.replace('  ', ' ')

    ##* find command and args
    command_args = []
    index = base_index = 0
    while True:
        if user_input[index] == '"':
            next_d = user_input.find('"', index+1)
            command_args.append(user_input[index+1:next_d])
            index = next_d + 1 ## expect ' ' after '"'
            base_index = index + 1
        elif user_input[index] == ' ':
            command_args.append(user_input[base_index:index])
            base_index = index + 1
        elif index == user_input.__len__() - 1:
            command_args.append(user_input[base_index:index + 1])

        index += 1
        if index >= user_input.__len__():
            return command_args.pop(0).lower(), command_args



if __name__ == "__main__":
    ##* connect database
    connect()
    print("connected to " + str(db_database) + " as " + str(db_user) + " ...")
    print("")

    while True:
        command, command_args = get_user_input()
        command_result = None

        ##* check commands
        if   command == None:             continue
        elif command == 'help':         command_result = show_help()
        elif command == 'create':       command_result = create(command_args)
        elif command == 'login':        command_result = login(command_args)
        elif command == 'logout':       command_result = logout()
        elif command == 'logins':       command_result = logins()
        elif command == 'ava':          command_result = ava(command_args)
        elif command == 'my_ava':       command_result = my_ava()
        elif command == 'follow':       command_result = follow(command_args)
        elif command == 'unfollow':     command_result = unfollow(command_args)
        elif command == 'block':        command_result = block(command_args)
        elif command == 'unblock':      command_result = unblock(command_args)
        elif command == 'feeds':        command_result = feeds()
        elif command == 'feed':         command_result = feed(command_args)
        elif command == 'comment':      command_result = comment(command_args)
        elif command == 'comments':     command_result = comments(command_args)
        elif command == 'add_spec':     command_result = add_spec(command_args)
        elif command == 'specs':        command_result = specs(command_args)
        elif command == 'like':         command_result = like(command_args)
        elif command == 'likes_count':  command_result = likes_count(command_args)
        elif command == 'likes':        command_result = likes(command_args)
        elif command == 'popular':      command_result = popular()
        elif command == 'message':      command_result = message(command_args)
        elif command == 'forward':      command_result = forward(command_args)
        elif command == 'messages':     command_result = messages(command_args)
        elif command == 'all_messages': command_result = all_messages()
        elif command == 'reset':        command_result = reset()
        elif command == 'exit':                          my_exit()
        else:                                            print("command not found!")

        if command_result: print("success")
        elif not command_result: print("failed")

        reset()






