-- دریافت لیست پسندیدگان
-- SELECT DISTINCT
--     USER_ID
-- FROM
--     LIKES
--     INNER JOIN AVA ON LIKES.AVA_ID = AVA.A_ID
--     LEFT JOIN BLOCKED_USERS ON SENDER_ID = BLOCKED_USERS.BLOCKER
--     LEFT JOIN USERS ON USERS.U_ID = BLOCKED
-- WHERE
--     AVA_ID = %(ava_id) s                                  -- ava id from api
-- EXCEPT
-- SELECT
--     USER_ID
-- FROM
--     LIKES
--     INNER JOIN AVA ON LIKES.AVA_ID = AVA.A_ID
--     LEFT JOIN BLOCKED_USERS ON SENDER_ID = BLOCKED_USERS.BLOCKER
--     LEFT JOIN USERS ON USERS.U_ID = BLOCKED
-- WHERE
--     AVA_ID = %(ava_id)s                                  -- ava id from api
--     AND USER_NAME = %(user_name)s;                       -- request from username
-- EXCEPT
-- SELECT
--     USER_ID
-- FROM
--     LIKES
--     LEFT JOIN BLOCKED_USERS ON USER_ID = BLOCKED_USERS.BLOCKER
--     LEFT JOIN USERS ON USERS.U_ID = BLOCKED
-- WHERE
--     AVA_ID = %(ava_id)s                                 -- ava id from api
--     AND USER_NAME = %(user_name)s;                      -- request from username








SELECT DISTINCT
    USER_ID
FROM
    LIKES
    INNER JOIN AVA ON LIKES.AVA_ID = AVA.A_ID
    LEFT JOIN BLOCKED_USERS ON SENDER_ID = BLOCKED_USERS.BLOCKER
    LEFT JOIN USERS ON USERS.U_ID = BLOCKED
WHERE
    AVA_ID = 6                                              -- ava id from api
EXCEPT
SELECT
    USER_ID
FROM
    LIKES
    INNER JOIN AVA ON LIKES.AVA_ID = AVA.A_ID
    LEFT JOIN BLOCKED_USERS ON SENDER_ID = BLOCKED_USERS.BLOCKER
    LEFT JOIN USERS ON USERS.U_ID = BLOCKED
WHERE
    AVA_ID = 6                                               -- ava id from api
    AND USER_NAME = "BBbB"                                   -- request from username
EXCEPT
SELECT
    USER_ID
FROM
    LIKES
    LEFT JOIN BLOCKED_USERS ON USER_ID = BLOCKED_USERS.BLOCKER
    LEFT JOIN USERS ON USERS.U_ID = BLOCKED
WHERE
    AVA_ID = 6                                                -- ava id from api
    AND USER_NAME = "BBbB";                                   -- request from username


SELECT DISTINCT
    USER_ID
FROM
    LIKES
    INNER JOIN AVA ON LIKES.AVA_ID = AVA.A_ID
    LEFT JOIN BLOCKED_USERS ON SENDER_ID = BLOCKED_USERS.BLOCKER
    LEFT JOIN USERS ON USERS.U_ID = BLOCKED
WHERE
    AVA_ID = 2                                              -- ava id from api
EXCEPT
SELECT
    USER_ID
FROM
    LIKES
    INNER JOIN AVA ON LIKES.AVA_ID = AVA.A_ID
    LEFT JOIN BLOCKED_USERS ON SENDER_ID = BLOCKED_USERS.BLOCKER
    LEFT JOIN USERS ON USERS.U_ID = BLOCKED
WHERE
    AVA_ID = 2                                               -- ava id from api
    AND USER_NAME = "BBbB"                                   -- request from username
EXCEPT
SELECT
    USER_ID
FROM
    LIKES
    LEFT JOIN BLOCKED_USERS ON USER_ID = BLOCKED_USERS.BLOCKER
    LEFT JOIN USERS ON USERS.U_ID = BLOCKED
WHERE
    AVA_ID = 2                                                -- ava id from api
    AND USER_NAME = "BBbB";                                   -- request from username


SELECT DISTINCT
    USER_ID
FROM
    LIKES
    INNER JOIN AVA ON LIKES.AVA_ID = AVA.A_ID
    LEFT JOIN BLOCKED_USERS ON SENDER_ID = BLOCKED_USERS.BLOCKER
    LEFT JOIN USERS ON USERS.U_ID = BLOCKED
WHERE
    AVA_ID = 2                                              -- ava id from api
EXCEPT
SELECT
    USER_ID
FROM
    LIKES
    INNER JOIN AVA ON LIKES.AVA_ID = AVA.A_ID
    LEFT JOIN BLOCKED_USERS ON SENDER_ID = BLOCKED_USERS.BLOCKER
    LEFT JOIN USERS ON USERS.U_ID = BLOCKED
WHERE
    AVA_ID = 2                                               -- ava id from api
    AND USER_NAME = "aaAA"                                   -- request from username
EXCEPT
SELECT
    USER_ID
FROM
    LIKES
    LEFT JOIN BLOCKED_USERS ON USER_ID = BLOCKED_USERS.BLOCKER
    LEFT JOIN USERS ON USERS.U_ID = BLOCKED
WHERE
    AVA_ID = 2                                                -- ava id from api
    AND USER_NAME = "aaAA";                                   -- request from username




