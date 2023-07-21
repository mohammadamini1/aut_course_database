-- نظر دادن
-- INSERT INTO
--     AVA (
--         SENDER_ID,
--         CONTEXT,
--         COMMENT_TO_AVA_ID
--     )
-- SELECT
--     DISTINCT U_ID,
--     (%(context)s),                                                   -- context from api
--     (%(ava_id)s)                                                     -- ava id from api
-- FROM
--     USERS
-- WHERE
--     USER_NAME = %(user_name)s                                        -- request from username
--     AND NOT EXISTS (
--         SELECT
--             *
--         FROM
--             USERS AS U1
--             CROSS JOIN AVA
--             LEFT JOIN BLOCKED_USERS ON SENDER_ID = BLOCKED_USERS.BLOCKER
--             LEFT JOIN USERS AS U2 ON U2.U_ID = BLOCKED
--         WHERE
--             U1.USER_NAME = %(user_name)s                             -- request from username
--             AND A_ID = %(ava_id)s                                    -- ava id from api
--             AND U1.U_ID = BLOCKED
--     );


-- نظر دادن
INSERT INTO
    AVA (
        SENDER_ID,
        CONTEXT,
        COMMENT_TO_AVA_ID
    )
SELECT
    DISTINCT U_ID,
    ("DELETE YOUR POST! :/ "),
    (5)
FROM
    USERS
WHERE
    USER_NAME = "BBbB"
    AND NOT EXISTS (
        SELECT
            *
        FROM
            USERS AS U1
            CROSS JOIN AVA
            LEFT JOIN BLOCKED_USERS ON SENDER_ID = BLOCKED_USERS.BLOCKER
            LEFT JOIN USERS AS U2 ON U2.U_ID = BLOCKED
        WHERE
            U1.USER_NAME = "BBbB"
            AND A_ID = 5
            AND U1.U_ID = BLOCKED
    );

INSERT INTO
    AVA (
        SENDER_ID,
        CONTEXT,
        COMMENT_TO_AVA_ID
    )
SELECT
    DISTINCT U_ID,
    ("DONT DELETE YOUR POST! :))) "),
    (8)
FROM
    USERS
WHERE
    USER_NAME = "BBbB"
    AND NOT EXISTS (
        SELECT
            *
        FROM
            USERS AS U1
            CROSS JOIN AVA
            LEFT JOIN BLOCKED_USERS ON SENDER_ID = BLOCKED_USERS.BLOCKER
            LEFT JOIN USERS AS U2 ON U2.U_ID = BLOCKED
        WHERE
            U1.USER_NAME = "BBbB"
            AND A_ID = 8
            AND U1.U_ID = BLOCKED
    );


INSERT INTO
    AVA (
        SENDER_ID,
        CONTEXT,
        COMMENT_TO_AVA_ID
    )
SELECT
    DISTINCT U_ID,
    ("++++++++++++++++"),
    (8)
FROM
    USERS
WHERE
    USER_NAME = "U1_USERNAME"
    AND NOT EXISTS (
        SELECT
            *
        FROM
            USERS AS U1
            CROSS JOIN AVA
            LEFT JOIN BLOCKED_USERS ON SENDER_ID = BLOCKED_USERS.BLOCKER
            LEFT JOIN USERS AS U2 ON U2.U_ID = BLOCKED
        WHERE
            U1.USER_NAME = "U1_USERNAME"
            AND A_ID = 8
            AND U1.U_ID = BLOCKED
    );


INSERT INTO
    AVA (
        SENDER_ID,
        CONTEXT,
        COMMENT_TO_AVA_ID
    )
SELECT
    DISTINCT U_ID,
    ("NICE POST! :))) "),
    (8)
FROM
    USERS
WHERE
    USER_NAME = "aaAA"
    AND NOT EXISTS (
        SELECT
            *
        FROM
            USERS AS U1
            CROSS JOIN AVA
            LEFT JOIN BLOCKED_USERS ON SENDER_ID = BLOCKED_USERS.BLOCKER
            LEFT JOIN USERS AS U2 ON U2.U_ID = BLOCKED
        WHERE
            U1.USER_NAME = "aaAA"
            AND A_ID = 8
            AND U1.U_ID = BLOCKED
    );


INSERT INTO
    AVA (
        SENDER_ID,
        CONTEXT,
        COMMENT_TO_AVA_ID
    )
SELECT
    DISTINCT U_ID,
    ("ok dont delete."),
    (28)
FROM
    USERS
WHERE
    USER_NAME = "U44"
    AND NOT EXISTS (
        SELECT
            *
        FROM
            USERS AS U1
            CROSS JOIN AVA
            LEFT JOIN BLOCKED_USERS ON SENDER_ID = BLOCKED_USERS.BLOCKER
            LEFT JOIN USERS AS U2 ON U2.U_ID = BLOCKED
        WHERE
            U1.USER_NAME = "U44"
            AND A_ID = 28
            AND U1.U_ID = BLOCKED
    );
