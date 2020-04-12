CREATE TABLE `User`
(
    `id`              int PRIMARY KEY auto_increment,
    `name`            varchar(255),
    `age`             int,
    `profile_picture` varchar(255),
    `gender`          varchar(255),
    `city`            varchar(255),
    `state`           varchar(255),
    `country`         varchar(255),
    `bio`             varchar(255),
    `email`           varchar(255),
    `password`        varchar(255) not null,
    `show_on_app`     boolean,
    `created_at`      datetime,
    `updated_at`      datetime
);

CREATE TABLE `UserDetails`
(
    `id`          int PRIMARY KEY,
    `name`        varchar(255),
    `acivitiy_id` int,
    `created_at`  datetime,
    `updated_at`  datetime
);

CREATE TABLE `Activity`
(
    `id`            int PRIMARY KEY,
    `activity_name` varchar(255),
    `created_at`    datetime,
    `updated_at`    datetime
);

CREATE TABLE `Available_Dates`
(
    `id`             int PRIMARY KEY,
    `available_date` date,
    `time`           datetime,
    `userid`         int,
    `created_at`     datetime,
    `updated_at`     datetime
);

CREATE TABLE `Posts`
(
    `id`          int PRIMARY KEY,
    `post`        varchar(255),
    `acivitiy_id` int,
    `userid`      int,
    `created_at`  datetime,
    `updated_at`  datetime
);

ALTER TABLE `Posts`
    ADD FOREIGN KEY (`acivitiy_id`) REFERENCES `Activity` (`id`);

ALTER TABLE `Posts`
    ADD FOREIGN KEY (`userid`) REFERENCES `User` (`id`);

ALTER TABLE `UserDetails`
    ADD FOREIGN KEY (`id`) REFERENCES `User` (`id`);

ALTER TABLE `UserDetails`
    ADD FOREIGN KEY (`acivitiy_id`) REFERENCES `Activity` (`id`);

ALTER TABLE `Available_Dates`
    ADD FOREIGN KEY (`userid`) REFERENCES `User` (`id`);
