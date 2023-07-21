
delimiter //
drop  procedure if exists p_comments;

create procedure p_comments (
    IN username VARCHAR(20),
    IN ava_id BIGINT
)
BEGIN


SELECT
    AVA.A_ID, USERS.USER_NAME, AVA.CONTEXT, AVA.SEND_DATE
FROM
    AVA
    INNER JOIN USERS ON USERS.U_ID = AVA.SENDER_ID
WHERE
    COMMENT_TO_AVA_ID = ava_id                                        -- ava id
    AND NOT EXISTS (
        SELECT
            -- BLOCKED
            *
        FROM
            AVA
            LEFT JOIN BLOCKED_USERS ON SENDER_ID = BLOCKED_USERS.BLOCKER
            LEFT JOIN USERS ON USERS.U_ID = BLOCKED
        WHERE
            A_ID = ava_id                                           -- ava id
            AND USER_NAME = username                                -- request from username
    )
    AND SENDER_ID IN (
        SELECT
            DISTINCT SENDER_ID
        FROM
            AVA
            LEFT JOIN BLOCKED_USERS ON SENDER_ID = BLOCKED_USERS.BLOCKER
            LEFT JOIN USERS ON USERS.U_ID = BLOCKED
        WHERE
            COMMENT_TO_AVA_ID = ava_id                              -- ava id
        EXCEPT
        SELECT
            SENDER_ID
        FROM
            AVA
            LEFT JOIN BLOCKED_USERS ON SENDER_ID = BLOCKED_USERS.BLOCKER
            LEFT JOIN USERS ON USERS.U_ID = BLOCKED
        WHERE
            COMMENT_TO_AVA_ID = ava_id                              -- ava id
            AND USER_NAME = username                                -- request from username
    );



end; //
delimiter ;


