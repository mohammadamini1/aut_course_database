
DROP FUNCTION SET_EXTRACT;
CREATE FUNCTION SET_EXTRACT($i INT UNSIGNED, $strlist LONGBLOB) RETURNS VARBINARY(255)
    DETERMINISTIC NO SQL
    RETURN NULLIF(SUBSTRING_INDEX(SUBSTRING_INDEX(CONCAT(0b0, ' ', $strlist, ' ', 0b0), ' ', $i+1.5*(SIGN($i+0.5)+1)-1), ' ', -SIGN($i+0.5)),0b0);


DROP FUNCTION SET_COUNT;
CREATE FUNCTION SET_COUNT($strlist LONGBLOB) RETURNS INT UNSIGNED
    DETERMINISTIC NO SQL
    RETURN 1+CHAR_LENGTH($strlist)-CHAR_LENGTH(REPLACE($strlist,' ',''));


DROP TABLE `number_set`;
CREATE TABLE `number_set` (
    `n` TINYINT(3) UNSIGNED NOT NULL PRIMARY KEY,
    UNIQUE KEY `n` (`n`) USING BTREE
) ENGINE=INNODB DEFAULT CHARSET=BINARY MAX_ROWS=256 MIN_ROWS=256;


TRUNCATE number_set;
INSERT INTO number_set (n)
    SELECT STRAIGHT_JOIN n1.n|(n2.n<<2)|(n3.n<<4)|(n4.n<<6) AS n FROM
    (SELECT 0 AS n UNION SELECT 1 UNION SELECT 2 UNION SELECT 3) n1,
    (SELECT 0 AS n UNION SELECT 1 UNION SELECT 2 UNION SELECT 3) n2,
    (SELECT 0 AS n UNION SELECT 1 UNION SELECT 2 UNION SELECT 3) n3,
    (SELECT 0 AS n UNION SELECT 1 UNION SELECT 2 UNION SELECT 3) n4;


DROP FUNCTION split_string_into_rows;
CREATE FUNCTION split_string_into_rows($split_string_into_rows LONGBLOB) RETURNS LONGBLOB
    DETERMINISTIC NO SQL
    RETURN IF($split_string_into_rows IS NULL, IFNULL(@split_string_into_rows,''), '1'|@split_string_into_rows:=$split_string_into_rows);


CREATE OR REPLACE ALGORITHM = MERGE VIEW split_string_into_rows(i,e) AS
    SELECT HIGH_PRIORITY SQL_SMALL_RESULT n1.n AS i, SET_EXTRACT(n1.n, split_string_into_rows(NULL)) AS e
    FROM number_set n1
    WHERE 1&(n1.n < SET_COUNT(split_string_into_rows(NULL)));


-- CREATE OR REPLACE VIEW split_string_into_rows(i,e) AS
--     SELECT STRAIGHT_JOIN n1.n|(n256.n<<8) AS i, SET_EXTRACT(n1.n|(n256.n<<8), split_string_into_rows(NULL)) AS e
--     FROM number_set n1, number_set n256
--     WHERE 1&(n1.n|(n256.n<<8) < SET_COUNT(split_string_into_rows(NULL)));
CREATE OR REPLACE VIEW split_string_into_rows(i,e) AS
    SELECT STRAIGHT_JOIN n1.n|(n256.n<<8)|(n65536.n<<16) AS i, SET_EXTRACT(n1.n|(n256.n<<8)|(n65536.n<<16), split_string_into_rows(NULL)) AS e
    FROM number_set n1, number_set n256, number_set n65536
    WHERE 1&(n1.n|(n256.n<<8)|(n65536.n<<16) < SET_COUNT(split_string_into_rows(NULL)));

