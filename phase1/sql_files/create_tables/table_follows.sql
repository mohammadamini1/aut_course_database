CREATE TABLE FOLLOWS (
    FOLLOWER BIGINT UNSIGNED NOT NULL,
    FOLLOWED BIGINT UNSIGNED NOT NULL,
    PRIMARY KEY (FOLLOWER, FOLLOWED),
    FOREIGN KEY (FOLLOWER) REFERENCES USERS(U_ID) ON UPDATE CASCADE,
    FOREIGN KEY (FOLLOWED) REFERENCES USERS(U_ID) ON UPDATE CASCADE
);