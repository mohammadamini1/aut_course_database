-- ارسال پیام (به صورت آوا)
-- INSERT INTO
--     MSG (SENDER_ID, RECEIVER_ID, AVA_ID)
-- SELECT
--     U1.U_ID,
--     U2.U_ID,
--     (%(ava_id)s)                                                    -- AVA ID
-- FROM
--     USERS AS U1
--     CROSS JOIN USERS AS U2
-- WHERE
--     U1.USER_NAME = %(sender_username)s                             -- sender username
--     AND U2.USER_NAME = %(receiver_username)s                       -- receiver username
--     AND (U2.U_ID, U1.U_ID) NOT IN (
--         SELECT
--             *
--         FROM
--             BLOCKED_USERS
--     )
--     AND NOT EXISTS(
--         SELECT
--             *
--         FROM
--             AVA
--             LEFT JOIN BLOCKED_USERS ON SENDER_ID = BLOCKER
--         WHERE
--             A_ID = (%(ava_id)s)                                             -- AVA ID
--             AND BLOCKED = U1.U_ID
--     );



INSERT INTO
    MSG (SENDER_ID, RECEIVER_ID, AVA_ID)
SELECT
    U1.U_ID,
    U2.U_ID,
    (8)
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
    )
    AND NOT EXISTS(
        SELECT
            *
        FROM
            AVA
            LEFT JOIN BLOCKED_USERS ON SENDER_ID = BLOCKER
        WHERE
            A_ID = 8
            AND BLOCKED = U1.U_ID
    );

INSERT INTO
    MSG (SENDER_ID, RECEIVER_ID, AVA_ID)
SELECT
    U1.U_ID,
    U2.U_ID,
    (8)
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
    )
    AND NOT EXISTS(
        SELECT
            *
        FROM
            AVA
            LEFT JOIN BLOCKED_USERS ON SENDER_ID = BLOCKER
        WHERE
            A_ID = 8
            AND BLOCKED = U1.U_ID
    );

INSERT INTO
    MSG (SENDER_ID, RECEIVER_ID, AVA_ID)
SELECT
    U1.U_ID,
    U2.U_ID,
    (5)
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
    )
    AND NOT EXISTS(
        SELECT
            *
        FROM
            AVA
            LEFT JOIN BLOCKED_USERS ON SENDER_ID = BLOCKER
        WHERE
            A_ID = 5
            AND BLOCKED = U1.U_ID
    );

INSERT INTO
    MSG (SENDER_ID, RECEIVER_ID, AVA_ID)
SELECT
    U1.U_ID,
    U2.U_ID,
    (2)
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
    )
    AND NOT EXISTS(
        SELECT
            *
        FROM
            AVA
            LEFT JOIN BLOCKED_USERS ON SENDER_ID = BLOCKER
        WHERE
            A_ID = 2
            AND BLOCKED = U1.U_ID
    );

--

INSERT INTO
    MSG (SENDER_ID, RECEIVER_ID, AVA_ID)
SELECT
    U1.U_ID,
    U2.U_ID,
    (1)
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
    )
    AND NOT EXISTS(
        SELECT
            *
        FROM
            AVA
            LEFT JOIN BLOCKED_USERS ON SENDER_ID = BLOCKER
        WHERE
            A_ID = 1
            AND BLOCKED = U1.U_ID
    );

--