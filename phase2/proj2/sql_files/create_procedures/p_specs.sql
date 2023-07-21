delimiter //
drop  procedure if exists p_specs;

create procedure p_specs (
    IN username VARCHAR(20),
    IN spec_text CHAR(6)
)
BEGIN

SELECT
    AVA_ID,
    USER_NAME,
    CONTEXT,
    SEND_DATE,
    COMMENT_TO_AVA_ID
FROM
    (
        SELECT
            DISTINCT AVA_ID
        FROM
            AVA_SPECS
            INNER JOIN SPECS ON SPEC_ID = S_ID
        WHERE
            S_TEXT = spec_text                                   -- TARGET SPEC TEXT
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
            S_TEXT = spec_text                                   -- TARGET SPEC TEXT
            AND USER_NAME = username                           -- REQUEST FROM USER_NAME
    ) A
    INNER JOIN AVA ON AVA.A_ID = A.AVA_ID
    INNER JOIN USERS ON USERS.U_ID = AVA.SENDER_ID
ORDER BY
SEND_DATE DESC
    ;

end; //
delimiter ;

