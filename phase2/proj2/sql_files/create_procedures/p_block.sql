delimiter //
drop  procedure if exists p_block;

create procedure p_block (
    IN blocker_username VARCHAR(20),
    IN blocked_username VARCHAR(20))
BEGIN

INSERT IGNORE INTO
    BLOCKED_USERS (BLOCKER, BLOCKED)
SELECT
    U1.U_ID,
    U2.U_ID
FROM
    USERS AS U1
    CROSS JOIN USERS AS U2
WHERE
    U1.USER_NAME = blocker_username
    AND U2.USER_NAME = blocked_username;

end; //
delimiter ;