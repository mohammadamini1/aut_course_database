-- SELECT
--     *
-- FROM
--     LOGINS
-- WHERE
--     USER_NAME = %(user_name)s
-- ORDER BY
--     LOGIN_DATE DESC;

SELECT
    *
FROM
    LOGINS
WHERE
    USER_NAME = "U1_USERNAME"
ORDER BY
    LOGIN_DATE DESC;






