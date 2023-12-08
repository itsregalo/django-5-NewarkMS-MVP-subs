DROP DATABASE IF EXISTS `in_patient_management`;

CREATE DATABASE `in_patient_management`;

USE `in_patient_management`;

--

-- Create model User

--

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

-- Create model Room

--

CREATE TABLE
    `room` (
        `id` uuid NOT NULL PRIMARY KEY,
        `room_number` varchar(255) NOT NULL,
        `room_type` varchar(255) NOT NULL,
        `timestamp` datetime(6) NOT NULL,
        `updated` datetime(6) NOT NULL
    );

--

-- Create model Bed

--

CREATE TABLE
    `bed` (
        `id` uuid NOT NULL PRIMARY KEY,
        `bed_number` varchar(255) NOT NULL,
        `bed_type` varchar(255) NOT NULL,
        `timestamp` datetime(6) NOT NULL,
        `updated` datetime(6) NOT NULL,
        `room_id` uuid NOT NULL
    );

ALTER TABLE `bed`
ADD
    CONSTRAINT `bed_room_id_53cf2f7e_fk_room_id` FOREIGN KEY (`room_id`) REFERENCES `room` (`id`);

--

-- Create model Doctor

--

CREATE TABLE
    `doctor` (
        `id` uuid NOT NULL PRIMARY KEY,
        `first_name` varchar(255) NOT NULL,
        `last_name` varchar(255) NOT NULL,
        `specialization` varchar(255) NOT NULL,
        `timestamp` datetime(6) NOT NULL,
        `updated` datetime(6) NOT NULL
    );

--

-- Create model Nurse

--

CREATE TABLE
    `nurse` (
        `id` uuid NOT NULL PRIMARY KEY,
        `first_name` varchar(255) NOT NULL,
        `last_name` varchar(255) NOT NULL,
        `specialization` varchar(255) NOT NULL,
        `timestamp` datetime(6) NOT NULL,
        `updated` datetime(6) NOT NULL
    );

--

-- Create model Patient

--

CREATE TABLE
    `patient` (
        `id` uuid NOT NULL PRIMARY KEY,
        `first_name` varchar(255) NOT NULL,
        `last_name` varchar(255) NOT NULL,
        `date_of_birth` date NOT NULL,
        `gender` varchar(10) NOT NULL,
        `admission_date` date NOT NULL,
        `discharge_date` date NULL,
        `status` varchar(20) NOT NULL,
        `timestamp` datetime(6) NOT NULL,
        `updated` datetime(6) NOT NULL,
        `bed_id` uuid NULL,
        `nurse_assigned_id` uuid NULL,
        `room_id` uuid NULL
    );

ALTER TABLE `patient`
ADD
    CONSTRAINT `patient_bed_id_a6306cc8_fk_bed_id` FOREIGN KEY (`bed_id`) REFERENCES `bed` (`id`);

ALTER TABLE `patient`
ADD
    CONSTRAINT `patient_nurse_assigned_id_93feab23_fk_nurse_id` FOREIGN KEY (`nurse_assigned_id`) REFERENCES `nurse` (`id`);

ALTER TABLE `patient`
ADD
    CONSTRAINT `patient_room_id_12501de9_fk_room_id` FOREIGN KEY (`room_id`) REFERENCES `room` (`id`);

--

-- Create model Surgery

--

CREATE TABLE
    `surgery` (
        `id` uuid NOT NULL PRIMARY KEY,
        `surgery_name` varchar(255) NOT NULL,
        `surgery_date` date NOT NULL,
        `surgery_time` time(6) NOT NULL,
        `timestamp` datetime(6) NOT NULL,
        `updated` datetime(6) NOT NULL,
        `patient_id` uuid NOT NULL,
        `room_id` uuid NOT NULL,
        `surgeon_id` uuid NOT NULL
    );

--

-- Create model SurgeryBooking

--

CREATE TABLE
    `surgery_booking` (
        `id` uuid NOT NULL PRIMARY KEY,
        `timestamp` datetime(6) NOT NULL,
        `updated` datetime(6) NOT NULL,
        `patient_id` uuid NOT NULL,
        `surgery_id` uuid NOT NULL
    );

--

-- Create model SurgeryRoom

--

CREATE TABLE
    `surgery_room` (
        `id` uuid NOT NULL PRIMARY KEY,
        `is_occupied` bool NOT NULL,
        `timestamp` datetime(6) NOT NULL,
        `updated` datetime(6) NOT NULL,
        `room_id` uuid NOT NULL,
        `surgery_id` uuid NOT NULL
    );

ALTER TABLE `surgery`
ADD
    CONSTRAINT `surgery_patient_id_d0d3d2ce_fk_patient_id` FOREIGN KEY (`patient_id`) REFERENCES `patient` (`id`);

ALTER TABLE `surgery`
ADD
    CONSTRAINT `surgery_room_id_73178291_fk_room_id` FOREIGN KEY (`room_id`) REFERENCES `room` (`id`);

ALTER TABLE `surgery`
ADD
    CONSTRAINT `surgery_surgeon_id_7c6e38db_fk_doctor_id` FOREIGN KEY (`surgeon_id`) REFERENCES `doctor` (`id`);

ALTER TABLE `surgery_booking`
ADD
    CONSTRAINT `surgery_booking_patient_id_10026ab7_fk_patient_id` FOREIGN KEY (`patient_id`) REFERENCES `patient` (`id`);

ALTER TABLE `surgery_booking`
ADD
    CONSTRAINT `surgery_booking_surgery_id_0af67605_fk_surgery_id` FOREIGN KEY (`surgery_id`) REFERENCES `surgery` (`id`);

ALTER TABLE `surgery_room`
ADD
    CONSTRAINT `surgery_room_room_id_08de78ad_fk_room_id` FOREIGN KEY (`room_id`) REFERENCES `room` (`id`);

ALTER TABLE `surgery_room`
ADD
    CONSTRAINT `surgery_room_surgery_id_ac79479d_fk_surgery_id` FOREIGN KEY (`surgery_id`) REFERENCES `surgery` (`id`);