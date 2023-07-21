-- دربافت فعالیت دنبال شوندگان
-- SELECT
--     *
-- FROM
--     AVA
--     NATURAL JOIN (
--         SELECT DISTINCT
--             A_ID
--         FROM
--             FOLLOWS
--             INNER JOIN AVA ON FOLLOWS.FOLLOWED = AVA.SENDER_ID
--             INNER JOIN USERS ON FOLLOWER = USERS.U_ID
--         WHERE
--             USER_NAME = %(user_name)s                                        
--         EXCEPT
--         SELECT
--             A_ID
--         FROM
--             FOLLOWS
--             INNER JOIN AVA ON FOLLOWS.FOLLOWED = AVA.SENDER_ID
--             INNER JOIN USERS ON FOLLOWER = USERS.U_ID
--             INNER JOIN BLOCKED_USERS ON BLOCKED_USERS.BLOCKER = FOLLOWED
--         WHERE
--             USER_NAME = %(user_name)s                                        -- request from username
--             AND FOLLOWER = BLOCKED
--     ) A
--     ORDER BY SEND_DATE DESC;

SELECT
    *
FROM
    AVA
    NATURAL JOIN (
        SELECT DISTINCT
            A_ID
        FROM
            FOLLOWS
            INNER JOIN AVA ON FOLLOWS.FOLLOWED = AVA.SENDER_ID
            INNER JOIN USERS ON FOLLOWER = USERS.U_ID
        WHERE
            USER_NAME = "BBbB"
            AND COMMENT_TO_AVA_ID IS NULL

        EXCEPT
        SELECT
            A_ID
        FROM
            FOLLOWS
            INNER JOIN AVA ON FOLLOWS.FOLLOWED = AVA.SENDER_ID
            INNER JOIN USERS ON FOLLOWER = USERS.U_ID
            INNER JOIN BLOCKED_USERS ON BLOCKED_USERS.BLOCKER = FOLLOWED
        WHERE
            USER_NAME = "BBbB"
            AND FOLLOWER = BLOCKED
            AND COMMENT_TO_AVA_ID IS NULL

    ) A
    ORDER BY SEND_DATE DESC;

