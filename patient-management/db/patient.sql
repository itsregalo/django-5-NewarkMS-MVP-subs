--
-- Create model Patient
--
CREATE TABLE `patient` (`id` bigint AUTO_INCREMENT NOT NULL PRIMARY KEY, `first_name` varchar(50) NOT NULL, `last_name` varchar(50) NOT NULL, `date_of_birth` date NOT NULL, `gender` varchar(10) NOT NULL, `contact_number` varchar(15) NOT NULL, `slug` varchar(100) NOT NULL UNIQUE);
