

INSERT
    IGNORE INTO SPECS (S_TEXT)
VALUES
    (%(spec_text)s);

INSERT INTO
    AVA_SPECS (AVA_ID, SPEC_ID)
SELECT
    (%(ava_id)s),
    S_ID
FROM
    SPECS
    CROSS JOIN AVA
    INNER JOIN USERS ON AVA.SENDER_ID = USERS.U_ID
WHERE
    S_TEXT = %(spec_text)s
    AND AVA.A_ID = %(ava_id)s
    AND USER_NAME = %(username)s

    ;

