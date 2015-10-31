CREATE SCHEMA IF NOT EXISTS `LibraryDb` ;
USE `LibraryDb` ;
-- -----------------------------------------------------
-- Table `LibraryDb`.`Patrons`
-- -----------------------------------------------------

CREATE TABLE `LibraryDb`.`Patrons` (
`patron_id` VARCHAR(50) NOT NULL,
`user_id` VARCHAR(20) NOT NULL,
`password` VARCHAR(20) NOT NULL,
`first_name` VARCHAR(45) NOT NULL,
`last_name` VARCHAR(45) NOT NULL,
`nationality` VARCHAR(45),
`phone_no` CHAR(20),
`alternate_phone` CHAR(20),
`DOB` DATE,
`department` VARCHAR(45) NOT NULL,
`category` VARCHAR(50),
`sex` ENUM('Male','Female'),
PRIMARY KEY (`patron_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

-- -----------------------------------------------------
-- Table `LibraryDb`.`Students`
-- -----------------------------------------------------

CREATE TABLE `LibraryDb`.`Students` (
`student_id` VARCHAR(50) NOT NULL,
`degree` VARCHAR(50) NOT NULL,
`class` ENUM('Undergraduate','Graduate','Postgraduate') NOT NULL,
PRIMARY KEY (`student_id`),
FOREIGN KEY (`student_id`)
REFERENCES `LibraryDb`.`Patrons` (`patron_id`)
ON DELETE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

-- -----------------------------------------------------
-- Table `LibraryDb`.`Faculty`
-- -----------------------------------------------------

CREATE TABLE `LibraryDb`.`Faculty` (
`faculty_id` VARCHAR(50) NOT NULL,
FOREIGN KEY (`faculty_id`)
REFERENCES `LibraryDb`.`Patrons` (`patron_id`)
ON DELETE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

-- -----------------------------------------------------
-- Table `LibraryDb`.`Patron_Addresses`
-- -----------------------------------------------------

CREATE TABLE `LibraryDb`.`Patron_Addresses` (
`patron_id` VARCHAR(50) NOT NULL,
`address_line1` VARCHAR(100) NOT NULL,
`address_line2` VARCHAR(200),
`postal_code` INT NOT NULL,
`city` VARCHAR(30),
PRIMARY KEY (`patron_id`,`address_line1`,`postal_code`),
FOREIGN KEY (`patron_id`)
REFERENCES `LibraryDb`.`Patrons` (`patron_id`)
ON DELETE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

-- -----------------------------------------------------
-- Table `LibraryDb`.`Libraries`
-- -----------------------------------------------------

CREATE TABLE `LibraryDb`.`Libraries` (
`lib_id` SMALLINT NOT NULL,
`lib_name` VARCHAR(20) NOT NULL,
PRIMARY KEY(`lib_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

-- -----------------------------------------------------
-- Table `LibraryDb`.`Publications`
-- -----------------------------------------------------

CREATE TABLE `LibraryDb`.`Publications` (
`pub_id` VARCHAR(50) NOT NULL,
`title` VARCHAR(100) NOT NULL,
`pub_year` YEAR NOT NULL,
`category` ENUM('Book','Conference Proceeding','Journal') NOT NULL,
`e_copy` TINYINT(1),
PRIMARY KEY (`pub_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

-- -----------------------------------------------------
-- Table `LibraryDb`.`Authors`
-- -----------------------------------------------------

CREATE TABLE `LibraryDb`.`Authors` (
`author_name` VARCHAR(100) NOT NULL,
PRIMARY KEY (`author_name`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

-- -----------------------------------------------------
-- Table `LibraryDb`.`Pub_Authors`
-- -----------------------------------------------------

CREATE TABLE `LibraryDb`.`Pub_Authors` (
`pub_id` VARCHAR(50) NOT NULL,
`author_name` VARCHAR(100) NOT NULL,
PRIMARY KEY (`pub_id`,`author_name`),
FOREIGN KEY (`pub_id`)
REFERENCES `LibraryDb`.`Publications` (`pub_id`),
FOREIGN KEY (`author_name`)
REFERENCES `LibraryDb`.`Authors` (`author_name`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

-- -----------------------------------------------------
-- Table `LibraryDb`.`Books`
-- -----------------------------------------------------

CREATE TABLE `LibraryDb`.`Books` (
`ISBN` VARCHAR(50) NOT NULL,
`publisher` VARCHAR(50) NOT NULL,
`edition` VARCHAR(20) NOT NULL,
`reserved` TINYINT(1) NOT NULL,
PRIMARY KEY (`ISBN`),
FOREIGN KEY (`ISBN`)
REFERENCES `LibraryDb`.`Publications` (`pub_id`)
ON DELETE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

-- -----------------------------------------------------
-- Table `LibraryDb`.`Journals`
-- -----------------------------------------------------

CREATE TABLE `LibraryDb`.`Journals` (
`ISSN` VARCHAR(50) NOT NULL,
PRIMARY KEY (`ISSN`),
FOREIGN KEY (`ISSN`)
REFERENCES `LibraryDb`.`Publications` (`pub_id`)
ON DELETE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

-- -----------------------------------------------------
-- Table `LibraryDb`.`Conference_Proceedings`
-- -----------------------------------------------------

CREATE TABLE `LibraryDb`.`Conference_Proceedings` (
`conf_num` VARCHAR(50) NOT NULL,
`conf_name` VARCHAR(200) NOT NULL,
PRIMARY KEY (`conf_num`),
FOREIGN KEY (`conf_num`)
REFERENCES `LibraryDb`.`Publications` (`pub_id`)
ON DELETE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

-- -----------------------------------------------------
-- Table `LibraryDb`.`Library_Publications`
-- -----------------------------------------------------

CREATE TABLE `LibraryDb`.`Library_Publications` (
`pub_id` VARCHAR(50) NOT NULL,
`lib_id` SMALLINT NOT NULL,
`number_available` SMALLINT NOT NULL,
PRIMARY KEY (`pub_id`,`lib_id`),
FOREIGN KEY (`pub_id`)
REFERENCES `LibraryDb`.`Publications` (`pub_id`),
FOREIGN KEY (`lib_id`)
REFERENCES `LibraryDb`.`Libraries` (`lib_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8; 

-- -----------------------------------------------------
-- Table `LibraryDb`.`Pub_checkout`
-- -----------------------------------------------------

CREATE TABLE `LibraryDb`.`Pub_checkout` (
`patron_id` VARCHAR(50) NOT NULL,
`pub_id` VARCHAR(50) NOT NULL,
`out_date` DATE NOT NULL,
`out_time` TIME NOT NULL,
`due_date` DATE NOT NULL,
`due_time` TIME NOT NULL,
`status` VARCHAR(25) NOT NULL,
PRIMARY KEY (`patron_id`,`pub_id`),
FOREIGN KEY (`patron_id`)
REFERENCES `LibraryDb`.`Patrons` (`patron_id`),
FOREIGN KEY (`pub_id`)
REFERENCES `LibraryDb`.`Publications` (`pub_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

-- -----------------------------------------------------
-- Table `LibraryDb`.`Cameras`
-- -----------------------------------------------------

CREATE TABLE `LibraryDb`.`Cameras` (
`cam_id` VARCHAR(25) NOT NULL,
`make` VARCHAR(20) NOT NULL,
`model` VARCHAR(20) NOT NULL,
`memory_available` VARCHAR(10) NOT NULL,
`lens_config` VARCHAR(20) NOT NULL,
PRIMARY KEY (`cam_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

-- -----------------------------------------------------
-- Table `LibraryDb`.`Library_Cameras`
-- -----------------------------------------------------

CREATE TABLE `LibraryDb`.`Library_Cameras` (
`cam_id` VARCHAR(25) NOT NULL,
`lib_id` SMALLINT NOT NULL,
`status` VARCHAR(25) NOT NULL,
PRIMARY KEY (`cam_id`,`lib_id`),
FOREIGN KEY (`cam_id`)
REFERENCES `LibraryDb`.`Cameras` (`cam_id`),
FOREIGN KEY (`lib_id`)
REFERENCES `LibraryDb`.`Libraries` (`lib_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

-- -----------------------------------------------------
-- Table `LibraryDb`.`Cam_checkout`
-- -----------------------------------------------------

CREATE TABLE `LibraryDb`.`Cam_checkout` (
`patron_id` VARCHAR(50) NOT NULL,
`cam_id` VARCHAR(25) NOT NULL,
`out_date` DATE NOT NULL,
`out_time` TIME NOT NULL,
`due_date` DATE NOT NULL,
`due_time` TIME NOT NULL,
PRIMARY KEY (`patron_id`,`cam_id`),
FOREIGN KEY (`patron_id`)
REFERENCES `LibraryDb`.`Patrons` (`patron_id`),
FOREIGN KEY (`cam_id`)
REFERENCES `LibraryDb`.`Cameras` (`cam_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

-- -----------------------------------------------------
-- Table `LibraryDb`.`Library_Rooms`
-- -----------------------------------------------------

CREATE TABLE `LibraryDb`.`Library_Rooms` (
`lib_id` SMALLINT NOT NULL,
`room_no` SMALLINT NOT NULL,
`position` SMALLINT NOT NULL,
`type` ENUM('Conference','Study') NOT NULL,
`capacity` SMALLINT NOT NULL,
`status` VARCHAR(25) NOT NULL,
PRIMARY KEY (`lib_id`,`room_no`),
FOREIGN KEY (`lib_id`)
REFERENCES `LibraryDb`.`Libraries` (`lib_id`)
ON DELETE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

-- -----------------------------------------------------
-- Table `LibraryDb`.`Room_Reservations`
-- -----------------------------------------------------

CREATE TABLE `LibraryDb`.`Room_Reservations` (
`patron_id` VARCHAR(50) NOT NULL,
`lib_id` SMALLINT NOT NULL,
`room_no` SMALLINT NOT NULL,
`start_date` DATE NOT NULL,
`start_time` TIME NOT NULL,
`end_date` DATE NOT NULL,
`end_time` TIME NOT NULL,
PRIMARY KEY (`patron_id`,`lib_id`,`room_no`),
FOREIGN KEY (`patron_id`)
REFERENCES `LibraryDb`.`Patrons` (`patron_id`),
FOREIGN KEY (`lib_id`,`room_no`)
REFERENCES `LibraryDb`.`Library_Rooms` (`lib_id`,`room_no`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

-- -----------------------------------------------------
-- Table `LibraryDb`.`Courses`
-- -----------------------------------------------------

CREATE TABLE `LibraryDb`.`Courses` (
`course_id` VARCHAR(20) NOT NULL,
`book_name` VARCHAR(50) NOT NULL,
`department` VARCHAR(50),
PRIMARY KEY (`course_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

-- -----------------------------------------------------
-- Table `LibraryDb`.`Enrolled_in`
-- -----------------------------------------------------

CREATE TABLE `LibraryDb`.`Enrolled_in` (
`student_id` VARCHAR(50) NOT NULL,
`course_id` VARCHAR(20) NOT NULL,
PRIMARY KEY (`student_id`,`course_id`),
FOREIGN KEY (`student_id`)
REFERENCES `LibraryDb`.`Students` (`student_id`),
FOREIGN KEY (`course_id`)
REFERENCES `LibraryDb`.`Courses` (`course_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

-- -----------------------------------------------------
-- Table `LibraryDb`.`Teaches`
-- -----------------------------------------------------

CREATE TABLE `LibraryDb`.`Teaches` (
`faculty_id` VARCHAR(50) NOT NULL,
`course_id` VARCHAR(20) NOT NULL,
PRIMARY KEY (`faculty_id`,`course_id`),
FOREIGN KEY (`faculty_id`)
REFERENCES `LibraryDb`.`Faculty` (`faculty_id`),
FOREIGN KEY (`course_id`)
REFERENCES `LibraryDb`.`Courses` (`course_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

-- -----------------------------------------------------
-- Table `LibraryDb`.`Accounts`
-- -----------------------------------------------------

CREATE TABLE `LibraryDb`.`Accounts` (
`patron_id` VARCHAR(50) NOT NULL,
`lib_id` SMALLINT NOT NULL,
`due_balance` FLOAT(10,2) NOT NULL,
PRIMARY KEY (`patron_id`,`lib_id`),
FOREIGN KEY (`patron_id`)
REFERENCES `LibraryDb`.`Patrons` (`patron_id`),
FOREIGN KEY (`lib_id`)
REFERENCES `LibraryDb`.`Libraries` (`lib_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

