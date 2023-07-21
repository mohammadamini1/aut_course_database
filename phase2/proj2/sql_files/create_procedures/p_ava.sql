delimiter //
drop  procedure if exists p_ava;

create procedure p_ava (
    IN context VARCHAR(256),
    IN username VARCHAR(20),
    OUT p_out BIGINT)
BEGIN

INSERT INTO
    AVA (SENDER_ID, CONTEXT)
SELECT
    U_ID,
    (context)
FROM
    USERS
WHERE
    USER_NAME = username;

SELECT
    MAX(A_ID)
FROM
    AVA;

end; //
delimiter ;