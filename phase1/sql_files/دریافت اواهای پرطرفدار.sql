-- دریافت اواهای پرطرفدار
-- SELECT
--     R.AVA_ID
-- FROM
--     (
--         SELECT DISTICT
--             AVA_ID
--         FROM
--             LIKES
--             INNER JOIN AVA ON AVA.A_ID = AVA_ID
--             LEFT JOIN BLOCKED_USERS ON SENDER_ID = BLOCKED_USERS.BLOCKER
--             LEFT JOIN USERS ON USERS.U_ID = BLOCKED
--         EXCEPT
--         SELECT
--             AVA_ID
--         FROM
--             LIKES
--             INNER JOIN AVA ON AVA.A_ID = AVA_ID
--             LEFT JOIN BLOCKED_USERS ON SENDER_ID = BLOCKED_USERS.BLOCKER
--             LEFT JOIN USERS ON USERS.U_ID = BLOCKED
--         WHERE
--             USER_NAME = %(user_name)s;                           -- request from username
--     ) R
--     INNER JOIN LIKES ON R.AVA_ID = LIKES.AVA_ID
-- GROUP BY
--     R.AVA_ID
-- ORDER BY
--     COUNT(*) DESC;





-- دریافت اواهای پرطرفدار
SELECT
    R.AVA_ID
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
            USER_NAME = "U1_USERNAME"
    ) R
    INNER JOIN LIKES ON R.AVA_ID = LIKES.AVA_ID
GROUP BY
    R.AVA_ID
ORDER BY
    COUNT(*) DESC;

-- دریافت اواهای پرطرفدار
SELECT
    R.AVA_ID
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
            USER_NAME = "aaAA"
    ) R
    INNER JOIN LIKES ON R.AVA_ID = LIKES.AVA_ID
GROUP BY
    R.AVA_ID
ORDER BY
    COUNT(*) DESC;
