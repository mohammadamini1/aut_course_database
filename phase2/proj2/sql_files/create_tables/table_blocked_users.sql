CREATE TABLE BLOCKED_USERS (
    BLOCKER BIGINT UNSIGNED NOT NULL,
    BLOCKED BIGINT UNSIGNED NOT NULL,
    PRIMARY KEY (BLOCKER, BLOCKED),
    FOREIGN KEY (BLOCKER) REFERENCES USERS(U_ID) ON UPDATE CASCADE,
    FOREIGN KEY (BLOCKED) REFERENCES USERS(U_ID) ON UPDATE CASCADE
);  