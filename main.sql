-- create database
CREATE DATABASE samad_aut;



-- create table
CREATE TABLE user(
    national_code VARCHAR(11) NOT NULL PRIMARY KEY,
    frist_name VARCHAR(30) NOT NULL,
    laST_name VARCHAR(30) NOT NULL,
    sex VARCHAR(15) NOT NULL,
    attribute VARCHAR(100) NOT NULL,
    brithdate DATE NOT NULL
);

CREATE TABLE address(
    address_id int NOT NULL AUTO_INCREMENT,
    state VARCHAR(60) NOT NULL,
    city VARCHAR(60) NOT NULL,
    street VARCHAR(60) NOT NULL,
    alley VARCHAR(60) NOT NULL,
    Plaque FLOAT NOT NULL,
    information VARCHAR(1000),
    national_code VARCHAR(11) NOT NULL,
    CONSTRAINT FK_address_national_code FOREIGN KEY (national_code) REFERENCES user(national_code),
    PRIMARY KEY(address_id)

);
CREATE TABLE email(
    id_mail  int NOT NULL AUTO_INCREMENT,
    email_address VARCHAR(50) NOT NULL,
    national_code VARCHAR(11) NOT NULL,
    CONSTRAINT FK_email_national_code FOREIGN KEY (national_code) REFERENCES user(national_code),
    PRIMARY KEY (id_mail)
);

CREATE TABLE phone(
    id_phone int NOT NULL AUTO_INCREMENT,
    phone_number VARCHAR(11) NOT NULL,
    national_code VARCHAR(11) NOT NULL,
    CONSTRAINT FK_phone_national_code FOREIGN KEY (national_code) REFERENCES user(national_code),
    PRIMARY KEY (id_phone)
);



CREATE TABLE student(
    student_number VARCHAR(9) NOT NULL PRIMARY KEY,
    entering_year YEAR NOT NULL,
    grade VARCHAR(20) NOT NULL,
    national_code VARCHAR(11) NOT NULL,
    CONSTRAINT FK_student_national_code FOREIGN KEY (national_code) REFERENCES user(national_code)
);

CREATE TABLE major(
    major_id INT NOT NULL AUTO_INCREMENT,
    major_name VARCHAR(50) NOT NULL,
    student_number VARCHAR(9) NOT NULL,
    CONSTRAINT FK_major_student_number FOREIGN KEY (student_number) REFERENCES user(student_number), 
    PRIMARY KEY(major_id)
);

CREATE TABLE professors(
    personal_code VARCHAR(15) NOT NULL PRIMARY KEY,
    major_user VARCHAR(20) NOT NULL,
    entering_year YEAR NOT NULL,
    grade_user VARCHAR(20) NOT NULL,
    department VARCHAR(100) NOT NULL,
    salary INT NOT NULL,
    national_code VARCHAR(11) NOT NULL,
    CONSTRAINT FK_professors_national_code FOREIGN KEY (national_code) REFERENCES user(national_code)
    
);


CREATE TABLE staff_personnel(
    personal_code VARCHAR(15) NOT NULL PRIMARY KEY,
    entering_year YEAR NOT NULL,
    job_title VARCHAR(100) NOT NULL,
    salary INT NOT NULL,
    national_code VARCHAR(11) NOT NULL,
    CONSTRAINT FK_staff_personnel_national_code FOREIGN KEY (national_code) REFERENCES user(national_code)
    
);

CREATE TABLE reserve(
    reserve_code INT NOT NULL AUTO_INCREMENT,
    national_code VARCHAR(11) NOT NULL,
    salon_code VARCHAR(4) NOT NULL,
    time DATE NOT NULL,
    code_food VARCHAR(4) NOT NULL,
    CONSTRAINT FK_reserve_code_food FOREIGN KEY (code_food) REFERENCES information_foods(code_food),
    CONSTRAINT FK_reserve_national_code FOREIGN KEY (national_code) REFERENCES user(national_code),
    CONSTRAINT FK_reserve_salon_code FOREIGN KEY (salon_code) REFERENCES dinning_salon(salon_code),
    PRIMARY KEY (reserve_code)
);



CREATE TABLE dinning_salon(
    salon_code VARCHAR(4) NOT NULL PRIMARY KEY,
    name VARCHAR(20) NOT NULL,
    time_open INT NOT NULL,
    time_close INT NOT NULL,
    male_reserve VARCHAR(50) NOT NULL
  
);


CREATE TABLE information_foods(
    code_food INT NOT NULL PRIMARY KEY,
    number_of_class INT NOT NULL,
    name VARCHAR(100) NOT NULL,
    price INT NOT NULL,
    name_of_male VARCHAR(100) NOT NULL,
    the_amount_of VARCHAR(2000),
    Food_day VARCHAR(50) NOT NULL
);

-- add data 

INSERT INTO user VALUES ("0905555487", "alireza", "parvaresh", "male", "student", "2001-11-11");
INSERT INTO user VALUES ("0911234487", "ali", "taghikhani", "male", "student", "2001-08-09");
INSERT INTO user VALUES ("0785689487", "fatemeh", "ragh", "female", "student", "2002-07-21");
INSERT INTO user VALUES ("0232345467", "kowsar", "soltani", "female", "student", "1999-10-26");
INSERT INTO user VALUES ("0211267127", "navid", "falah", "male", "student", "2000-11-04");
INSERT INTO user VALUES ("0929098487", "ahmad", "akbari", "male", "student", "2000-11-09");

INSERT INTO email SET email_address = 'parvvaresh@gmail.com', national_code = (SELECT national_code FROM user where last_name = "parvaresh" AND frist_name = "alireza");
INSERT INTO email SET email_address = 'realparvaresh@gmail.com', national_code = (SELECT national_code FROM user where last_name = "parvaresh" AND frist_name = "alireza");
INSERT INTO email SET email_address = 'aliparvaresh99@aut.ac.ir', national_code = (SELECT national_code FROM user where last_name = "parvaresh" AND frist_name = "alireza");
INSERT INTO email SET email_address = 'taghikhani2000@gmail.com', national_code = (SELECT national_code FROM user where last_name = "taghikhani" AND frist_name = "ali");
INSERT INTO email SET email_address = 'aliitaghikhani@gmail.com', national_code = (SELECT national_code FROM user where last_name = "taghikhani" AND frist_name = "ali");
INSERT INTO email SET email_address = 'fatiragh@gmail.com', national_code = (SELECT national_code FROM user where last_name = "ragh" AND frist_name = "fatemeh");
INSERT INTO email SET email_address = 'soltaniiiiiiii@gmail.com', national_code = (SELECT national_code FROM user where last_name = "soltani" AND frist_name = "kowsar");
INSERT INTO email SET email_address = 'kowsarsoltani@gmail.com', national_code = (SELECT national_code FROM user where last_name = "soltani" AND frist_name = "kowsar");
INSERT INTO email SET email_address = 'nfalah@gmail.com', national_code = (SELECT national_code FROM user where last_name = "falah" AND frist_name = "navid");
INSERT INTO email SET email_address = 'navidfelax@gmail.com', national_code = (SELECT national_code FROM user where last_name = "falah" AND frist_name = "navid");
INSERT INTO email SET email_address = 'akbarii@gmail.com', national_code = (SELECT national_code FROM user where last_name = "akbari" AND frist_name = "ahmad");
INSERT INTO email SET email_address = 'ah.akbari@gmail.com', national_code = (SELECT national_code FROM user where last_name = "akbari" AND frist_name = "ahmad");
INSERT INTO email SET email_address = 'akbariahmad@sut.ac.ir', national_code = (SELECT national_code FROM user where last_name = "akbari" AND frist_name = "ahmad");


INSERT INTO phone SET phone_number = '09057427310', national_code = (SELECT national_code FROM user where last_name = "parvaresh" AND frist_name = "alireza");
INSERT INTO phone SET phone_number = '05138931219', national_code = (SELECT national_code FROM user where last_name = "parvaresh" AND frist_name = "alireza");
INSERT INTO phone SET phone_number = '09122135678', national_code = (SELECT national_code FROM user where last_name = "taghikhani" AND frist_name = "ali");
INSERT INTO phone SET phone_number = '02112671272', national_code = (SELECT national_code FROM user where last_name = "taghikhani" AND frist_name = "ali");
INSERT INTO phone SET phone_number = '09354783214', national_code = (SELECT national_code FROM user where last_name = "ragh" AND frist_name = "fatemeh");
INSERT INTO phone SET phone_number = '02157987454', national_code = (SELECT national_code FROM user where last_name = "ragh" AND frist_name = "fatemeh");
INSERT INTO phone SET phone_number = '09364578987', national_code = (SELECT national_code FROM user where last_name = "soltani" AND frist_name = "kowsar");
INSERT INTO phone SET phone_number = '05138965471', national_code = (SELECT national_code FROM user where last_name = "soltani" AND frist_name = "kowsar");
INSERT INTO phone SET phone_number = '09035647832', national_code = (SELECT national_code FROM user where last_name = "falah" AND frist_name = "navid");
INSERT INTO phone SET phone_number = '02135748751', national_code = (SELECT national_code FROM user where last_name = "falah" AND frist_name = "navid");
INSERT INTO phone SET phone_number = '09115478112', national_code = (SELECT national_code FROM user where last_name = "akbari" AND frist_name = "ahmad");
INSERT INTO phone SET phone_number = '05138771219', national_code = (SELECT national_code FROM user where last_name = "akbari" AND frist_name = "ahmad");


INSERT INTO address SET state = 'khorasn razavi', city = 'mashhad', street = 'vakil abad', alley = '20', Plaque = 29.1 , information = NULL, national_code = (SELECT national_code FROM user where last_name = "parvaresh" AND frist_name = "alireza");
INSERT INTO address SET state = 'tehran', city = 'tehran', street = 'fereshteh', alley = '25', Plaque = 30.0 , information = NULL, national_code = (SELECT national_code FROM user where last_name = "taghikhani" AND frist_name = "ali");
INSERT INTO address SET state = 'markazi', city = 'arak', street = 'sayad shirazi', alley = '19', Plaque = 12.2 , information = NULL, national_code = (SELECT national_code FROM user where last_name = "ragh" AND frist_name = "fatemeh");
INSERT INTO address SET state = 'esfehan', city = 'esfehan', street = 'emam hossein', alley = '23', Plaque = 25.0, information = NULL, national_code = (SELECT national_code FROM user where last_name = "soltani" AND frist_name = "kowsar");
INSERT INTO address SET state = 'tehran', city = 'tehran', street = 'ba honar', alley = '17', Plaque = 29 , information = NULL, national_code = (SELECT national_code FROM user where last_name = "falah" AND frist_name = "navid");
INSERT INTO address SET state = 'qazvin', city = 'taleqn', street = 'tohid', alley = '25', Plaque = 29.5 , information = NULL, national_code = (SELECT national_code FROM user where last_name = "akbari" AND frist_name = "ahmad");




INSERT INTO user VALUES ("0845521545", "behzad", "najafi", "male", "teacher", "1970-01-11");
INSERT INTO user VALUES ("0789991101", "mahdi", "rostami", "male", "teacher", "1982-09-29");
INSERT INTO user VALUES ("5980877840", "mohammad", "asgaripour", "male", "teacher", "1991-07-23");
INSERT INTO user VALUES ("0545484545", "mahdi", "bejani", "female", "teacher", "1988-02-26");
INSERT INTO user VALUES ("0544545445", "nazanin", "tavana", "female", "teacher", "1990-06-25");
INSERT INTO user VALUES ("0787874545", "zeynab", "akhlaghi", "female", "teacher", "1879-03-19");

INSERT INTO email SET email_address = 'behzadnajafi@gmail.com', national_code = (SELECT national_code FROM user where last_name = "najafi" AND frist_name = "behzad");
INSERT INTO email SET email_address = 'behzadnajafi88@gmail.com', national_code = (SELECT national_code FROM user where last_name = "najafi" AND frist_name = "behzad");
INSERT INTO email SET email_address = 'rostamimahdi@gmail.com', national_code = (SELECT national_code FROM user where last_name = "rostami" AND frist_name = "mahdi");
INSERT INTO email SET email_address = 'rostami@aut.ac.ir', national_code = (SELECT national_code FROM user where last_name = "rostami" AND frist_name = "mahdi");
INSERT INTO email SET email_address = 'asgaripour@gmail.com', national_code = (SELECT national_code FROM user where last_name = "asgaripour" AND frist_name = "mohammad");
INSERT INTO email SET email_address = 'asgaripour@aut.ac.ir', national_code = (SELECT national_code FROM user where last_name = "asgaripour" AND frist_name = "mohammad");
INSERT INTO email SET email_address = 'bejani@gmail.com', national_code = (SELECT national_code FROM user where last_name = "bejani" AND frist_name = "mahdi");
INSERT INTO email SET email_address = 'bejani1@aut.ac.ir', national_code = (SELECT national_code FROM user where last_name = "bejani" AND frist_name = "mahdi");
INSERT INTO email SET email_address = 'tavana@aut.ac.ir', national_code = (SELECT national_code FROM user where last_name = "tavana" AND frist_name = "nazanin");
INSERT INTO email SET email_address = 'tavana@gmail.com', national_code = (SELECT national_code FROM user where last_name = "tavana" AND frist_name = "nazanin");
INSERT INTO email SET email_address = 'akhlaghi@gmail.com', national_code = (SELECT national_code FROM user where last_name = "akhlaghi" AND frist_name = "zeynab");

INSERT INTO phone SET phone_number = '09123254789', national_code = (SELECT national_code FROM user where last_name = "najafi" AND frist_name = "behzad");
INSERT INTO phone SET phone_number = '09122135678', national_code = (SELECT national_code FROM user where last_name = "rostami" AND frist_name = "mahdi");
INSERT INTO phone SET phone_number = '05135565412', national_code = (SELECT national_code FROM user where last_name = "rostami" AND frist_name = "mahdi");
INSERT INTO phone SET phone_number = '09334578987', national_code = (SELECT national_code FROM user where last_name = "asgaripour" AND frist_name = "mohammad");
INSERT INTO phone SET phone_number = '05138977412', national_code = (SELECT national_code FROM user where last_name = "asgaripour" AND frist_name = "mohammad");
INSERT INTO phone SET phone_number = '09368978541', national_code = (SELECT national_code FROM user where last_name = "bejani" AND frist_name = "mahdi");
INSERT INTO phone SET phone_number = '02154787541', national_code = (SELECT national_code FROM user where last_name = "bejani" AND frist_name = "mahdi");
INSERT INTO phone SET phone_number = '09057841010', national_code = (SELECT national_code FROM user where last_name = "tavana" AND frist_name = "nazanin");
INSERT INTO phone SET phone_number = '02145545421', national_code = (SELECT national_code FROM user where last_name = "tavana" AND frist_name = "nazanin");
INSERT INTO phone SET phone_number = '09054787541', national_code = (SELECT national_code FROM user where last_name = "akhlaghi" AND frist_name = "zeynab");
INSERT INTO phone SET phone_number = '09854121221', national_code = (SELECT national_code FROM user where last_name = "akhlaghi" AND frist_name = "zeynab");


INSERT INTO address SET state = 'tehran', city = 'tehran', street = 'tehran', alley = '12', Plaque = 293.1 , information = NULL, national_code = (SELECT national_code FROM user where last_name = "najafi" AND frist_name = "behzad");
INSERT INTO address SET state = 'tehran', city = 'tehran', street = 'fereshteh', alley = '14', Plaque = 340.0 , information = NULL, national_code = (SELECT national_code FROM user where last_name = "rostami" AND frist_name = "mahdi");
INSERT INTO address SET state = 'tehran', city = 'tehran', street = 'valiasr', alley = '15', Plaque = 122.2 , information = NULL, national_code = (SELECT national_code FROM user where last_name = "asgaripour" AND frist_name = "mohammad");
INSERT INTO address SET state = 'tehran', city = 'esfehan', street = 'monirieh', alley = '45', Plaque = 225.0, information = NULL, national_code = (SELECT national_code FROM user where last_name = "bejani" AND frist_name = "mahdi");
INSERT INTO address SET state = 'tehran', city = 'tehran', street = 'vanak', alley = '23', Plaque = 292 , information = NULL, national_code = (SELECT national_code FROM user where last_name = "tavana" AND frist_name = "nazanin");
INSERT INTO address SET state = 'tehran', city = 'tehran', street = 'zafranieh', alley = '12', Plaque = 28.5 , information = NULL, national_code = (SELECT national_code FROM user where last_name = "akhlaghi" AND frist_name = "zeynab");



INSERT INTO user VALUES ("0788741101", "reza", "soltani", "male", "staff personnel", "1975-05-15");
INSERT INTO user VALUES ("0924545471", "asghar", "mohammadi", "male", "staff personnel", "1972-10-29");
INSERT INTO user VALUES ("0598787410", "sajed", "rezaee", "male", "staff personnel", "1968-10-23");



INSERT INTO email SET email_address = 'soltanii@aut.ac.ir', national_code = (SELECT national_code FROM user where last_name = "soltani" AND frist_name = "reza");
INSERT INTO email SET email_address = 'mohammadi22@aut.ac.ir', national_code = (SELECT national_code FROM user where last_name = "mohammadi" AND frist_name = "asghar");
INSERT INTO email SET email_address = 'rezaeee@aut.ac.ir', national_code = (SELECT national_code FROM user where last_name = "rezaee" AND frist_name = "sajed");

INSERT INTO phone SET phone_number = '09102232322', national_code = (SELECT national_code FROM user where last_name = "soltani" AND frist_name = "reza");
INSERT INTO phone SET phone_number = '09014545452', national_code = (SELECT national_code FROM user where last_name = "mohammadi" AND frist_name = "asghar");
INSERT INTO phone SET phone_number = '02145454510', national_code = (SELECT national_code FROM user where last_name = "mohammadi" AND frist_name = "asghar");
INSERT INTO phone SET phone_number = '09398845410', national_code = (SELECT national_code FROM user where last_name = "rezaee" AND frist_name = "sajed");
INSERT INTO phone SET phone_number = '02121247401', national_code =  (SELECT national_code FROM user where last_name = "rezaee" AND frist_name = "sajed");




INSERT INTO address SET state = 'tehran', city = 'tehran', street = 'valiasr', alley = '12', Plaque = 22.1 , information = NULL, national_code = (SELECT national_code FROM user where last_name = "soltani" AND frist_name = "reza");
INSERT INTO address SET state = 'tehran', city = 'tehran', street = 'shoosh', alley = '14', Plaque = 340.0 , information = NULL, national_code = (SELECT national_code FROM user where last_name = "mohammadi" AND frist_name = "asghar");
INSERT INTO address SET state = 'tehran', city = 'tehran', street = 'enqelab', alley = '15', Plaque = 268.2 , information = NULL, national_code = (SELECT national_code FROM user where last_name = "rezaee" AND frist_name = "sajed");





INSERT INTO student SET student_number = '9912013', entering_year = '2020', grade = 'BS', national_code = (SELECT national_code FROM user where last_name = "parvaresh" AND frist_name = "alireza" AND attribute = "student");
INSERT INTO student SET student_number = '9912017', entering_year = '2022', grade = 'BS', national_code = (SELECT national_code FROM user where last_name = "taghikhani" AND frist_name = "ali" AND attribute = "student");
INSERT INTO student SET student_number = '9912019', entering_year = '2022', grade = 'BS', national_code = (SELECT national_code FROM user where last_name = "ragh" AND frist_name = "fatemeh" AND attribute = "student");
INSERT INTO student SET student_number = '9912020', entering_year = '2022', grade = 'BS', national_code = (SELECT national_code FROM user where last_name = "soltani" AND frist_name = "kowsar" AND attribute = "student");
INSERT INTO student SET student_number = '9912022', entering_year = '2022', grade = 'BS', national_code = (SELECT national_code FROM user where last_name = "falah" AND frist_name = "navid" AND attribute = "student");
INSERT INTO student SET student_number = '9912028', entering_year = '2022', grade = 'BS', national_code = (SELECT national_code FROM user where last_name = "akbari" AND frist_name = "ahmad" AND attribute = "student");

INSERT INTO major SET major_name = 'computer scince', student_number = (SELECT student.student_number FROM student WHERE (SELECT national_code FROM user where last_name = "parvaresh" AND frist_name = "alireza" AND attribute = "student") = student.national_code);
INSERT INTO major SET major_name = 'math', student_number = (SELECT student.student_number FROM student WHERE (SELECT national_code FROM user where last_name = "parvaresh" AND frist_name = "alireza" AND attribute = "student") =  student.national_code);
INSERT INTO major SET major_name = 'math', student_number = (SELECT student.student_number FROM student WHERE (SELECT national_code FROM user where last_name = "taghikhani" AND frist_name = "ali" AND attribute = "student")  = student.national_code);
INSERT INTO major SET major_name = 'computer scince', student_number = (SELECT student.student_number FROM student WHERE (SELECT national_code FROM user where last_name = "ragh" AND frist_name = "fatemeh" AND attribute = "student")  = student.national_code);
INSERT INTO major SET major_name = 'math', student_number = (SELECT student.student_number FROM student WHERE (SELECT national_code FROM user where last_name = "soltani" AND frist_name = "kowsar" AND attribute = "student")  = student.national_code);
INSERT INTO major SET major_name = 'math', student_number = (SELECT student.student_number FROM student WHERE (SELECT national_code FROM user where last_name = "falah" AND frist_name = "navid" AND attribute = "student")  = student.national_code);
INSERT INTO major SET major_name = 'math', student_number = (SELECT student.student_number FROM student WHERE (SELECT national_code FROM user where last_name = "akbari" AND frist_name = "ahmad" AND attribute = "student")  = student.national_code);


INSERT INTO professors SET personal_code = '991102311', major_user = 'computer scince', entering_year = '1999', grade_user = 'PHD', department  = 'math and computer scince', salary = 200000, national_code = (SELECT national_code FROM user where last_name = "najafi" AND frist_name = "behzad" AND attribute = "teacher");
INSERT INTO professors SET personal_code = '981212421', major_user = 'math', entering_year = '2010', grade_user = 'PHD', department  = 'math and computer scince', salary = 25000000, national_code = (SELECT national_code FROM user where last_name = "rostami" AND frist_name = "mahdi" AND attribute = "teacher");
INSERT INTO professors SET personal_code = '974554510', major_user = 'computer scince', entering_year = '2013', grade_user = 'PHD', department  = 'math and computer scince', salary = 200000, national_code = (SELECT national_code FROM user where last_name = "asgaripour" AND frist_name = "mohammad" AND attribute = "teacher");
INSERT INTO professors SET personal_code = '095565241', major_user = 'computer scince', entering_year = '2016', grade_user = 'PHD', department  = 'math and computer scince', salary = 300000, national_code = (SELECT national_code FROM user where last_name = "bejani" AND frist_name = "mahdi" AND attribute = "teacher");
INSERT INTO professors SET personal_code = '402512144', major_user = 'math', entering_year = '2012', grade_user = 'PHD', department  = 'math and computer scince', salary = 23000000, national_code = (SELECT national_code FROM user where last_name = "tavana" AND frist_name = "nazanin" AND attribute = "teacher");
INSERT INTO professors SET personal_code = '789879520', major_user = 'math', entering_year = '2010', grade_user = 'PHD', department  = 'math and computer scince', salary = 5673673, national_code = (SELECT national_code FROM user where last_name = "akhlaghi" AND frist_name = "zeynab" AND attribute = "teacher");





INSERT INTO staff_personnel SET personal_code = '857454545', entering_year = '2005', job_title = 'cleaning force', salary = 200000, national_code = (SELECT national_code FROM user where last_name = "soltani" AND frist_name = "reza" AND attribute = "staff personnel");
INSERT INTO staff_personnel SET personal_code = '366376373', entering_year = '2009', job_title = 'cleaning force', salary = 200000, national_code = (SELECT national_code FROM user where last_name = "mohammadi" AND frist_name = "asghar" AND attribute = "staff personnel");
INSERT INTO staff_personnel SET personal_code = '138376443', entering_year = '2010', job_title = 'Chef', salary = 200000, national_code = (SELECT national_code FROM user where last_name = "rezaee" AND frist_name = "sajed" AND attribute = "staff personnel");






INSERT INTO information_foods SET code_food = 12, number_of_class = 2, name = 'ghormeh sabzi', price = 40000, name_of_male = "Lunch", the_amount_of = NULL, Food_day = "Saturday";
INSERT INTO information_foods SET code_food = 13, number_of_class = 2, name = 'gheymeh', price = 30000, name_of_male = "Lunch", the_amount_of = NULL, Food_day = "Sunday";
INSERT INTO information_foods SET code_food = 14, number_of_class = 2, name = 'kabab', price = 50000, name_of_male = "Lunch", the_amount_of = "GOJE", Food_day = "Monday";
INSERT INTO information_foods SET code_food = 15, number_of_class = 2, name = 'jojeh kabab', price = 30000, name_of_male = "Lunch", the_amount_of = NULL, Food_day = "Tuesday";
INSERT INTO information_foods SET code_food = 16, number_of_class = 2, name = 'morgh', price = 30000, name_of_male = "Lunch", the_amount_of = NULL, Food_day = "Wednesday";



INSERT INTO information_foods SET code_food = 17, number_of_class = 1, name = 'ghormeh sabzi', price = 40000, name_of_male = "Lunch", the_amount_of = "coca", Food_day = "Saturday";
INSERT INTO information_foods SET code_food = 18, number_of_class = 1, name = 'gheymeh', price = 30000, name_of_male = "Lunch", the_amount_of = "coca mast", Food_day = "Sunday";
INSERT INTO information_foods SET code_food = 19, number_of_class = 1, name = 'kabab', price = 50000, name_of_male = "Lunch", the_amount_of = "GOJE coca", Food_day = "Monday";
INSERT INTO information_foods SET code_food = 20, number_of_class = 1, name = 'jojeh kabab', price = 30000, name_of_male = "Lunch", the_amount_of = "coca", Food_day = "Tuesday";
INSERT INTO information_foods SET code_food = 21, number_of_class = 1, name = 'morgh', price = 30000, name_of_male = "Lunch", the_amount_of = "coca", Food_day = "Wednesday";




INSERT INTO information_foods SET code_food = 22, number_of_class = 2, name = 'koki sabzi', price = 10000, name_of_male = "Dinner", the_amount_of = NULL, Food_day = "Saturday";
INSERT INTO information_foods SET code_food = 23, number_of_class = 2, name = 'koko sibzamini', price = 10000, name_of_male = "Dinner", the_amount_of = NULL, Food_day = "Sunday";
INSERT INTO information_foods SET code_food = 24, number_of_class = 2, name = 'adas polo', price = 20000, name_of_male = "Dinner", the_amount_of = "zeyton", Food_day = "Monday";
INSERT INTO information_foods SET code_food = 25, number_of_class = 2, name = 'jojeh kabab', price = 10000, name_of_male = "Dinner", the_amount_of = NULL, Food_day = "Tuesday";
INSERT INTO information_foods SET code_food = 26, number_of_class = 2, name = 'morgh', price = 10000, name_of_male = "Dinner", the_amount_of = NULL, Food_day = "Wednesday";



INSERT INTO information_foods SET code_food = 27, number_of_class = 1, name = 'koki sabzi', price = 20000, name_of_male = "Dinner", the_amount_of = "mast", Food_day = "Saturday";
INSERT INTO information_foods SET code_food = 28, number_of_class = 1, name = 'koko sibzamini', price = 20000, name_of_male = "Dinner", the_amount_of = "zeytoon mast", Food_day = "Sunday";
INSERT INTO information_foods SET code_food = 29, number_of_class = 1, name = 'adas polo', price = 20000, name_of_male = "Dinner", the_amount_of = "zeyton", Food_day = "Monday";
INSERT INTO information_foods SET code_food = 30, number_of_class = 1, name = 'jojeh kabab', price = 20000, name_of_male = "Dinner", the_amount_of = "torshi", Food_day = "Tuesday";
INSERT INTO information_foods SET code_food = 31, number_of_class = 1, name = 'morgh', price = 20000, name_of_male = "Dinner", the_amount_of = "torshi", Food_day = "Wednesday";


INSERT INTO information_foods SET code_food = 32, number_of_class = 1, name = 'tokhm morq', price = 10000, name_of_male = "Breakfast", the_amount_of = NULL, Food_day = "Saturday";
INSERT INTO information_foods SET code_food = 33, number_of_class = 1, name = 'adasi', price = 10000, name_of_male = "Breakfast", the_amount_of = NULL, Food_day = "Sunday";
INSERT INTO information_foods SET code_food = 34, number_of_class = 1, name = 'kare moraba', price = 20000, name_of_male = "Breakfast", the_amount_of = "anar", Food_day = "Monday";
INSERT INTO information_foods SET code_food = 35, number_of_class = 1, name = 'panir', price = 10000, name_of_male = "Breakfast", the_amount_of = NULL, Food_day = "Tuesday";
INSERT INTO information_foods SET code_food = 36, number_of_class = 1, name = 'tokhm morq', price = 10000, name_of_male = "Breakfast", the_amount_of = NULL, Food_day = "Wednesday";



INSERT INTO dinning_salon SET salon_code = "1234", name = "TORANJ", time_open = 19, time_close = 23, male_reserve = "Dinner";
INSERT INTO dinning_salon SET salon_code = "2341", name = "SHISHEE", time_open = 11, time_close = 14, male_reserve = "Lunch";
INSERT INTO dinning_salon SET salon_code = "7654", name = "MASHHIR", time_open = 09, time_close = 11, male_reserve = "Breakfast";



INSERT INTO reserve SET time =  "2022-10-03", national_code = ((SELECT national_code FROM user where last_name = "parvaresh" AND frist_name = "alireza")), salon_code = (SELECT salon_code FROM dinning_salon WHERE male_reserve = (SELECT name_of_male FROM information_foods WHERE code_food = 18)), code_food = (SELECT code_food FROM information_foods WHERE number_of_class = 1 AND name = "gheymeh" AND Food_day = "Sunday" AND name_of_male = "Lunch");
INSERT INTO reserve SET time =  "2022-10-04", national_code = ((SELECT national_code FROM user where last_name = "parvaresh" AND frist_name = "alireza")), salon_code = (SELECT salon_code FROM dinning_salon WHERE male_reserve = (SELECT name_of_male FROM information_foods WHERE code_food = 29)), code_food = (SELECT code_food FROM information_foods WHERE number_of_class = 1 AND name = "adas polo" AND Food_day = "Monday" AND name_of_male = "Dinner");
INSERT INTO reserve SET time =  "2022-10-05", national_code = ((SELECT national_code FROM user where last_name = "parvaresh" AND frist_name = "alireza")), salon_code = (SELECT salon_code FROM dinning_salon WHERE male_reserve = (SELECT name_of_male FROM information_foods WHERE code_food = 33)), code_food = (SELECT code_food FROM information_foods WHERE number_of_class = 1 AND name = "adasi" AND Food_day = "Sunday" AND name_of_male = "Breakfast");

INSERT INTO reserve SET time =  "2022-10-03", national_code = (SELECT national_code FROM user where last_name = "taghikhani" AND frist_name = "ali"), salon_code = (SELECT salon_code FROM dinning_salon WHERE male_reserve = (SELECT name_of_male FROM information_foods WHERE code_food = 18)), code_food = (SELECT code_food FROM information_foods WHERE number_of_class = 1 AND name = "gheymeh" AND Food_day = "Sunday" AND name_of_male = "Lunch");
INSERT INTO reserve SET time =  "2022-10-04", national_code = (SELECT national_code FROM user where last_name = "taghikhani" AND frist_name = "ali"), salon_code = (SELECT salon_code FROM dinning_salon WHERE male_reserve = (SELECT name_of_male FROM information_foods WHERE code_food = 30)), code_food = (SELECT code_food FROM information_foods WHERE number_of_class = 1 AND name = "jojeh kabab" AND Food_day = "Tuesday" AND name_of_male = "Dinner");
INSERT INTO reserve SET time =  "2022-10-05", national_code = (SELECT national_code FROM user where last_name = "taghikhani" AND frist_name = "ali"), salon_code = (SELECT salon_code FROM dinning_salon WHERE male_reserve = (SELECT name_of_male FROM information_foods WHERE code_food = 34)), code_food = (SELECT code_food FROM information_foods WHERE number_of_class = 1 AND name = "kare moraba" AND Food_day = "Monday" AND name_of_male = "Breakfast");

INSERT INTO reserve SET time =  "2022-10-03", national_code = (SELECT national_code FROM user where last_name = "ragh" AND frist_name = "fatemeh"), salon_code = (SELECT salon_code FROM dinning_salon WHERE male_reserve = (SELECT name_of_male FROM information_foods WHERE code_food = 13)), code_food = (SELECT code_food FROM information_foods WHERE number_of_class = 2 AND name = "gheymeh" AND Food_day = "Sunday" AND name_of_male = "Lunch");
INSERT INTO reserve SET time =  "2022-10-04", national_code = (SELECT national_code FROM user where last_name = "ragh" AND frist_name = "fatemeh"), salon_code = (SELECT salon_code FROM dinning_salon WHERE male_reserve = (SELECT name_of_male FROM information_foods WHERE code_food = 29)), code_food = (SELECT code_food FROM information_foods WHERE number_of_class = 1 AND name = "adas polo" AND Food_day = "Monday" AND name_of_male = "Dinner");
INSERT INTO reserve SET time =  "2022-10-05", national_code = (SELECT national_code FROM user where last_name = "ragh" AND frist_name = "fatemeh"), salon_code = (SELECT salon_code FROM dinning_salon WHERE male_reserve = (SELECT name_of_male FROM information_foods WHERE code_food = 34)), code_food = (SELECT code_food FROM information_foods WHERE number_of_class = 1 AND name = "kare moraba" AND Food_day = "Monday" AND name_of_male = "Breakfast");

INSERT INTO reserve SET time =  "2022-10-03", national_code = (SELECT national_code FROM user where last_name = "soltani" AND frist_name = "kowsar"), salon_code = (SELECT salon_code FROM dinning_salon WHERE male_reserve = (SELECT name_of_male FROM information_foods WHERE code_food = 18)), code_food = (SELECT code_food FROM information_foods WHERE number_of_class = 1 AND name = "gheymeh" AND Food_day = "Sunday" AND name_of_male = "Lunch");
INSERT INTO reserve SET time =  "2022-10-04", national_code = (SELECT national_code FROM user where last_name = "soltani" AND frist_name = "kowsar"), salon_code = (SELECT salon_code FROM dinning_salon WHERE male_reserve = (SELECT name_of_male FROM information_foods WHERE code_food = 25)), code_food = (SELECT code_food FROM information_foods WHERE number_of_class = 2 AND name = "jojeh kabab" AND Food_day = "Tuesday" AND name_of_male = "Dinner");
INSERT INTO reserve SET time =  "2022-10-05", national_code = (SELECT national_code FROM user where last_name = "soltani" AND frist_name = "kowsar"), salon_code = (SELECT salon_code FROM dinning_salon WHERE male_reserve = (SELECT name_of_male FROM information_foods WHERE code_food = 33)), code_food = (SELECT code_food FROM information_foods WHERE number_of_class = 1 AND name = "adasi" AND Food_day = "Sunday" AND name_of_male = "Breakfast");

INSERT INTO reserve SET time =  "2022-10-03", national_code = (SELECT national_code FROM user where last_name = "falah" AND frist_name = "navid"), salon_code = (SELECT salon_code FROM dinning_salon WHERE male_reserve = (SELECT name_of_male FROM information_foods WHERE code_food = 13)), code_food = (SELECT code_food FROM information_foods WHERE number_of_class = 2 AND name = "gheymeh" AND Food_day = "Sunday" AND name_of_male = "Lunch");
INSERT INTO reserve SET time =  "2022-10-04", national_code = (SELECT national_code FROM user where last_name = "falah" AND frist_name = "navid"), salon_code = (SELECT salon_code FROM dinning_salon WHERE male_reserve = (SELECT name_of_male FROM information_foods WHERE  code_food = 25)), code_food = (SELECT code_food FROM information_foods WHERE number_of_class = 2 AND name = "morgh" AND Food_day = "Wednesday" AND name_of_male = "Dinner");
INSERT INTO reserve SET time =  "2022-10-05", national_code = (SELECT national_code FROM user where last_name = "falah" AND frist_name = "navid"), salon_code = (SELECT salon_code FROM dinning_salon WHERE male_reserve = (SELECT name_of_male FROM information_foods WHERE code_food  = 34)), code_food = (SELECT code_food FROM information_foods WHERE number_of_class = 1 AND name = "kare moraba" AND Food_day = "Monday" AND name_of_male = "Breakfast");



INSERT INTO reserve SET time =  "2022-10-03", national_code = (SELECT national_code FROM user where last_name = "rostami" AND frist_name = "mahdi"), salon_code = (SELECT salon_code FROM dinning_salon WHERE male_reserve = (SELECT name_of_male FROM information_foods WHERE code_food = 18)), code_food = (SELECT code_food FROM information_foods WHERE number_of_class = 1 AND name = "gheymeh" AND Food_day = "Sunday" AND name_of_male = "Lunch");
INSERT INTO reserve SET time =  "2022-10-05", national_code = (SELECT national_code FROM user where last_name = "rostami" AND frist_name = "mahdi"), salon_code = (SELECT salon_code FROM dinning_salon WHERE male_reserve = (SELECT name_of_male FROM information_foods WHERE code_food = 33)), code_food = (SELECT code_food FROM information_foods WHERE number_of_class = 1 AND name = "adasi" AND Food_day = "Sunday" AND name_of_male = "Breakfast");



INSERT INTO reserve SET time =  "2022-10-03", national_code = (SELECT national_code FROM user where last_name = "bejani" AND frist_name = "mahdi"), salon_code = (SELECT salon_code FROM dinning_salon WHERE male_reserve = (SELECT name_of_male FROM information_foods WHERE code_food = 13)), code_food = (SELECT code_food FROM information_foods WHERE number_of_class = 2 AND name = "gheymeh" AND Food_day = "Sunday" AND name_of_male = "Lunch");
INSERT INTO reserve SET time =  "2022-10-04", national_code = (SELECT national_code FROM user where last_name = "bejani" AND frist_name = "mahdi"), salon_code = (SELECT salon_code FROM dinning_salon WHERE male_reserve = (SELECT name_of_male FROM information_foods WHERE code_food = 26)), code_food = (SELECT code_food FROM information_foods WHERE number_of_class = 2 AND name = "morgh" AND Food_day = "Wednesday" AND name_of_male = "Dinner");
INSERT INTO reserve SET time =  "2022-10-05", national_code = (SELECT national_code FROM user where last_name = "bejani" AND frist_name = "mahdi"), salon_code = (SELECT salon_code FROM dinning_salon WHERE male_reserve = (SELECT name_of_male FROM information_foods WHERE code_food = 36)), code_food = (SELECT code_food FROM information_foods WHERE number_of_class = 1 AND name = "tokhm morq" AND Food_day = "Wednesday" AND name_of_male = "Breakfast");

INSERT INTO reserve SET time =  "2022-10-03", national_code = (SELECT national_code FROM user where last_name = "tavana" AND frist_name = "nazanin"), salon_code = (SELECT salon_code FROM dinning_salon WHERE male_reserve = (SELECT name_of_male FROM information_foods WHERE code_food = 18)), code_food = (SELECT code_food FROM information_foods WHERE number_of_class = 1 AND name = "gheymeh" AND Food_day = "Sunday" AND name_of_male = "Lunch");
INSERT INTO reserve SET time =  "2022-10-04", national_code = (SELECT national_code FROM user where last_name = "tavana" AND frist_name = "nazanin"), salon_code = (SELECT salon_code FROM dinning_salon WHERE male_reserve = (SELECT name_of_male FROM information_foods WHERE code_food = 30)), code_food = (SELECT code_food FROM information_foods WHERE number_of_class = 1 AND name = "jojeh kabab" AND Food_day = "Tuesday" AND name_of_male = "Dinner");
INSERT INTO reserve SET time =  "2022-10-05", national_code = (SELECT national_code FROM user where last_name = "tavana" AND frist_name = "nazanin"), salon_code = (SELECT salon_code FROM dinning_salon WHERE male_reserve = (SELECT name_of_male FROM information_foods WHERE code_food = 35)), code_food = (SELECT code_food FROM information_foods WHERE number_of_class = 1 AND name = "panir" AND Food_day = "Tuesday" AND name_of_male = "Breakfast");

INSERT INTO reserve SET time =  "2022-10-03", national_code = (SELECT national_code FROM user where last_name = "akhlaghi" AND frist_name = "zeynab"), salon_code = (SELECT salon_code FROM dinning_salon WHERE male_reserve = (SELECT name_of_male FROM information_foods WHERE code_food = 18)), code_food = (SELECT code_food FROM information_foods WHERE number_of_class = 1 AND name = "gheymeh" AND Food_day = "Sunday" AND name_of_male = "Lunch");
INSERT INTO reserve SET time =  "2022-10-04", national_code = (SELECT national_code FROM user where last_name = "akhlaghi" AND frist_name = "zeynab"), salon_code = (SELECT salon_code FROM dinning_salon WHERE male_reserve = (SELECT name_of_male FROM information_foods WHERE code_food = 25)), code_food = (SELECT code_food FROM information_foods WHERE number_of_class = 2 AND name = "jojeh kabab" AND Food_day = "Tuesday" AND name_of_male = "Dinner");
INSERT INTO reserve SET time =  "2022-10-05", national_code = (SELECT national_code FROM user where last_name = "akhlaghi" AND frist_name = "zeynab"), salon_code = (SELECT salon_code FROM dinning_salon WHERE male_reserve = (SELECT name_of_male FROM information_foods WHERE code_food = 36)), code_food = (SELECT code_food FROM information_foods WHERE number_of_class = 1 AND name = "tokhm morq" AND Food_day = "Wednesday" AND name_of_male = "Breakfast");

INSERT INTO reserve SET time =  "2022-10-03", national_code = (SELECT national_code FROM user where last_name = "soltani" AND frist_name = "reza"), salon_code = (SELECT salon_code FROM dinning_salon WHERE male_reserve = (SELECT name_of_male FROM information_foods WHERE code_food = 13)), code_food = (SELECT code_food FROM information_foods WHERE number_of_class = 2 AND name = "gheymeh" AND Food_day = "Sunday" AND name_of_male = "Lunch");
INSERT INTO reserve SET time =  "2022-10-04", national_code = (SELECT national_code FROM user where last_name = "soltani" AND frist_name = "reza"), salon_code = (SELECT salon_code FROM dinning_salon WHERE male_reserve = (SELECT name_of_male FROM information_foods WHERE code_food = 30)), code_food = (SELECT code_food FROM information_foods WHERE number_of_class = 1 AND name = "jojeh kabab" AND Food_day = "Tuesday" AND name_of_male = "Dinner");
INSERT INTO reserve SET time =  "2022-10-05", national_code = (SELECT national_code FROM user where last_name = "soltani" AND frist_name = "reza"), salon_code = (SELECT salon_code FROM dinning_salon WHERE male_reserve = (SELECT name_of_male FROM information_foods WHERE code_food = 36)), code_food = (SELECT code_food FROM information_foods WHERE number_of_class = 1 AND name = "tokhm morq" AND Food_day = "Wednesday" AND name_of_male = "Breakfast");



INSERT INTO reserve SET time =  "2022-10-03", national_code = (SELECT national_code FROM user where last_name = "mohammadi" AND frist_name = "asghar"), salon_code = (SELECT salon_code FROM dinning_salon WHERE male_reserve = (SELECT name_of_male FROM information_foods WHERE code_food = 18)), code_food = (SELECT code_food FROM information_foods WHERE number_of_class = 1 AND name = "gheymeh" AND Food_day = "Sunday" AND name_of_male = "Lunch");
INSERT INTO reserve SET time =  "2022-10-04", national_code = (SELECT national_code FROM user where last_name = "mohammadi" AND frist_name = "asghar"), salon_code = (SELECT salon_code FROM dinning_salon WHERE male_reserve = (SELECT name_of_male FROM information_foods WHERE code_food = 25)), code_food = (SELECT code_food FROM information_foods WHERE number_of_class = 2 AND name = "jojeh kabab" AND Food_day = "Tuesday" AND name_of_male = "Dinner");
INSERT INTO reserve SET time =  "2022-10-05", national_code = (SELECT national_code FROM user where last_name = "mohammadi" AND frist_name = "asghar"), salon_code = (SELECT salon_code FROM dinning_salon WHERE male_reserve = (SELECT name_of_male FROM information_foods WHERE code_food = 35)), code_food = (SELECT code_food FROM information_foods WHERE number_of_class = 1 AND name = "panir" AND Food_day = "Tuesday" AND name_of_male = "Breakfast");


INSERT INTO reserve SET time =  "2022-10-03", national_code = (SELECT national_code FROM user where last_name = "rezaee" AND frist_name = "sajed"), salon_code = (SELECT salon_code FROM dinning_salon WHERE male_reserve = (SELECT name_of_male FROM information_foods WHERE code_food = 13)), code_food = (SELECT code_food FROM information_foods WHERE number_of_class = 2 AND name = "gheymeh" AND Food_day = "Sunday" AND name_of_male = "Lunch");
INSERT INTO reserve SET time =  "2022-10-04", national_code = (SELECT national_code FROM user where last_name = "rezaee" AND frist_name = "sajed"), salon_code = (SELECT salon_code FROM dinning_salon WHERE male_reserve = (SELECT name_of_male FROM information_foods WHERE code_food = 25)), code_food = (SELECT code_food FROM information_foods WHERE number_of_class = 2 AND name = "jojeh kabab" AND Food_day = "Tuesday" AND name_of_male = "Dinner");
INSERT INTO reserve SET time =  "2022-10-05", national_code = (SELECT national_code FROM user where last_name = "rezaee" AND frist_name = "sajed"), salon_code = (SELECT salon_code FROM dinning_salon WHERE male_reserve = (SELECT name_of_male FROM information_foods WHERE code_food = 36)), code_food = (SELECT code_food FROM information_foods WHERE number_of_class = 1 AND name = "tokhm morq" AND Food_day = "Wednesday" AND name_of_male = "Breakfast");




-- set query
-- -- 1-> What people book the food?
SELECT DISTINCT user.frist_name, user.laST_name, user.sex, user.attribute FROM user inner JOIN reserve ON  user.national_code = reserve.national_code;

-- 2-> Who are the incoming students of 2022 or 2019?
select * from user inner join student on student.national_code = user.national_code where student.entering_year in ("2019", "2022");

-- 3-> How many classes are there of each food?
select name ,count(number_of_class)  from information_foods group by name;

-- 4 -> Who are the people living in Tehran?
select user.frist_name, user.laST_name from user inner join address on user.national_code = address.national_code where address.city = "tehran";

-- 5 -> The list of people who ate first class meal at least once؟
SELECT * FROM user WHERE national_code IN (SELECT DISTINCT reserve.national_code FROM reserve INNER JOIN information_foods ON information_foods.code_food = reserve.code_food WHERE information_foods.number_of_class= 1);

-- 6 -> Teachers who reserve food : 
SELECT DISTINCT user.frist_name, user.laST_name, user.sex, user.attribute FROM user inner JOIN reserve ON  user.national_code = reserve.national_code where user.attribute = "teacher";


