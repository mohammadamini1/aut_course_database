delimiter //
drop  procedure if exists p_unblock;

create procedure p_unblock (
    IN blocker_username VARCHAR(20),
    IN blocked_username VARCHAR(20))
BEGIN

DELETE 
    BLOCKED_USERS
FROM
    BLOCKED_USERS
    INNER JOIN USERS AS U1 ON BLOCKER = U1.U_ID
    INNER JOIN USERS AS U2 ON BLOCKED = U2.U_ID
WHERE
    U1.USER_NAME = blocker_username
    AND U2.USER_NAME = blocked_username;


end; //
delimiter ;