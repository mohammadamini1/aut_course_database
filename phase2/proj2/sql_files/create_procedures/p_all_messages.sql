delimiter //
drop  procedure if exists p_all_messages;

create procedure p_all_messages (
    IN username VARCHAR(20)
)
BEGIN

SELECT
    M1.M_ID,
    U.USER_NAME,
    M1.CONTEXT,
    M1.AVA_ID,
    M1.MSG_DATE,
    AVA.CONTEXT
FROM
    MSG AS M1
    INNER JOIN USERS AS R ON M1.RECEIVER_ID = R.U_ID
    LEFT JOIN AVA ON AVA.A_ID = AVA_ID
    INNER JOIN USERS AS U ON M1.SENDER_ID = U.U_ID
WHERE
    R.USER_NAME = username                          -- request from username
ORDER BY
    MSG_DATE DESC


;

end; //
delimiter ;