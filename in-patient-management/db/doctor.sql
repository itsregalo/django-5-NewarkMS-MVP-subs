--
-- Create model Doctor
--
CREATE TABLE `doctor` (`id` uuid NOT NULL PRIMARY KEY, `first_name` varchar(255) NOT NULL, `last_name` varchar(255) NOT NULL, `specialization` varchar(255) NOT NULL, `timestamp` datetime(6) NOT NULL, `updated` datetime(6) NOT NULL);
