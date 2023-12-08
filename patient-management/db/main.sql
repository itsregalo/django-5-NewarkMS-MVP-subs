DROP DATABASE IF EXISTS `patient_management`;

CREATE DATABASE `patient_management`;

USE `patient_management`;

CREATE TABLE
    `user` (
        `id` bigint AUTO_INCREMENT NOT NULL PRIMARY KEY,
        `password` varchar(128) NOT NULL,
        `last_login` datetime(6) NULL,
        `username` varchar(150) NOT NULL UNIQUE,
        `first_name` varchar(150) NOT NULL,
        `last_name` varchar(150) NOT NULL,
        `email` varchar(254) NOT NULL,
        `is_active` bool NOT NULL,
        `date_joined` datetime(6) NOT NULL,
        `is_patient` bool NOT NULL,
        `is_doctor` bool NOT NULL,
        `is_staff` bool NOT NULL,
        `is_superuser` bool NOT NULL
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

-- Create model Doctor

--

CREATE TABLE
    `doctor` (
        `id` bigint AUTO_INCREMENT NOT NULL PRIMARY KEY,
        `first_name` varchar(50) NOT NULL,
        `last_name` varchar(50) NOT NULL,
        `specialization` varchar(100) NOT NULL,
        `contact_number` varchar(15) NOT NULL,
        `email` varchar(50) NOT NULL,
        `slug` varchar(100) NOT NULL UNIQUE
    );

--

-- Create model Patient

--

CREATE TABLE
    `patient` (
        `id` bigint AUTO_INCREMENT NOT NULL PRIMARY KEY,
        `first_name` varchar(50) NOT NULL,
        `last_name` varchar(50) NOT NULL,
        `date_of_birth` date NOT NULL,
        `gender` varchar(10) NOT NULL,
        `contact_number` varchar(15) NOT NULL,
        `slug` varchar(100) NOT NULL UNIQUE
    );