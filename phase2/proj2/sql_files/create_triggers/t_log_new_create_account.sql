delimiter //

DROP TRIGGER IF EXISTS log_new_create_account;

CREATE TRIGGER log_new_create_account
AFTER
INSERT
    ON USERS FOR EACH ROW 

BEGIN
    INSERT INTO
        CREATE_LOGS (USER_ID, USER_NAME)
    VALUES
        (NEW.U_ID, NEW.USER_NAME);
END //
delimiter ;
