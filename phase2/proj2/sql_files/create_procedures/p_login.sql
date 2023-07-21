delimiter //
drop  procedure if exists p_login;

create procedure p_login (
    IN username VARCHAR(20),
    IN userpassword VARCHAR(128)
    , OUT p_out CHAR(1)
    )
BEGIN

IF NOT EXISTS (
    SELECT
        USER_NAME
    FROM
        USERS
    WHERE
        USER_NAME = username
        AND PASSWORD = md5(userpassword)
)
THEN
    SET p_out = '1';
ELSE
    INSERT INTO
        LOGINS (USER_NAME)
    VALUES
        (username);
    SET p_out = '0';

END IF;

END //
delimiter ;