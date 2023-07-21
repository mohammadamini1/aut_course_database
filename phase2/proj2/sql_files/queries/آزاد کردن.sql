DELETE 
    BLOCKED_USERS
FROM
    BLOCKED_USERS
    INNER JOIN USERS AS U1 ON BLOCKER = U1.U_ID
    INNER JOIN USERS AS U2 ON BLOCKED = U2.U_ID
WHERE
    U1.USER_NAME = %(blocker_username)s
    AND U2.USER_NAME = %(blocked_username)s;

