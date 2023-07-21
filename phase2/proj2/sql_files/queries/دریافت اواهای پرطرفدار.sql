-- دریافت اواهای پرطرفدار

SELECT
    R.AVA_ID,
    USER_NAME,
    CONTEXT,
    SEND_DATE
FROM
    (
        SELECT DISTINCT
            AVA_ID
        FROM
            LIKES
            INNER JOIN AVA ON AVA.A_ID = AVA_ID
            LEFT JOIN BLOCKED_USERS ON SENDER_ID = BLOCKED_USERS.BLOCKER
            LEFT JOIN USERS ON USERS.U_ID = BLOCKED
        EXCEPT
        SELECT
            AVA_ID
        FROM
            LIKES
            INNER JOIN AVA ON AVA.A_ID = AVA_ID
            LEFT JOIN BLOCKED_USERS ON SENDER_ID = BLOCKED_USERS.BLOCKER
            LEFT JOIN USERS ON USERS.U_ID = BLOCKED
        WHERE
            USER_NAME = %(user_name)s                            -- request from username
    ) R
    INNER JOIN LIKES ON R.AVA_ID = LIKES.AVA_ID
    INNER JOIN AVA ON R.AVA_ID = AVA.A_ID
    INNER JOIN USERS ON SENDER_ID = USERS.U_ID
GROUP BY
    R.AVA_ID
ORDER BY
    COUNT(*) DESC;



