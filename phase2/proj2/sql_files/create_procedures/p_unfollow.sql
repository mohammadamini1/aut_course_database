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