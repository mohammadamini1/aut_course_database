SELECT
    -- *
    LOGIN_DATE
FROM
    LOGINS
WHERE
    USER_NAME = %(user_name)s
ORDER BY
    LOGIN_DATE DESC;







