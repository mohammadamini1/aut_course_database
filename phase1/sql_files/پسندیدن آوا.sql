-- پسندیدن آوا

-- INSERT
--     IGNORE INTO LIKES (USER_ID, AVA_ID)
-- SELECT
--     U_ID,
--     A_ID
-- FROM
--     AVA
--     CROSS JOIN USERS
-- WHERE
--     (%(ava_id)s) IN (  -- AVA ID (FROM API)
--         SELECT DISTINCT
--             A_ID
--         FROM
--             AVA
--             LEFT JOIN BLOCKED_USERS ON AVA.SENDER_ID = BLOCKED_USERS.BLOCKER
--             LEFT JOIN (
--                 SELECT
--                     U_ID,
--                     USER_NAME
--                 FROM
--                     USERS
--             ) U ON U.U_ID = BLOCKED
--         EXCEPT
--         SELECT
--             A_ID
--         FROM
--             AVA
--             LEFT JOIN BLOCKED_USERS ON AVA.SENDER_ID = BLOCKED_USERS.BLOCKER
--             LEFT JOIN (
--                 SELECT
--                     U_ID,
--                     USER_NAME
--                 FROM
--                     USERS
--             ) U ON U.U_ID = BLOCKED
--         WHERE
--             USER_NAME = %(user_name)s        -- LIKE REQUEST FROM USERNAME
--     )
--     AND A_ID = %(ava_id)s                    -- AVA ID TO LIKE (FROM API)
--     AND USER_NAME = %(user_name)s            -- LIKE REQUEST FROM USERNAME
-- ;


INSERT
    IGNORE INTO LIKES (USER_ID, AVA_ID)
SELECT
    U_ID,
    A_ID
FROM
    AVA
    CROSS JOIN USERS
WHERE
    (2) IN (  -- AVA ID (FROM API)
        SELECT DISTINCT
            A_ID
        FROM
            AVA
            LEFT JOIN BLOCKED_USERS ON AVA.SENDER_ID = BLOCKED_USERS.BLOCKER
            LEFT JOIN (
                SELECT
                    U_ID,
                    USER_NAME
                FROM
                    USERS
            ) U ON U.U_ID = BLOCKED
        EXCEPT
        SELECT
            A_ID
        FROM
            AVA
            LEFT JOIN BLOCKED_USERS ON AVA.SENDER_ID = BLOCKED_USERS.BLOCKER
            LEFT JOIN (
                SELECT
                    U_ID,
                    USER_NAME
                FROM
                    USERS
            ) U ON U.U_ID = BLOCKED
        WHERE
            USER_NAME = "BBbB" -- LIKE REQUEST FROM USERNAME
    )
    AND A_ID = 2 -- AVA ID (FROM API)
    AND USER_NAME = "BBbB" -- LIKE REQUEST FROM USERNAME
;



INSERT
    IGNORE INTO LIKES (USER_ID, AVA_ID)
SELECT
    U_ID,
    A_ID
FROM
    AVA
    CROSS JOIN USERS
WHERE
    (5) IN (  -- AVA ID (FROM API)
        SELECT DISTINCT
            A_ID
        FROM
            AVA
            LEFT JOIN BLOCKED_USERS ON AVA.SENDER_ID = BLOCKED_USERS.BLOCKER
            LEFT JOIN (
                SELECT
                    U_ID,
                    USER_NAME
                FROM
                    USERS
            ) U ON U.U_ID = BLOCKED
        EXCEPT
        SELECT
            A_ID
        FROM
            AVA
            LEFT JOIN BLOCKED_USERS ON AVA.SENDER_ID = BLOCKED_USERS.BLOCKER
            LEFT JOIN (
                SELECT
                    U_ID,
                    USER_NAME
                FROM
                    USERS
            ) U ON U.U_ID = BLOCKED
        WHERE
            USER_NAME = "BBbB" -- LIKE REQUEST FROM USERNAME
    )
    AND A_ID = 5 -- AVA ID (FROM API)
    AND USER_NAME = "BBbB" -- LIKE REQUEST FROM USERNAME
;




INSERT
    IGNORE INTO LIKES (USER_ID, AVA_ID)
SELECT
    U_ID,
    A_ID
FROM
    AVA
    CROSS JOIN USERS
WHERE
    (2) IN (
        SELECT DISTINCT
            A_ID
        FROM
            AVA
            LEFT JOIN BLOCKED_USERS ON AVA.SENDER_ID = BLOCKED_USERS.BLOCKER
            LEFT JOIN (
                SELECT
                    U_ID,
                    USER_NAME
                FROM
                    USERS
            ) U ON U.U_ID = BLOCKED
        EXCEPT
        SELECT
            A_ID
        FROM
            AVA
            LEFT JOIN BLOCKED_USERS ON AVA.SENDER_ID = BLOCKED_USERS.BLOCKER
            LEFT JOIN (
                SELECT
                    U_ID,
                    USER_NAME
                FROM
                    USERS
            ) U ON U.U_ID = BLOCKED
        WHERE
            USER_NAME = "aaAA" -- LIKE REQUEST FROM USERNAME
    )
    AND A_ID = 2 -- AVA ID (FROM API)
    AND USER_NAME = "aaAA" -- LIKE REQUEST FROM USERNAME
;





INSERT
    IGNORE INTO LIKES (USER_ID, AVA_ID)
SELECT
    U_ID,
    A_ID
FROM
    AVA
    CROSS JOIN USERS
WHERE
    (6) IN (
        SELECT DISTINCT
            A_ID
        FROM
            AVA
            LEFT JOIN BLOCKED_USERS ON AVA.SENDER_ID = BLOCKED_USERS.BLOCKER
            LEFT JOIN (
                SELECT
                    U_ID,
                    USER_NAME
                FROM
                    USERS
            ) U ON U.U_ID = BLOCKED
        EXCEPT
        SELECT
            A_ID
        FROM
            AVA
            LEFT JOIN BLOCKED_USERS ON AVA.SENDER_ID = BLOCKED_USERS.BLOCKER
            LEFT JOIN (
                SELECT
                    U_ID,
                    USER_NAME
                FROM
                    USERS
            ) U ON U.U_ID = BLOCKED
        WHERE
            USER_NAME = "U1_USERNAME" -- LIKE REQUEST FROM USERNAME
    )
    AND A_ID = 6 -- AVA ID (FROM API)
    AND USER_NAME = "U1_USERNAME" -- LIKE REQUEST FROM USERNAME
;




INSERT
    IGNORE INTO LIKES (USER_ID, AVA_ID)
SELECT
    U_ID,
    A_ID
FROM
    AVA
    CROSS JOIN USERS
WHERE
    (8) IN (
        SELECT DISTINCT
            A_ID
        FROM
            AVA
            LEFT JOIN BLOCKED_USERS ON AVA.SENDER_ID = BLOCKED_USERS.BLOCKER
            LEFT JOIN (
                SELECT
                    U_ID,
                    USER_NAME
                FROM
                    USERS
            ) U ON U.U_ID = BLOCKED
        EXCEPT
        SELECT
            A_ID
        FROM
            AVA
            LEFT JOIN BLOCKED_USERS ON AVA.SENDER_ID = BLOCKED_USERS.BLOCKER
            LEFT JOIN (
                SELECT
                    U_ID,
                    USER_NAME
                FROM
                    USERS
            ) U ON U.U_ID = BLOCKED
        WHERE
            USER_NAME = "U1_USERNAME" -- LIKE REQUEST FROM USERNAME
    )
    AND A_ID = 8 -- AVA ID (FROM API)
    AND USER_NAME = "U1_USERNAME" -- LIKE REQUEST FROM USERNAME
;









