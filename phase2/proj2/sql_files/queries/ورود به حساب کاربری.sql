
INSERT INTO
    LOGINS (USER_NAME)
SELECT
    USER_NAME
FROM
    USERS
WHERE
    USER_NAME = %(user_name)s
    AND PASSWORD = md5(%(password)s);


