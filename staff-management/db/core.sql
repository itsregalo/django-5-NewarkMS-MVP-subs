--
-- Create model Shift
--
CREATE TABLE `shift` (`id` uuid NOT NULL PRIMARY KEY, `name` varchar(50) NOT NULL UNIQUE, `start_time` datetime(6) NOT NULL, `end_time` datetime(6) NOT NULL, `slug` varchar(50) NOT NULL UNIQUE);
--
-- Create model StaffCategory
--
CREATE TABLE `staff_category` (`id` bigint AUTO_INCREMENT NOT NULL PRIMARY KEY, `category` varchar(50) NOT NULL UNIQUE, `slug` varchar(50) NOT NULL UNIQUE);
--
-- Create model Staff
--
CREATE TABLE `staff` (`id` uuid NOT NULL PRIMARY KEY, `first_name` varchar(50) NOT NULL UNIQUE, `last_name` varchar(50) NOT NULL UNIQUE, `slug` varchar(50) NOT NULL UNIQUE, `email` varchar(50) NOT NULL UNIQUE, `phone` varchar(50) NOT NULL UNIQUE, `address` varchar(50) NOT NULL UNIQUE, `date_of_birth` date NOT NULL, `date_joined` date NOT NULL, `date_left` date NULL, `is_active` bool NOT NULL, `date_created` datetime(6) NOT NULL, `date_updated` datetime(6) NOT NULL, `category_id` bigint NOT NULL);
--
-- Create model StaffShift
--
CREATE TABLE `staff_shift` (`id` uuid NOT NULL PRIMARY KEY, `date_created` datetime(6) NOT NULL, `date_updated` datetime(6) NOT NULL, `shift_id` uuid NOT NULL, `staff_id` uuid NOT NULL);
ALTER TABLE `staff` ADD CONSTRAINT `staff_category_id_de05e50f_fk_staff_category_id` FOREIGN KEY (`category_id`) REFERENCES `staff_category` (`id`);
ALTER TABLE `staff_shift` ADD CONSTRAINT `staff_shift_shift_id_e877fd3f_fk_shift_id` FOREIGN KEY (`shift_id`) REFERENCES `shift` (`id`);
ALTER TABLE `staff_shift` ADD CONSTRAINT `staff_shift_staff_id_814432ff_fk_staff_id` FOREIGN KEY (`staff_id`) REFERENCES `staff` (`id`);
