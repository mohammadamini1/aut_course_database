
CREATE TABLE USERS (
    U_ID          BIGINT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    FIRST_NAME    VARCHAR(20) NOT NULL,
    LAST_NAME     VARCHAR(20) NOT NULL,
    USER_NAME     VARCHAR(20) NOT NULL UNIQUE,
    PASSWORD      VARCHAR(128) NOT NULL,
    BIRTH_DATE    DATE,
    REGISTER_DATE DATE,
    BIOGRAPHY     VARCHAR(64)

);
