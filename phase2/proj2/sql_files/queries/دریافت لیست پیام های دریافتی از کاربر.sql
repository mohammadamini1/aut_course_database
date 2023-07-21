

SELECT
    M1.M_ID,
    M1.CONTEXT,
    M1.AVA_ID,
    M1.MSG_DATE,
    A.CONTEXT
FROM
    MSG AS M1
    INNER JOIN USERS AS S ON M1.SENDER_ID = S.U_ID
    INNER JOIN USERS AS R ON M1.RECEIVER_ID = R.U_ID
    LEFT JOIN AVA AS A ON M1.AVA_ID = A.A_ID
WHERE
    (
        R.USER_NAME = %(receiver_username)s             -- receiver_username (self)
        AND S.USER_NAME = %(sender_username)s           -- sender_username   (target)
    )
    AND (
        AVA_ID IS NULL
        OR (M1.M_ID) NOT IN (
            SELECT
                DISTINCT M2.M_ID
            FROM
                MSG AS M2
                INNER JOIN AVA ON M2.AVA_ID = A_ID
                INNER JOIN BLOCKED_USERS ON AVA.SENDER_ID = BLOCKED_USERS.BLOCKER
            WHERE
                M1.RECEIVER_ID = M2.RECEIVER_ID
                AND M1.SENDER_ID = M2.SENDER_ID
                AND BLOCKED = RECEIVER_ID
        )
    );



