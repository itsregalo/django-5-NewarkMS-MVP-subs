--
-- Create model Room
--
CREATE TABLE `room` (`id` uuid NOT NULL PRIMARY KEY, `room_number` varchar(255) NOT NULL, `room_type` varchar(255) NOT NULL, `timestamp` datetime(6) NOT NULL, `updated` datetime(6) NOT NULL);
--
-- Create model Bed
--
CREATE TABLE `bed` (`id` uuid NOT NULL PRIMARY KEY, `bed_number` varchar(255) NOT NULL, `bed_type` varchar(255) NOT NULL, `timestamp` datetime(6) NOT NULL, `updated` datetime(6) NOT NULL, `room_id` uuid NOT NULL);
ALTER TABLE `bed` ADD CONSTRAINT `bed_room_id_53cf2f7e_fk_room_id` FOREIGN KEY (`room_id`) REFERENCES `room` (`id`);
