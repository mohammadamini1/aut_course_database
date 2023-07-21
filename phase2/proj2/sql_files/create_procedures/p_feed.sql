
delimiter //
drop  procedure if exists p_feed;

create procedure p_feed (
    IN username VARCHAR(20),
    IN target_username VARCHAR(20)
)
BEGIN

SELECT DISTINCT
    -- A_ID, SENDER_ID, CONTEXT, SEND_DATE
    A_ID, CONTEXT, SEND_DATE
FROM
    USERS
    INNER JOIN BLOCKED_USERS ON USERS.U_ID = BLOCKED_USERS.BLOCKER
    INNER JOIN AVA ON USERS.U_ID = AVA.SENDER_ID
    INNER JOIN (
        SELECT
            U_ID,
            USER_NAME AS BLOCKED_USERNAME
        FROM
            USERS
    ) U ON BLOCKED = U.U_ID
WHERE
    USER_NAME = target_username -- TARGET
    AND COMMENT_TO_AVA_ID IS NULL
    AND NOT EXISTS (
        SELECT
            *
        FROM
            USERS
            INNER JOIN BLOCKED_USERS ON USERS.U_ID = BLOCKED_USERS.BLOCKER
            INNER JOIN AVA ON USERS.U_ID = AVA.SENDER_ID
            INNER JOIN (
                SELECT
                    U_ID,
                    USER_NAME AS BLOCKED_USERNAME
                FROM
                    USERS
            ) U ON BLOCKED = U.U_ID
        WHERE
            USER_NAME = target_username -- TARGET
            AND COMMENT_TO_AVA_ID IS NULL
            AND BLOCKED_USERNAME = username
    )



    ;

end; //
delimiter ;


