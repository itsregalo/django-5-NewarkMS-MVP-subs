--
-- Create model Patient
--
CREATE TABLE `patient` (`id` uuid NOT NULL PRIMARY KEY, `first_name` varchar(255) NOT NULL, `last_name` varchar(255) NOT NULL, `date_of_birth` date NOT NULL, `gender` varchar(10) NOT NULL, `admission_date` date NOT NULL, `discharge_date` date NULL, `status` varchar(20) NOT NULL, `timestamp` datetime(6) NOT NULL, `updated` datetime(6) NOT NULL, `bed_id` uuid NULL, `nurse_assigned_id` uuid NULL, `room_id` uuid NULL);
ALTER TABLE `patient` ADD CONSTRAINT `patient_bed_id_a6306cc8_fk_bed_id` FOREIGN KEY (`bed_id`) REFERENCES `bed` (`id`);
ALTER TABLE `patient` ADD CONSTRAINT `patient_nurse_assigned_id_93feab23_fk_nurse_id` FOREIGN KEY (`nurse_assigned_id`) REFERENCES `nurse` (`id`);
ALTER TABLE `patient` ADD CONSTRAINT `patient_room_id_12501de9_fk_room_id` FOREIGN KEY (`room_id`) REFERENCES `room` (`id`);
