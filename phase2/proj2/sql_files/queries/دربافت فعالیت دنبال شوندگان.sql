-- دربافت فعالیت دنبال شوندگان
SELECT
    -- *
    AVA.A_ID,
    USERS.USER_NAME,
    AVA.CONTEXT,
    AVA.SEND_DATE,
    AVA.COMMENT_TO_AVA_ID
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
            USER_NAME = %(user_name)s                                        
        EXCEPT
        SELECT
            A_ID
        FROM
            FOLLOWS
            INNER JOIN AVA ON FOLLOWS.FOLLOWED = AVA.SENDER_ID
            INNER JOIN USERS ON FOLLOWER = USERS.U_ID
            INNER JOIN BLOCKED_USERS ON BLOCKED_USERS.BLOCKER = FOLLOWED
        WHERE
            USER_NAME = %(user_name)s                                        -- request from username
            AND FOLLOWER = BLOCKED
    ) A
    INNER JOIN USERS ON USERS.U_ID = AVA.SENDER_ID
    ORDER BY SEND_DATE DESC;
