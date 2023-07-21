INSERT IGNORE INTO
    BLOCKED_USERS (BLOCKER, BLOCKED)
-- VALUES
--     (%(blocker)s, %(blocked)s);
SELECT
    U1.U_ID,
    U2.U_ID
FROM
    USERS AS U1
    CROSS JOIN USERS AS U2
WHERE
    U1.USER_NAME = %(blocker)s
    AND U2.USER_NAME = %(blocked)s;

