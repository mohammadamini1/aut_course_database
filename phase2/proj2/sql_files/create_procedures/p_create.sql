delimiter //
drop  procedure if exists p_create;

create procedure p_create (
    IN first_name VARCHAR(20),
    IN last_name VARCHAR(20),
    IN user_name VARCHAR(20),
    IN password VARCHAR(128),
    OUT p_out DATETIME)
BEGIN
INSERT INTO
    USERS (
        FIRST_NAME,
        LAST_NAME,
        USER_NAME,
        PASSWORD,
        REGISTER_DATE
    )
VALUES
    (
        first_name,
        last_name,
        user_name,
        md5(password),
        NOW()
    );
end; //
delimiter ;