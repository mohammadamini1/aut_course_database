
delimiter //

DROP TRIGGER IF EXISTS log_new_ava;

CREATE TRIGGER log_new_ava
AFTER
INSERT
    ON AVA FOR EACH ROW 
BEGIN


INSERT INTO AVA_LOGS (A_ID, SENDER_ID) VALUES (NEW.A_ID, NEW.SENDER_ID);


END //
delimiter ;


