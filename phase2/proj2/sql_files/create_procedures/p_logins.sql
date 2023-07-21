delimiter //
drop  procedure if exists p_logins;

create procedure p_logins (IN current_username VARCHAR(20), OUT p_out DATETIME)
begin
SELECT
    -- *
    LOGIN_DATE
FROM
    LOGINS
WHERE
    USER_NAME = current_username
ORDER BY
    LOGIN_DATE DESC;
end; //
delimiter ;