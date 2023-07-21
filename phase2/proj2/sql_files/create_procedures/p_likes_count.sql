delimiter //
drop  procedure if exists p_likes_count;

create procedure p_likes_count (
    IN username VARCHAR(20),
    IN target_ava_id BIGINT)
BEGIN

-- دریافت تعداد پسندها

SELECT
    COUNT(*)
FROM
    (
        SELECT
            USER_ID,
            AVA_ID
        FROM
            LIKES
            INNER JOIN AVA ON AVA.A_ID = AVA_ID
            LEFT JOIN BLOCKED_USERS ON SENDER_ID = BLOCKED_USERS.BLOCKER
            LEFT JOIN (
                SELECT
                    U_ID,
                    USER_NAME
                FROM
                    USERS
            ) U ON U.U_ID = BLOCKED
        WHERE
            AVA_ID = target_ava_id                      -- COUNT LIKES FOR AVA_ID
        EXCEPT
        SELECT
            USER_ID,
            AVA_ID
        FROM
            LIKES
            INNER JOIN AVA ON AVA.A_ID = AVA_ID
            LEFT JOIN BLOCKED_USERS ON SENDER_ID = BLOCKED_USERS.BLOCKER
            LEFT JOIN (
                SELECT
                    U_ID,
                    USER_NAME
                FROM
                    USERS
            ) U ON U.U_ID = BLOCKED
        WHERE
            AVA_ID = target_ava_id                      -- COUNT LIKES FOR AVA_ID
            AND USER_NAME = username            -- REQUEST FROM USERNAME
    ) R;


end; //
delimiter ;