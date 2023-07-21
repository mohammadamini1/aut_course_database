



CREATE DATABASE PROJ2;
CREATE USER 's_user'@'localhost' IDENTIFIED BY 'password';
GRANT ALL PRIVILEGES ON PROJ2.* TO 's_user'@'localhost';

CREATE USER 'newuser'@'localhost' IDENTIFIED BY 'password';
GRANT ALL PRIVILEGES ON PROJ1.* TO 'newuser'@'localhost';


use PROJ2;



CREATE TABLE USERS (
    U_ID          BIGINT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    FIRST_NAME    VARCHAR(20) NOT NULL,
    LAST_NAME     VARCHAR(20) NOT NULL,
    USER_NAME     VARCHAR(20) NOT NULL UNIQUE,
    PASSWORD      VARCHAR(128) NOT NULL,
    BIRTH_DATE    DATE,
    REGISTER_DATE DATE,
    BIOGRAPHY     VARCHAR(64)

);

CREATE TABLE AVA (
    A_ID BIGINT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    SENDER_ID BIGINT UNSIGNED NOT NULL,
    CONTEXT VARCHAR(256) NOT NULL,
    SEND_DATE DATETIME NOT NULL DEFAULT NOW(),
    COMMENT_TO_AVA_ID BIGINT UNSIGNED DEFAULT NULL,
    FOREIGN KEY (SENDER_ID) REFERENCES USERS(U_ID) ON UPDATE CASCADE,
    FOREIGN KEY (COMMENT_TO_AVA_ID) REFERENCES AVA(A_ID) ON UPDATE CASCADE
);



CREATE TABLE AVA_LOGS (
    A_ID BIGINT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    SENDER_ID BIGINT UNSIGNED NOT NULL,
    SEND_DATE DATETIME NOT NULL DEFAULT NOW(),

    FOREIGN KEY (A_ID) REFERENCES AVA(A_ID) ON UPDATE CASCADE,
    FOREIGN KEY (SENDER_ID) REFERENCES USERS(U_ID) ON UPDATE CASCADE
);


CREATE TABLE SPECS (
    S_ID BIGINT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    S_TEXT VARCHAR(6) NOT NULL UNIQUE,
    CHECK (
        S_TEXT REGEXP '^[#][a-zA-Z][a-zA-Z][a-zA-Z][a-zA-Z][a-zA-Z]$'
    )
);


CREATE TABLE LOGINS (
    USER_NAME VARCHAR(20) NOT NULL,
    LOGIN_DATE DATETIME DEFAULT NOW(),
    FOREIGN KEY (USER_NAME) REFERENCES USERS(USER_NAME) ON UPDATE CASCADE
);

CREATE TABLE MSG (
    M_ID BIGINT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    SENDER_ID BIGINT UNSIGNED NOT NULL,
    RECEIVER_ID BIGINT UNSIGNED NOT NULL,
    CONTEXT VARCHAR(256) DEFAULT NULL,
    AVA_ID BIGINT UNSIGNED DEFAULT NULL,
    MSG_DATE DATETIME DEFAULT NOW(),
    FOREIGN KEY (AVA_ID) REFERENCES AVA(A_ID), -- ON UPDATE CASCADE,
    FOREIGN KEY (SENDER_ID) REFERENCES USERS(U_ID) ON UPDATE CASCADE,
    FOREIGN KEY (RECEIVER_ID) REFERENCES USERS(U_ID) ON UPDATE CASCADE,
    CHECK (
        CONTEXT IS NOT NULL
        OR AVA_ID IS NOT NULL
    )
);


CREATE TABLE LIKES (
    USER_ID     BIGINT UNSIGNED NOT NULL,
    AVA_ID      BIGINT UNSIGNED NOT NULL,
    PRIMARY KEY (USER_ID, AVA_ID),
    FOREIGN KEY (USER_ID) REFERENCES USERS(U_ID) ON UPDATE CASCADE,
    FOREIGN KEY (AVA_ID) REFERENCES AVA(A_ID) ON UPDATE CASCADE
);

CREATE TABLE FOLLOWS (
    FOLLOWER BIGINT UNSIGNED NOT NULL,
    FOLLOWED BIGINT UNSIGNED NOT NULL,
    PRIMARY KEY (FOLLOWER, FOLLOWED),
    FOREIGN KEY (FOLLOWER) REFERENCES USERS(U_ID) ON UPDATE CASCADE,
    FOREIGN KEY (FOLLOWED) REFERENCES USERS(U_ID) ON UPDATE CASCADE
);


CREATE TABLE BLOCKED_USERS (
    BLOCKER BIGINT UNSIGNED NOT NULL,
    BLOCKED BIGINT UNSIGNED NOT NULL,
    PRIMARY KEY (BLOCKER, BLOCKED),
    FOREIGN KEY (BLOCKER) REFERENCES USERS(U_ID) ON UPDATE CASCADE,
    FOREIGN KEY (BLOCKED) REFERENCES USERS(U_ID) ON UPDATE CASCADE
);  




CREATE TABLE AVA_SPECS (
    AVA_ID  BIGINT UNSIGNED NOT NULL,
    SPEC_ID BIGINT UNSIGNED NOT NULL,
    PRIMARY KEY  (AVA_ID, SPEC_ID),
    FOREIGN KEY  (AVA_ID) REFERENCES AVA(A_ID) ON UPDATE CASCADE,
    FOREIGN KEY  (SPEC_ID) REFERENCES SPECS(S_ID) ON UPDATE CASCADE

);










































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
delimiter //
drop  procedure if exists p_ava;

create procedure p_ava (
    IN context VARCHAR(256),
    IN username VARCHAR(20),
    OUT p_out BIGINT)
BEGIN

INSERT INTO
    AVA (SENDER_ID, CONTEXT)
SELECT
    U_ID,
    (context)
FROM
    USERS
WHERE
    USER_NAME = username;

SELECT
    MAX(A_ID)
FROM
    AVA;

end; //
delimiter ;
delimiter //
drop  procedure if exists p_block;

create procedure p_block (
    IN blocker_username VARCHAR(20),
    IN blocked_username VARCHAR(20))
BEGIN

INSERT IGNORE INTO
    BLOCKED_USERS (BLOCKER, BLOCKED)
SELECT
    U1.U_ID,
    U2.U_ID
FROM
    USERS AS U1
    CROSS JOIN USERS AS U2
WHERE
    U1.USER_NAME = blocker_username
    AND U2.USER_NAME = blocked_username;

end; //
delimiter ;
delimiter //
drop  procedure if exists p_comment;

create procedure p_comment (
    IN username VARCHAR(20),
    IN comment_context VARCHAR(256),
    IN ava_id BIGINT
)
BEGIN

INSERT INTO
    AVA (
        SENDER_ID,
        CONTEXT,
        COMMENT_TO_AVA_ID
    )
SELECT
    DISTINCT U_ID,
    (comment_context),                                                   -- context from api
    (ava_id)                                                     -- ava id from api
FROM
    USERS
WHERE
    USER_NAME = username                                        -- request from username
    AND NOT EXISTS (
        SELECT
            *
        FROM
            USERS AS U1
            CROSS JOIN AVA
            LEFT JOIN BLOCKED_USERS ON SENDER_ID = BLOCKED_USERS.BLOCKER
            LEFT JOIN USERS AS U2 ON U2.U_ID = BLOCKED
        WHERE
            U1.USER_NAME = username                             -- request from username
            AND A_ID = ava_id                                    -- ava id from api
            AND U1.U_ID = BLOCKED
    );




end; //
delimiter ;



delimiter //
drop  procedure if exists p_comments;

create procedure p_comments (
    IN username VARCHAR(20),
    IN ava_id BIGINT
)
BEGIN


SELECT
    AVA.A_ID, USERS.USER_NAME, AVA.CONTEXT, AVA.SEND_DATE
FROM
    AVA
    INNER JOIN USERS ON USERS.U_ID = AVA.SENDER_ID
WHERE
    COMMENT_TO_AVA_ID = ava_id                                        -- ava id
    AND NOT EXISTS (
        SELECT
            -- BLOCKED
            *
        FROM
            AVA
            LEFT JOIN BLOCKED_USERS ON SENDER_ID = BLOCKED_USERS.BLOCKER
            LEFT JOIN USERS ON USERS.U_ID = BLOCKED
        WHERE
            A_ID = ava_id                                           -- ava id
            AND USER_NAME = username                                -- request from username
    )
    AND SENDER_ID IN (
        SELECT
            DISTINCT SENDER_ID
        FROM
            AVA
            LEFT JOIN BLOCKED_USERS ON SENDER_ID = BLOCKED_USERS.BLOCKER
            LEFT JOIN USERS ON USERS.U_ID = BLOCKED
        WHERE
            COMMENT_TO_AVA_ID = ava_id                              -- ava id
        EXCEPT
        SELECT
            SENDER_ID
        FROM
            AVA
            LEFT JOIN BLOCKED_USERS ON SENDER_ID = BLOCKED_USERS.BLOCKER
            LEFT JOIN USERS ON USERS.U_ID = BLOCKED
        WHERE
            COMMENT_TO_AVA_ID = ava_id                              -- ava id
            AND USER_NAME = username                                -- request from username
    );



end; //
delimiter ;


delimiter //
drop  procedure if exists p_create;

create procedure p_create (
    IN first_name VARCHAR(20),
    IN last_name VARCHAR(20),
    IN user_name VARCHAR(20),
    IN password VARCHAR(128),
    OUT p_out DATETIME)
BEGIN
INSERT INTO
    USERS (
        FIRST_NAME,
        LAST_NAME,
        USER_NAME,
        PASSWORD,
        REGISTER_DATE
    )
VALUES
    (
        first_name,
        last_name,
        user_name,
        md5(password),
        NOW()
    );
end; //
delimiter ;
delimiter //
drop  procedure if exists p_feed;

create procedure p_feed (
    IN username VARCHAR(20),
    IN target_username VARCHAR(20)
)
BEGIN


SELECT DISTINCT
    -- A_ID, SENDER_ID, CONTEXT, SEND_DATE
    A_ID, CONTEXT, SEND_DATE
FROM
    USERS
    INNER JOIN BLOCKED_USERS ON USERS.U_ID = BLOCKED_USERS.BLOCKER
    INNER JOIN AVA ON USERS.U_ID = AVA.SENDER_ID
    INNER JOIN (
        SELECT
            U_ID,
            USER_NAME AS BLOCKED_USERNAME
        FROM
            USERS
    ) U ON BLOCKED = U.U_ID
WHERE
    USER_NAME = target_username -- TARGET
    AND COMMENT_TO_AVA_ID IS NULL
    AND NOT EXISTS (
        SELECT
            *
        FROM
            USERS
            INNER JOIN BLOCKED_USERS ON USERS.U_ID = BLOCKED_USERS.BLOCKER
            INNER JOIN AVA ON USERS.U_ID = AVA.SENDER_ID
            INNER JOIN (
                SELECT
                    U_ID,
                    USER_NAME AS BLOCKED_USERNAME
                FROM
                    USERS
            ) U ON BLOCKED = U.U_ID
        WHERE
            USER_NAME = target_username -- TARGET
            AND COMMENT_TO_AVA_ID IS NULL
            AND BLOCKED_USERNAME = username
    )



    ;

end; //
delimiter ;



delimiter //
drop  procedure if exists p_feeds;

create procedure p_feeds (
    IN username VARCHAR(20)
)
BEGIN

SELECT
    -- *
    AVA.A_ID,
    USERS.USER_NAME,
    AVA.CONTEXT,
    AVA.SEND_DATE,
    AVA.COMMENT_TO_AVA_ID
FROM
    AVA
    NATURAL JOIN (
        SELECT DISTINCT
            A_ID
        FROM
            FOLLOWS
            INNER JOIN AVA ON FOLLOWS.FOLLOWED = AVA.SENDER_ID
            INNER JOIN USERS ON FOLLOWER = USERS.U_ID
        WHERE
            USER_NAME = username                                        
        EXCEPT
        SELECT
            A_ID
        FROM
            FOLLOWS
            INNER JOIN AVA ON FOLLOWS.FOLLOWED = AVA.SENDER_ID
            INNER JOIN USERS ON FOLLOWER = USERS.U_ID
            INNER JOIN BLOCKED_USERS ON BLOCKED_USERS.BLOCKER = FOLLOWED
        WHERE
            USER_NAME = username                                        -- request from username
            AND FOLLOWER = BLOCKED
    ) A
    INNER JOIN USERS ON USERS.U_ID = AVA.SENDER_ID
    ORDER BY SEND_DATE DESC;


end; //
delimiter ;

delimiter //
drop  procedure if exists p_follow;

create procedure p_follow (
    IN follower_username VARCHAR(20),
    IN followed_username VARCHAR(20))
BEGIN

INSERT IGNORE INTO
    FOLLOWS (FOLLOWER, FOLLOWED)
SELECT
    U1.U_ID,
    U2.U_ID
FROM
    USERS AS U1
    CROSS JOIN USERS AS U2
WHERE
    U1.USER_NAME = follower_username
    AND U2.USER_NAME = followed_username;

end; //
delimiter ;
delimiter //
drop  procedure if exists p_forward;

create procedure p_forward (
    IN target_ava_id BIGINT,
    IN sender_username VARCHAR(20),
    IN receiver_username VARCHAR(20)
)
BEGIN

-- ارسال پیام (به صورت آوا)

INSERT INTO
    MSG (SENDER_ID, RECEIVER_ID, AVA_ID)
SELECT
    U1.U_ID,
    U2.U_ID,
    (target_ava_id)                                                    -- AVA ID
FROM
    USERS AS U1
    CROSS JOIN USERS AS U2
WHERE
    U1.USER_NAME = sender_username                             -- sender username
    AND U2.USER_NAME = receiver_username                       -- receiver username
    AND (U2.U_ID, U1.U_ID) NOT IN (
        SELECT
            *
        FROM
            BLOCKED_USERS
    )
    AND NOT EXISTS(
        SELECT
            *
        FROM
            AVA
            LEFT JOIN BLOCKED_USERS ON SENDER_ID = BLOCKER
        WHERE
            A_ID = (target_ava_id)                                             -- AVA ID
            AND BLOCKED = U1.U_ID
    );

end; //
delimiter ;
delimiter //
drop  procedure if exists p_likes_count;

create procedure p_likes_count (
    IN username VARCHAR(20),
    IN target_ava_id BIGINT)
BEGIN

-- دریافت تعداد پسندها

SELECT
    COUNT(*)
FROM
    (
        SELECT
            USER_ID,
            AVA_ID
        FROM
            LIKES
            INNER JOIN AVA ON AVA.A_ID = AVA_ID
            LEFT JOIN BLOCKED_USERS ON SENDER_ID = BLOCKED_USERS.BLOCKER
            LEFT JOIN (
                SELECT
                    U_ID,
                    USER_NAME
                FROM
                    USERS
            ) U ON U.U_ID = BLOCKED
        WHERE
            AVA_ID = target_ava_id                      -- COUNT LIKES FOR AVA_ID
        EXCEPT
        SELECT
            USER_ID,
            AVA_ID
        FROM
            LIKES
            INNER JOIN AVA ON AVA.A_ID = AVA_ID
            LEFT JOIN BLOCKED_USERS ON SENDER_ID = BLOCKED_USERS.BLOCKER
            LEFT JOIN (
                SELECT
                    U_ID,
                    USER_NAME
                FROM
                    USERS
            ) U ON U.U_ID = BLOCKED
        WHERE
            AVA_ID = target_ava_id                      -- COUNT LIKES FOR AVA_ID
            AND USER_NAME = username            -- REQUEST FROM USERNAME
    ) R;


end; //
delimiter ;
delimiter //
drop  procedure if exists p_like;

create procedure p_like (
    IN username VARCHAR(20),
    IN target_ava_id BIGINT)
BEGIN

-- پسندیدن آوا

INSERT
    IGNORE INTO LIKES (USER_ID, AVA_ID)
SELECT
    U_ID,
    A_ID
FROM
    AVA
    CROSS JOIN USERS
WHERE
    (target_ava_id) IN (  -- AVA ID (FROM API)
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
            USER_NAME = username        -- LIKE REQUEST FROM USERNAME
    )
    AND A_ID = target_ava_id                    -- AVA ID TO LIKE (FROM API)
    AND USER_NAME = username            -- LIKE REQUEST FROM USERNAME
;

end; //
delimiter ;
delimiter //
drop  procedure if exists p_likes;

create procedure p_likes (
    IN username VARCHAR(20),
    IN target_ava_id BIGINT)
BEGIN

-- دریافت لیست پسندیدگان

SELECT 
    USER_NAME
FROM
    (
    SELECT DISTINCT
        USER_ID
    FROM
        LIKES
        INNER JOIN AVA ON LIKES.AVA_ID = AVA.A_ID
        LEFT JOIN BLOCKED_USERS ON SENDER_ID = BLOCKED_USERS.BLOCKER
        LEFT JOIN USERS ON USERS.U_ID = BLOCKED
    WHERE
        AVA_ID = target_ava_id                                  -- ava id from api
    EXCEPT
    SELECT
        USER_ID
    FROM
        LIKES
        INNER JOIN AVA ON LIKES.AVA_ID = AVA.A_ID
        LEFT JOIN BLOCKED_USERS ON SENDER_ID = BLOCKED_USERS.BLOCKER
        LEFT JOIN USERS ON USERS.U_ID = BLOCKED
    WHERE
        AVA_ID = target_ava_id                                  -- ava id from api
        AND USER_NAME = username                       -- request from username
    EXCEPT
    SELECT
        USER_ID
    FROM
        LIKES
        LEFT JOIN BLOCKED_USERS ON USER_ID = BLOCKED_USERS.BLOCKER
        LEFT JOIN USERS ON USERS.U_ID = BLOCKED
    WHERE
        AVA_ID = target_ava_id                                 -- ava id from api
        AND USER_NAME = username                       -- request from username
    ) U
    INNER JOIN USERS ON U.USER_ID = USERS.U_ID
    ;





end; //
delimiter ;
delimiter //
drop  procedure if exists p_login;

create procedure p_login (
    IN username VARCHAR(20),
    IN userpassword VARCHAR(128)
    , OUT p_out CHAR(1)
    )
BEGIN

IF NOT EXISTS (
    SELECT
        USER_NAME
    FROM
        USERS
    WHERE
        USER_NAME = username
        AND PASSWORD = md5(userpassword)
)
THEN
    SET p_out = '1';
ELSE
    INSERT INTO
        LOGINS (USER_NAME)
    VALUES
        (username);
    SET p_out = '0';

END IF;

END //
delimiter ;
delimiter //
drop  procedure if exists p_logins;

create procedure p_logins (IN current_username VARCHAR(20), OUT p_out DATETIME)
begin
SELECT
    -- *
    LOGIN_DATE
FROM
    LOGINS
WHERE
    USER_NAME = current_username
ORDER BY
    LOGIN_DATE DESC;
end; //
delimiter ;
delimiter //
drop  procedure if exists p_message;

create procedure p_message (
    IN user_context VARCHAR(256),
    IN sender_username VARCHAR(20),
    IN receiver_username VARCHAR(20)
)
BEGIN

INSERT INTO
    MSG (SENDER_ID, RECEIVER_ID, CONTEXT)
SELECT
    U1.U_ID,
    U2.U_ID,
    (user_context)                               -- context
FROM
    USERS AS U1
    CROSS JOIN USERS AS U2
WHERE
    U1.USER_NAME = sender_username          -- sender username
    AND U2.USER_NAME = receiver_username      -- receiver username
    AND (U2.U_ID, U1.U_ID) NOT IN (
        SELECT
            *
        FROM
            BLOCKED_USERS
    );

end; //
delimiter ;
delimiter //
drop  procedure if exists p_messages;

create procedure p_messages (
    IN receiver_username VARCHAR(20),
    IN sender_username VARCHAR(20)
)
BEGIN

SELECT
    M1.M_ID,
    M1.CONTEXT,
    M1.AVA_ID,
    M1.MSG_DATE,
    A.CONTEXT
FROM
    MSG AS M1
    INNER JOIN USERS AS S ON M1.SENDER_ID = S.U_ID
    INNER JOIN USERS AS R ON M1.RECEIVER_ID = R.U_ID
    LEFT JOIN AVA AS A ON M1.AVA_ID = A.A_ID
WHERE
    (
        R.USER_NAME = receiver_username             -- receiver_username (self)
        AND S.USER_NAME = sender_username           -- sender_username   (target)
    )
    AND (
        AVA_ID IS NULL
        OR (M1.M_ID) NOT IN (
            SELECT
                DISTINCT M2.M_ID
            FROM
                MSG AS M2
                INNER JOIN AVA ON M2.AVA_ID = A_ID
                INNER JOIN BLOCKED_USERS ON AVA.SENDER_ID = BLOCKED_USERS.BLOCKER
            WHERE
                M1.RECEIVER_ID = M2.RECEIVER_ID
                AND M1.SENDER_ID = M2.SENDER_ID
                AND BLOCKED = RECEIVER_ID
        )
    );






end; //
delimiter ;
delimiter //
drop  procedure if exists p_my_ava;

create procedure p_my_ava (
    IN username VARCHAR(20))
BEGIN

SELECT
    A_ID,
    CONTEXT,
    SEND_DATE
FROM
    USERS
    INNER JOIN AVA ON USERS.U_ID = AVA.SENDER_ID
WHERE
    USER_NAME = username
    AND COMMENT_TO_AVA_ID IS NULL;

end; //
delimiter ;
delimiter //
drop  procedure if exists p_popular;

create procedure p_popular (
    IN username VARCHAR(20))
BEGIN


SELECT
    R.AVA_ID,
    USER_NAME,
    CONTEXT,
    SEND_DATE
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
            USER_NAME = username                            -- request from username
    ) R
    INNER JOIN LIKES ON R.AVA_ID = LIKES.AVA_ID
    INNER JOIN AVA ON R.AVA_ID = AVA.A_ID
    INNER JOIN USERS ON SENDER_ID = USERS.U_ID
GROUP BY
    R.AVA_ID
ORDER BY
    COUNT(*) DESC;



end; //
delimiter ;
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

delimiter //
drop  procedure if exists p_unblock;

create procedure p_unblock (
    IN blocker_username VARCHAR(20),
    IN blocked_username VARCHAR(20))
BEGIN

DELETE 
    BLOCKED_USERS
FROM
    BLOCKED_USERS
    INNER JOIN USERS AS U1 ON BLOCKER = U1.U_ID
    INNER JOIN USERS AS U2 ON BLOCKED = U2.U_ID
WHERE
    U1.USER_NAME = blocker_username
    AND U2.USER_NAME = blocked_username;


end; //
delimiter ;
delimiter //
drop  procedure if exists p_unfollow;

create procedure p_unfollow (
    IN follower_username VARCHAR(20),
    IN followed_username VARCHAR(20))
BEGIN

DELETE 
    FOLLOWS
FROM
    FOLLOWS
    INNER JOIN USERS AS U1 ON FOLLOWER = U1.U_ID
    INNER JOIN USERS AS U2 ON FOLLOWED = U2.U_ID
WHERE
    U1.USER_NAME = follower_username
    AND U2.USER_NAME = followed_username;

end; //
delimiter ;





