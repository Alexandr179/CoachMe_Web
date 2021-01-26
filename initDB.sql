CREATE TABLE if not exists simple_user
(
    id           INTEGER PRIMARY KEY NOT NULL,
    firstName    VARCHAR             NOT NULL,
    lastName     VARCHAR             NOT NULL,
    email        VARCHAR             NOT NULL,
    hashPassword VARCHAR             NOT NULL,
    authority    VARCHAR             NOT NULL,
    state        VARCHAR             NOT NULL,
    confirmCode  VARCHAR             NOT NULL
);
CREATE UNIQUE INDEX users_unique_email_idx ON simple_user (email);


CREATE TABLE theme
(
    id   INTEGER PRIMARY KEY NOT NULL,
    name VARCHAR             NOT NULL
);

create table if not exists persistent_logins
(
    username  varchar(64) not null,
    series    varchar(64) primary key,
    token     varchar(64) not null,
    last_used timestamp   not null
);