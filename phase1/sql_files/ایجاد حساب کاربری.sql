-- ایجاد حساب کاربری

-- INSERT INTO
--     USERS (
--         FIRST_NAME,
--         LAST_NAME,
--         USER_NAME,
--         PASSWORD,
--         REGISTER_DATE
--     )
-- VALUES
--     (
--         %(first_name)s,
--         %(last_name)s,
--         %(user_name)s,
--         md5(%(password)s),
--         NOW()
--     );

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
        "USER 1 FIRST NAME",
        "USER 1 LAST NAME",
        "U1_USERNAME",
        md5("P@55vv0rd"),
        NOW()
    );

INSERT INTO
    USERS (
        FIRST_NAME,
        LAST_NAME,
        USER_NAME,
        PASSWORD,
        REGISTER_DATE
    )
VALUES
    ("aaa", "AA", "aaAA", md5("aaaAAAaaaAA"), NOW());

INSERT INTO
    USERS (
        FIRST_NAME,
        LAST_NAME,
        USER_NAME,
        PASSWORD,
        REGISTER_DATE
    )
VALUES
    ("bbbbb", "B", "BBbB", md5("bBBbbbBB"), NOW());



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
        "u4",
        "u44last",
        "U44",
        md5("UU$U$4u$U$U4U"),
        NOW()
    );

