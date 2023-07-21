delimiter //
drop  procedure if exists p_my_ava;

create procedure p_my_ava (
    IN username VARCHAR(20))
BEGIN

SELECT
    A_ID,
    CONTEXT,
    SEND_DATE
FROM
    USERS
    INNER JOIN AVA ON USERS.U_ID = AVA.SENDER_ID
WHERE
    USER_NAME = username
    AND COMMENT_TO_AVA_ID IS NULL;

end; //
delimiter ;