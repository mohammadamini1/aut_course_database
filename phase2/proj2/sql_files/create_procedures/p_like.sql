delimiter //
drop  procedure if exists p_like;

create procedure p_like (
    IN username VARCHAR(20),
    IN target_ava_id BIGINT)
BEGIN

-- پسندیدن آوا

INSERT
    IGNORE INTO LIKES (USER_ID, AVA_ID)
SELECT
    U_ID,
    A_ID
FROM
    AVA
    CROSS JOIN USERS
WHERE
    (target_ava_id) IN (  -- AVA ID (FROM API)
        SELECT DISTINCT
            A_ID
        FROM
            AVA
            LEFT JOIN BLOCKED_USERS ON AVA.SENDER_ID = BLOCKED_USERS.BLOCKER
            LEFT JOIN (
                SELECT
                    U_ID,
                    USER_NAME
                FROM
                    USERS
            ) U ON U.U_ID = BLOCKED
        EXCEPT
        SELECT
            A_ID
        FROM
            AVA
            LEFT JOIN BLOCKED_USERS ON AVA.SENDER_ID = BLOCKED_USERS.BLOCKER
            LEFT JOIN (
                SELECT
                    U_ID,
                    USER_NAME
                FROM
                    USERS
            ) U ON U.U_ID = BLOCKED
        WHERE
            USER_NAME = username        -- LIKE REQUEST FROM USERNAME
    )
    AND A_ID = target_ava_id                    -- AVA ID TO LIKE (FROM API)
    AND USER_NAME = username            -- LIKE REQUEST FROM USERNAME
;

end; //
delimiter ;