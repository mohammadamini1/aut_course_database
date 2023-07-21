
delimiter //
drop  procedure if exists p_comment;

create procedure p_comment (
    IN username VARCHAR(20),
    IN comment_context VARCHAR(256),
    IN ava_id BIGINT
)
BEGIN

INSERT INTO
    AVA (
        SENDER_ID,
        CONTEXT,
        COMMENT_TO_AVA_ID
    )
SELECT
    DISTINCT U_ID,
    (comment_context),                                                   -- context from api
    (ava_id)                                                     -- ava id from api
FROM
    USERS
WHERE
    USER_NAME = username                                        -- request from username
    AND NOT EXISTS (
        SELECT
            *
        FROM
            USERS AS U1
            CROSS JOIN AVA
            LEFT JOIN BLOCKED_USERS ON SENDER_ID = BLOCKED_USERS.BLOCKER
            LEFT JOIN USERS AS U2 ON U2.U_ID = BLOCKED
        WHERE
            U1.USER_NAME = username                             -- request from username
            AND A_ID = ava_id                                    -- ava id from api
            AND U1.U_ID = BLOCKED
    );




end; //
delimiter ;


