delimiter //
drop  procedure if exists p_forward;

create procedure p_forward (
    IN target_ava_id BIGINT,
    IN sender_username VARCHAR(20),
    IN receiver_username VARCHAR(20)
)
BEGIN

-- ارسال پیام (به صورت آوا)

INSERT INTO
    MSG (SENDER_ID, RECEIVER_ID, AVA_ID)
SELECT
    U1.U_ID,
    U2.U_ID,
    (target_ava_id)                                                    -- AVA ID
FROM
    USERS AS U1
    CROSS JOIN USERS AS U2
WHERE
    U1.USER_NAME = sender_username                             -- sender username
    AND U2.USER_NAME = receiver_username                       -- receiver username
    AND (U2.U_ID, U1.U_ID) NOT IN (
        SELECT
            *
        FROM
            BLOCKED_USERS
    )
    AND NOT EXISTS(
        SELECT
            *
        FROM
            AVA
            LEFT JOIN BLOCKED_USERS ON SENDER_ID = BLOCKER
        WHERE
            A_ID = (target_ava_id)                                             -- AVA ID
            AND BLOCKED = U1.U_ID
    );

end; //
delimiter ;