--
-- Create model Surgery
--
CREATE TABLE `surgery` (`id` uuid NOT NULL PRIMARY KEY, `surgery_name` varchar(255) NOT NULL, `surgery_date` date NOT NULL, `surgery_time` time(6) NOT NULL, `timestamp` datetime(6) NOT NULL, `updated` datetime(6) NOT NULL, `patient_id` uuid NOT NULL, `room_id` uuid NOT NULL, `surgeon_id` uuid NOT NULL);
--
-- Create model SurgeryBooking
--
CREATE TABLE `surgery_booking` (`id` uuid NOT NULL PRIMARY KEY, `timestamp` datetime(6) NOT NULL, `updated` datetime(6) NOT NULL, `patient_id` uuid NOT NULL, `surgery_id` uuid NOT NULL);
--
-- Create model SurgeryRoom
--
CREATE TABLE `surgery_room` (`id` uuid NOT NULL PRIMARY KEY, `is_occupied` bool NOT NULL, `timestamp` datetime(6) NOT NULL, `updated` datetime(6) NOT NULL, `room_id` uuid NOT NULL, `surgery_id` uuid NOT NULL);
ALTER TABLE `surgery` ADD CONSTRAINT `surgery_patient_id_d0d3d2ce_fk_patient_id` FOREIGN KEY (`patient_id`) REFERENCES `patient` (`id`);
ALTER TABLE `surgery` ADD CONSTRAINT `surgery_room_id_73178291_fk_room_id` FOREIGN KEY (`room_id`) REFERENCES `room` (`id`);
ALTER TABLE `surgery` ADD CONSTRAINT `surgery_surgeon_id_7c6e38db_fk_doctor_id` FOREIGN KEY (`surgeon_id`) REFERENCES `doctor` (`id`);
ALTER TABLE `surgery_booking` ADD CONSTRAINT `surgery_booking_patient_id_10026ab7_fk_patient_id` FOREIGN KEY (`patient_id`) REFERENCES `patient` (`id`);
ALTER TABLE `surgery_booking` ADD CONSTRAINT `surgery_booking_surgery_id_0af67605_fk_surgery_id` FOREIGN KEY (`surgery_id`) REFERENCES `surgery` (`id`);
ALTER TABLE `surgery_room` ADD CONSTRAINT `surgery_room_room_id_08de78ad_fk_room_id` FOREIGN KEY (`room_id`) REFERENCES `room` (`id`);
ALTER TABLE `surgery_room` ADD CONSTRAINT `surgery_room_surgery_id_ac79479d_fk_surgery_id` FOREIGN KEY (`surgery_id`) REFERENCES `surgery` (`id`);
