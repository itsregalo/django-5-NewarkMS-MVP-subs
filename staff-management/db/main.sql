DROP DATABASE IF EXISTS `staff_management`;

CREATE DATABASE `staff_management`;

USE `staff_management`;

--

-- Create model User

--

CREATE TABLE
    `user` (
        `id` bigint AUTO_INCREMENT NOT NULL PRIMARY KEY,
        `password` varchar(128) NOT NULL,
        `last_login` datetime(6) NULL,
        `is_superuser` bool NOT NULL,
        `username` varchar(150) NOT NULL UNIQUE,
        `first_name` varchar(150) NOT NULL,
        `last_name` varchar(150) NOT NULL,
        `email` varchar(254) NOT NULL,
        `is_active` bool NOT NULL,
        `date_joined` datetime(6) NOT NULL,
        `is_staff` bool NOT NULL
    );

CREATE TABLE
    `user_groups` (
        `id` bigint AUTO_INCREMENT NOT NULL PRIMARY KEY,
        `user_id` bigint NOT NULL,
        `group_id` integer NOT NULL
    );

CREATE TABLE
    `user_user_permissions` (
        `id` bigint AUTO_INCREMENT NOT NULL PRIMARY KEY,
        `user_id` bigint NOT NULL,
        `permission_id` integer NOT NULL
    );

ALTER TABLE `user_groups`
ADD
    CONSTRAINT `user_groups_user_id_group_id_40beef00_uniq` UNIQUE (`user_id`, `group_id`);

ALTER TABLE `user_groups`
ADD
    CONSTRAINT `user_groups_user_id_abaea130_fk_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

ALTER TABLE `user_groups`
ADD
    CONSTRAINT `user_groups_group_id_b76f8aba_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

ALTER TABLE
    `user_user_permissions`
ADD
    CONSTRAINT `user_user_permissions_user_id_permission_id_7dc6e2e0_uniq` UNIQUE (`user_id`, `permission_id`);

ALTER TABLE
    `user_user_permissions`
ADD
    CONSTRAINT `user_user_permissions_user_id_ed4a47ea_fk_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

ALTER TABLE
    `user_user_permissions`
ADD
    CONSTRAINT `user_user_permission_permission_id_9deb68a3_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`);

--

-- Create model Shift

--

CREATE TABLE
    `shift` (
        `id` uuid NOT NULL PRIMARY KEY,
        `name` varchar(50) NOT NULL UNIQUE,
        `start_time` datetime(6) NOT NULL,
        `end_time` datetime(6) NOT NULL,
        `slug` varchar(50) NOT NULL UNIQUE
    );

--

-- Create model StaffCategory

--

CREATE TABLE
    `staff_category` (
        `id` bigint AUTO_INCREMENT NOT NULL PRIMARY KEY,
        `category` varchar(50) NOT NULL UNIQUE,
        `slug` varchar(50) NOT NULL UNIQUE
    );

--

-- Create model Staff

--

CREATE TABLE
    `staff` (
        `id` uuid NOT NULL PRIMARY KEY,
        `first_name` varchar(50) NOT NULL UNIQUE,
        `last_name` varchar(50) NOT NULL UNIQUE,
        `slug` varchar(50) NOT NULL UNIQUE,
        `email` varchar(50) NOT NULL UNIQUE,
        `phone` varchar(50) NOT NULL UNIQUE,
        `address` varchar(50) NOT NULL UNIQUE,
        `date_of_birth` date NOT NULL,
        `date_joined` date NOT NULL,
        `date_left` date NULL,
        `is_active` bool NOT NULL,
        `date_created` datetime(6) NOT NULL,
        `date_updated` datetime(6) NOT NULL,
        `category_id` bigint NOT NULL
    );

--

-- Create model StaffShift

--

CREATE TABLE
    `staff_shift` (
        `id` uuid NOT NULL PRIMARY KEY,
        `date_created` datetime(6) NOT NULL,
        `date_updated` datetime(6) NOT NULL,
        `shift_id` uuid NOT NULL,
        `staff_id` uuid NOT NULL
    );

ALTER TABLE `staff`
ADD
    CONSTRAINT `staff_category_id_de05e50f_fk_staff_category_id` FOREIGN KEY (`category_id`) REFERENCES `staff_category` (`id`);

ALTER TABLE `staff_shift`
ADD
    CONSTRAINT `staff_shift_shift_id_e877fd3f_fk_shift_id` FOREIGN KEY (`shift_id`) REFERENCES `shift` (`id`);

ALTER TABLE `staff_shift`
ADD
    CONSTRAINT `staff_shift_staff_id_814432ff_fk_staff_id` FOREIGN KEY (`staff_id`) REFERENCES `staff` (`id`);