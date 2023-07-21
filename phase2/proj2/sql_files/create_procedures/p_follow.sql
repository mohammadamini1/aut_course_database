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