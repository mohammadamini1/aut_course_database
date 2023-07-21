-- SELECT
--     M1.M_ID,
--     M1.SENDER_ID,
--     M1.CONTEXT,
--     M1.AVA_ID,
--     M1.MSG_DATE
-- FROM
--     MSG AS M1
--     INNER JOIN USERS AS R ON M1.RECEIVER_ID = R.U_ID
-- WHERE
--     R.USER_NAME = %(username)s                          -- request from username
-- ORDER BY
--     MSG_DATE DESC;

--
--
SELECT
    M1.M_ID,
    M1.SENDER_ID,
    M1.CONTEXT,
    M1.AVA_ID,
    M1.MSG_DATE
FROM
    MSG AS M1
    INNER JOIN USERS AS R ON M1.RECEIVER_ID = R.U_ID
WHERE
    R.USER_NAME = "U1_USERNAME"
ORDER BY
    MSG_DATE DESC;

--
--