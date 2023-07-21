-- دریافت آواهای یک علامت ویژه
-- SELECT
--     DISTINCT AVA_ID
-- FROM
--     AVA_SPECS
--     INNER JOIN SPECS ON SPEC_ID = S_ID
-- WHERE
--     S_TEXT = %(spec_text)s                                   -- TARGET SPEC TEXT
-- EXCEPT
-- SELECT
--     AVA_ID
-- FROM
--     AVA_SPECS
--     INNER JOIN SPECS ON SPEC_ID = SPECS.S_ID
--     INNER JOIN AVA ON AVA_ID = AVA.A_ID
--     LEFT JOIN BLOCKED_USERS ON SENDER_ID = BLOCKED_USERS.BLOCKER
--     INNER JOIN USERS ON BLOCKED = USERS.U_ID
-- WHERE
--     S_TEXT = %(spec_text)s                                   -- TARGET SPEC TEXT
--     AND USER_NAME = %(user_name)s;                           -- REQUEST FROM USER_NAME


SELECT
    DISTINCT AVA_ID
FROM
    AVA_SPECS
    INNER JOIN SPECS ON SPEC_ID = S_ID
WHERE
    S_TEXT = "#QWERT"                                   -- TARGET SPEC TEXT
EXCEPT
SELECT
    AVA_ID
FROM
    AVA_SPECS
    INNER JOIN SPECS ON SPEC_ID = SPECS.S_ID
    INNER JOIN AVA ON AVA_ID = AVA.A_ID
    LEFT JOIN BLOCKED_USERS ON SENDER_ID = BLOCKED_USERS.BLOCKER
    INNER JOIN USERS ON BLOCKED = USERS.U_ID
WHERE
    S_TEXT = "#QWERT"                                   -- TARGET SPEC TEXT
    AND USER_NAME = "U1_USERNAME";                      -- REQUEST FROM USER_NAME




