
INSERT INTO
    AVA (SENDER_ID, CONTEXT)
SELECT
    U_ID,
    (%(context)s)
FROM
    USERS
WHERE
    USER_NAME = %(user_name)s;

SELECT
    MAX(A_ID)
FROM
    AVA;







