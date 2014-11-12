#-----------------------------------
#SCHEMA CREATION
#-----------------------------------
CREATE DATABASE `jee-training2`;

USE `jee-training2`;


#-----------------------------------
#TABLE CREATION
#-----------------------------------
CREATE TABLE role (

    `role_id` INT AUTO_INCREMENT PRIMARY KEY NOT NULL,

    `description` VARCHAR(20) NOT NULL
);

CREATE  TABLE user (

  `user_id` BIGINT NOT NULL AUTO_INCREMENT ,

  `email` VARCHAR(255) NOT NULL,

  `first_name` VARCHAR(255) NOT NULL ,

  `last_name` VARCHAR(255) NULL ,

  `password` VARCHAR(255) NULL ,

  `role_id` INT NOT NULL,

  PRIMARY KEY (`user_id`),

  FOREIGN KEY (`role_id`) REFERENCES role(`role_id`)
);
-- CREATE  TABLE file (
--
--   `f_id` BIGINT NOT NULL AUTO_INCREMENT ,
--
--   `name` VARCHAR(255) NOT NULL,
--
--   `extension` VARCHAR(10) NULL ,
--
--   `size` INTEGER NULL,
--
--   `last_modif_date` DATE NULL,
--
--   `upload_date` DATE NULL,
--
--   `private` BOOLEAN NULL,
--
--   `u_id` BIGINT,
--
--   CONSTRAINT fk_owner FOREIGN KEY (u_id) REFERENCES user(id)
--
--   PRIMARY KEY (`f_id`) );

#-----------------------------------
#DEFAULT ENTRIES
#-----------------------------------
INSERT INTO role (role_id, description)
  VALUES (1, 'ROLE_USER');

INSERT INTO user (email, first_name, last_name, password, role_id)
  VALUES ('jdoe@jdoe.com', 'john', 'doe', '60c6d277a8bd81de7fdde19201bf9c58a3df08f4', 1);

INSERT INTO user (email, first_name, last_name, password, role_id)
  VALUES ('ablanchar@ablanchard.com', 'alex', 'blanchard', '60c6d277a8bd81de7fdde19201bf9c58a3df08f4', 1);

INSERT INTO user (email, first_name, last_name, password, role_id)
  VALUES ('lortola@lortola.com', 'loic', 'ortola', '60c6d277a8bd81de7fdde19201bf9c58a3df08f4', 1);

-- INSERT INTO file (name, extension, u_id) VALUES ('test', 'json', 1);

#-----------------------------------
#USER RIGHTS MANAGEMENT
#-----------------------------------
CREATE USER 'jee-training2'@'localhost' IDENTIFIED BY 'password';

GRANT ALL PRIVILEGES ON `jee-training2`.* TO 'jee-training2'@'localhost' WITH GRANT OPTION;

FLUSH PRIVILEGES;
