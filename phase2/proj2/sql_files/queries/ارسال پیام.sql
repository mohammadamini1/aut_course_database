-- ارسال پیام
-- ارسال پیام به صورت آوا در یک فایل دیگه هستش

INSERT INTO
    MSG (SENDER_ID, RECEIVER_ID, CONTEXT)
SELECT
    U1.U_ID,
    U2.U_ID,
    (%(context)s)                               -- context
FROM
    USERS AS U1
    CROSS JOIN USERS AS U2
WHERE
    U1.USER_NAME = %(sender_username)s          -- sender username
    AND U2.USER_NAME = %(receiver_username)s      -- receiver username
    AND (U2.U_ID, U1.U_ID) NOT IN (
        SELECT
            *
        FROM
            BLOCKED_USERS
    );
