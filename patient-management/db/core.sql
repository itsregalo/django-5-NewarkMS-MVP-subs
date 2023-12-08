--
-- Create model Appointment
--
CREATE TABLE `appointment` (`id` bigint AUTO_INCREMENT NOT NULL PRIMARY KEY, `appointment_date` datetime(6) NOT NULL, `appointment_reason` longtext NOT NULL, `slug` varchar(100) NOT NULL UNIQUE, `doctor_id` bigint NOT NULL, `patient_id` bigint NOT NULL);
--
-- Create model Diagnosis
--
CREATE TABLE `diagnosis` (`id` bigint AUTO_INCREMENT NOT NULL PRIMARY KEY, `diagnosis_date` date NOT NULL, `illness_description` longtext NOT NULL, `prescription` longtext NOT NULL, `slug` varchar(100) NOT NULL UNIQUE, `doctor_id` bigint NOT NULL, `patient_id` bigint NOT NULL);
--
-- Create model Prescription
--
CREATE TABLE `prescription` (`id` bigint AUTO_INCREMENT NOT NULL PRIMARY KEY, `prescription_date` date NOT NULL, `prescription` longtext NOT NULL, `slug` varchar(100) NOT NULL UNIQUE, `doctor_id` bigint NOT NULL, `patient_id` bigint NOT NULL);
--
-- Create model Schedule
--
CREATE TABLE `schedule` (`id` bigint AUTO_INCREMENT NOT NULL PRIMARY KEY, `date` date NOT NULL, `slug` varchar(100) NOT NULL UNIQUE, `doctor_id` bigint NOT NULL);
ALTER TABLE `appointment` ADD CONSTRAINT `appointment_doctor_id_9ae603db_fk_doctor_id` FOREIGN KEY (`doctor_id`) REFERENCES `doctor` (`id`);
ALTER TABLE `appointment` ADD CONSTRAINT `appointment_patient_id_02ab18c7_fk_patient_id` FOREIGN KEY (`patient_id`) REFERENCES `patient` (`id`);
ALTER TABLE `diagnosis` ADD CONSTRAINT `diagnosis_doctor_id_f7b6fe56_fk_doctor_id` FOREIGN KEY (`doctor_id`) REFERENCES `doctor` (`id`);
ALTER TABLE `diagnosis` ADD CONSTRAINT `diagnosis_patient_id_ea94633c_fk_patient_id` FOREIGN KEY (`patient_id`) REFERENCES `patient` (`id`);
ALTER TABLE `prescription` ADD CONSTRAINT `prescription_doctor_id_663a0b8d_fk_doctor_id` FOREIGN KEY (`doctor_id`) REFERENCES `doctor` (`id`);
ALTER TABLE `prescription` ADD CONSTRAINT `prescription_patient_id_df4034fb_fk_patient_id` FOREIGN KEY (`patient_id`) REFERENCES `patient` (`id`);
ALTER TABLE `schedule` ADD CONSTRAINT `schedule_doctor_id_af109a22_fk_doctor_id` FOREIGN KEY (`doctor_id`) REFERENCES `doctor` (`id`);
