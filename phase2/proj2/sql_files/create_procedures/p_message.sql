delimiter //
drop  procedure if exists p_message;

create procedure p_message (
    IN user_context VARCHAR(256),
    IN sender_username VARCHAR(20),
    IN receiver_username VARCHAR(20)
)
BEGIN

INSERT INTO
    MSG (SENDER_ID, RECEIVER_ID, CONTEXT)
SELECT
    U1.U_ID,
    U2.U_ID,
    (user_context)                               -- context
FROM
    USERS AS U1
    CROSS JOIN USERS AS U2
WHERE
    U1.USER_NAME = sender_username          -- sender username
    AND U2.USER_NAME = receiver_username      -- receiver username
    AND (U2.U_ID, U1.U_ID) NOT IN (
        SELECT
            *
        FROM
            BLOCKED_USERS
    );

end; //
delimiter ;