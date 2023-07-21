-- -- دریافت نظرات آوا
-- SELECT
--     *
-- FROM
--     AVA
-- WHERE
--     COMMENT_TO_AVA_ID = %(ava_id)s                                        -- ava id
--     AND NOT EXISTS (
--         SELECT
--             -- BLOCKED
--             *
--         FROM
--             AVA
--             LEFT JOIN BLOCKED_USERS ON SENDER_ID = BLOCKED_USERS.BLOCKER
--             LEFT JOIN USERS ON USERS.U_ID = BLOCKED
--         WHERE
--             A_ID = %(ava_id)s                                           -- ava id
--             AND USER_NAME = %(username)s                                -- request from username
--     )
--     AND SENDER_ID IN (
--         SELECT
--             DISTINCT SENDER_ID
--         FROM
--             AVA
--             LEFT JOIN BLOCKED_USERS ON SENDER_ID = BLOCKED_USERS.BLOCKER
--             LEFT JOIN USERS ON USERS.U_ID = BLOCKED
--         WHERE
--             COMMENT_TO_AVA_ID = %(ava_id)s                              -- ava id
--         EXCEPT
--         SELECT
--             SENDER_ID
--         FROM
--             AVA
--             LEFT JOIN BLOCKED_USERS ON SENDER_ID = BLOCKED_USERS.BLOCKER
--             LEFT JOIN USERS ON USERS.U_ID = BLOCKED
--         WHERE
--             COMMENT_TO_AVA_ID = %(ava_id)s                              -- ava id
--             AND USER_NAME = %(username)s                                -- request from username
--     );


-- دریافت نظرات آوا
SELECT
    *
FROM
    AVA
WHERE
    COMMENT_TO_AVA_ID = 8
    AND NOT EXISTS (
        SELECT
            -- BLOCKED
            *
        FROM
            AVA
            LEFT JOIN BLOCKED_USERS ON SENDER_ID = BLOCKED_USERS.BLOCKER
            LEFT JOIN USERS ON USERS.U_ID = BLOCKED
        WHERE
            A_ID = 8
            AND USER_NAME = "aaAA"
    )
    AND SENDER_ID IN (
        SELECT
            DISTINCT SENDER_ID
        FROM
            AVA
            LEFT JOIN BLOCKED_USERS ON SENDER_ID = BLOCKED_USERS.BLOCKER
            LEFT JOIN USERS ON USERS.U_ID = BLOCKED
        WHERE
            COMMENT_TO_AVA_ID = 8
        EXCEPT
        SELECT
            SENDER_ID
        FROM
            AVA
            LEFT JOIN BLOCKED_USERS ON SENDER_ID = BLOCKED_USERS.BLOCKER
            LEFT JOIN USERS ON USERS.U_ID = BLOCKED
        WHERE
            COMMENT_TO_AVA_ID = 8
            AND USER_NAME = "aaAA"
    );

-- دریافت نظرات آوا
SELECT
    *
FROM
    AVA
WHERE
    COMMENT_TO_AVA_ID = 8
    AND NOT EXISTS (
        SELECT
            -- BLOCKED
            *
        FROM
            AVA
            LEFT JOIN BLOCKED_USERS ON SENDER_ID = BLOCKED_USERS.BLOCKER
            LEFT JOIN USERS ON USERS.U_ID = BLOCKED
        WHERE
            A_ID = 8
            AND USER_NAME = "BBbB"
    )
    AND SENDER_ID IN (
        SELECT
            DISTINCT SENDER_ID
        FROM
            AVA
            LEFT JOIN BLOCKED_USERS ON SENDER_ID = BLOCKED_USERS.BLOCKER
            LEFT JOIN USERS ON USERS.U_ID = BLOCKED
        WHERE
            COMMENT_TO_AVA_ID = 8
        EXCEPT
        SELECT
            SENDER_ID
        FROM
            AVA
            LEFT JOIN BLOCKED_USERS ON SENDER_ID = BLOCKED_USERS.BLOCKER
            LEFT JOIN USERS ON USERS.U_ID = BLOCKED
        WHERE
            COMMENT_TO_AVA_ID = 8
            AND USER_NAME = "BBbB"
    );