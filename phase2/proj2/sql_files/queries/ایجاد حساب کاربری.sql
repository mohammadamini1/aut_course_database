-- ایجاد حساب کاربری

INSERT INTO
    USERS (
        FIRST_NAME,
        LAST_NAME,
        USER_NAME,
        PASSWORD,
        REGISTER_DATE
    )
VALUES
    (
        %(first_name)s,
        %(last_name)s,
        %(user_name)s,
        md5(%(password)s),
        NOW()
    );
