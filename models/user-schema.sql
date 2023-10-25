CREATE TABLE `project`.`user` (`id` INT NOT NULL AUTO_INCREMENT , `first_name` VARCHAR(45) NOT NULL , `last_name` VARCHAR(45) NOT NULL , `email` VARCHAR(45) NOT NULL , `phone` VARCHAR(45) NOT NULL , PRIMARY KEY (`id`)) ENGINE = InnoDB;



INSERT INTO `user`
(`id`, `first_name`, `email`, `phone`) VALUES
(NULL, 'Youssef', 'Sherin', 'sherry@gmail.com', '0123456789'),
(NULL, 'Abdelrahman', 'Walid', 'mansy@gmail.com', '0123456789'),
(NULL, 'Yahia', 'Eissa', 'yahiia@gmail.com', '0123456789'),
(NULL, 'Fady', 'Abdelhameed', 'fadyy@gmail.com', '0123456789'),
(NULL, 'Farid', 'Ramy', 'farid@gmail.com', '0123456789'),   
(NULL, 'Marina', 'Ishak', 'marina@gmail.com', '0123456789'),
(NULL, 'Moufid', 'Magdy', 'moufid@gmail.com', '0123456789'),
(NULL, 'Mariam', 'Sameh', 'mariam@gmail.com', '0123456789'),
(NULL, 'Marian', 'Helmy','helmy@gmail.com', '0123456789'),
(NULL, 'Sameh', 'Wahba', 'sameh@gmail.com', '0123456789'),
(NULL, 'Rozan', 'joseph', 'rozan@gmail.com', '0123456789'),
(NULL, 'Yousef', 'ehab', 'ehab@gmail.com', '0123456789'),
(NULL, 'Mariam', 'Samy', 'samy@gmail.com', '0123456789'),
(NULL, 'Anastasia', 'Nabil', 'anas@gmail.com', '0123456789'),
(NULL, 'Iriny', 'Amgad', 'iriny@gmail.com', '0123456789'),
(NULL, 'joseph', 'ayman', 'joe@gmail.com', '0123456789'),
(NULL, 'Hania', 'Hany', 'hania@gmail.com', '0123456789'),
(NULL, 'George', 'amir', 'george@gmail.com', '0123456789')





CREATE TABLE `project`.`user` (`id` INT NOT NULL AUTO_INCREMENT , `first_name` VARCHAR(45) NOT NULL , `last_name` VARCHAR(45) NOT NULL , `username` VARCHAR(45) NOT NULL , `email` VARCHAR(45) NOT NULL , `password` VARCHAR(45) NOT NULL , `phone` VARCHAR(45) NULL , PRIMARY KEY (`id`)) ENGINE = InnoDB;