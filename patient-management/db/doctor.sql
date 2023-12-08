--
-- Create model Doctor
--
CREATE TABLE `doctor` (`id` bigint AUTO_INCREMENT NOT NULL PRIMARY KEY, `first_name` varchar(50) NOT NULL, `last_name` varchar(50) NOT NULL, `specialization` varchar(100) NOT NULL, `contact_number` varchar(15) NOT NULL, `email` varchar(50) NOT NULL, `slug` varchar(100) NOT NULL UNIQUE);
