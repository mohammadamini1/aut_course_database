SELECT
    A_ID,
    CONTEXT,
    SEND_DATE
FROM
    USERS
    INNER JOIN AVA ON USERS.U_ID = AVA.SENDER_ID
WHERE
    USER_NAME = %(user_name)s
    AND COMMENT_TO_AVA_ID IS NULL;


