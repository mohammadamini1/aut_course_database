delimiter //
drop  procedure if exists p_likes;

create procedure p_likes (
    IN username VARCHAR(20),
    IN target_ava_id BIGINT)
BEGIN

-- دریافت لیست پسندیدگان

SELECT 
    USER_NAME
FROM
    (
    SELECT DISTINCT
        USER_ID
    FROM
        LIKES
        INNER JOIN AVA ON LIKES.AVA_ID = AVA.A_ID
        LEFT JOIN BLOCKED_USERS ON SENDER_ID = BLOCKED_USERS.BLOCKER
        LEFT JOIN USERS ON USERS.U_ID = BLOCKED
    WHERE
        AVA_ID = target_ava_id                                  -- ava id from api
    EXCEPT
    SELECT
        USER_ID
    FROM
        LIKES
        INNER JOIN AVA ON LIKES.AVA_ID = AVA.A_ID
        LEFT JOIN BLOCKED_USERS ON SENDER_ID = BLOCKED_USERS.BLOCKER
        LEFT JOIN USERS ON USERS.U_ID = BLOCKED
    WHERE
        AVA_ID = target_ava_id                                  -- ava id from api
        AND USER_NAME = username                       -- request from username
    EXCEPT
    SELECT
        USER_ID
    FROM
        LIKES
        LEFT JOIN BLOCKED_USERS ON USER_ID = BLOCKED_USERS.BLOCKER
        LEFT JOIN USERS ON USERS.U_ID = BLOCKED
    WHERE
        AVA_ID = target_ava_id                                 -- ava id from api
        AND USER_NAME = username                       -- request from username
    ) U
    INNER JOIN USERS ON U.USER_ID = USERS.U_ID
    ;





end; //
delimiter ;