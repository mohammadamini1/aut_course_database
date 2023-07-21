-- ارسال پیام
-- ارسال پیام به صورت آوا در یک فایل دیگه هستش
-- INSERT INTO
--     MSG (SENDER_ID, RECEIVER_ID, CONTEXT)
-- SELECT
--     U1.U_ID,
--     U2.U_ID,
--     (%(context)s)                               -- context
-- FROM
--     USERS AS U1
--     CROSS JOIN USERS AS U2
-- WHERE
--     U1.USER_NAME = %(sender_username)s          -- sender username
--     AND U2.USER_NAME = %(sender_username)s      -- receiver username
--     AND (U2.U_ID, U1.U_ID) NOT IN (
--         SELECT
--             *
--         FROM
--             BLOCKED_USERS
--     );

INSERT INTO
    MSG (SENDER_ID, RECEIVER_ID, CONTEXT)
SELECT
    U1.U_ID,
    U2.U_ID,
    (" USER 1 TO USER 5")
FROM
    USERS AS U1
    CROSS JOIN USERS AS U2
WHERE
    U1.USER_NAME = "U1_USERNAME"
    AND U2.USER_NAME = "U44"
    AND (U2.U_ID, U1.U_ID) NOT IN (
        SELECT
            *
        FROM
            BLOCKED_USERS
    );

INSERT INTO
    MSG (SENDER_ID, RECEIVER_ID, CONTEXT)
SELECT
    U1.U_ID,
    U2.U_ID,
    ("CANT MSG FROM 1 TO 2 ://// ")
FROM
    USERS AS U1
    CROSS JOIN USERS AS U2
WHERE
    U1.USER_NAME = "U1_USERNAME"
    AND U2.USER_NAME = "aaAA"
    AND (U2.U_ID, U1.U_ID) NOT IN (
        SELECT
            *
        FROM
            BLOCKED_USERS
    );

INSERT INTO
    MSG (SENDER_ID, RECEIVER_ID, CONTEXT)
SELECT
    U1.U_ID,
    U2.U_ID,
    ("BUT CAN MSG FROM 2 TO 1 !!!!!! ")
FROM
    USERS AS U1
    CROSS JOIN USERS AS U2
WHERE
    U1.USER_NAME = "aaAA"
    AND U2.USER_NAME = "U1_USERNAME"
    AND (U2.U_ID, U1.U_ID) NOT IN (
        SELECT
            *
        FROM
            BLOCKED_USERS
    );


INSERT INTO
    MSG (SENDER_ID, RECEIVER_ID, CONTEXT)
SELECT
    U1.U_ID,
    U2.U_ID,
    ("MY first msg to 3 :p")
FROM
    USERS AS U1
    CROSS JOIN USERS AS U2
WHERE
    U1.USER_NAME = "U1_USERNAME"
    AND U2.USER_NAME = "BBbB"
    AND (U2.U_ID, U1.U_ID) NOT IN (
        SELECT
            *
        FROM
            BLOCKED_USERS
    );




INSERT INTO
    MSG (SENDER_ID, RECEIVER_ID, CONTEXT)
SELECT
    U1.U_ID,
    U2.U_ID,
    ("BB TO U1 11111")
FROM
    USERS AS U1
    CROSS JOIN USERS AS U2
WHERE
    U1.USER_NAME = "BBbB"
    AND U2.USER_NAME = "U1_USERNAME"
    AND (U2.U_ID, U1.U_ID) NOT IN (
        SELECT
            *
        FROM
            BLOCKED_USERS
    );

INSERT INTO
    MSG (SENDER_ID, RECEIVER_ID, CONTEXT)
SELECT
    U1.U_ID,
    U2.U_ID,
    ("U44 (AS 5) TO U1 AS 1")
FROM
    USERS AS U1
    CROSS JOIN USERS AS U2
WHERE
    U1.USER_NAME = "U44"
    AND U2.USER_NAME = "U1_USERNAME"
    AND (U2.U_ID, U1.U_ID) NOT IN (
        SELECT
            *
        FROM
            BLOCKED_USERS
    );


--