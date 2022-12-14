DROP DATABASE IF EXISTS PETHEALTHCARE;
CREATE DATABASE IF NOT EXISTS PETHEALTHCARE;
USE PETHEALTHCARE;

CREATE TABLE IF NOT EXISTS USER (
  Username VARCHAR(155) NOT NULL,
  Password VARCHAR(155) NOT NULL,
  Name VARCHAR(155) NOT NULL,
  Address VARCHAR(155) NOT NULL,
  Email VARCHAR(155) NOT NULL,
  Phone CHAR(10),
  PRIMARY KEY (Username),
  UNIQUE(Email)
);

CREATE TABLE IF NOT EXISTS CLINIC (
  ClinicID INT NOT NULL,
  Location VARCHAR(155),
  Start_hours TIME,
  End_hours TIME,
  Days VARCHAR(5),
  PRIMARY KEY(ClinicID)
);

CREATE TABLE IF NOT EXISTS OWNER (
  OwnerID VARCHAR(155) NOT NULL,
  Username VARCHAR(155) NOT NULL,
  Register_date DATE,
  PRIMARY KEY (OwnerID),
  FOREIGN KEY (Username) REFERENCES USER(Username)
);

CREATE TABLE IF NOT EXISTS EMPLOYEE (
  EmployeeID VARCHAR(155) NOT NULL,
  Username VARCHAR(155) NOT NULL,
  Position VARCHAR(155) NOT NULL,
  PRIMARY KEY (EmployeeID),
  FOREIGN KEY (Username) REFERENCES USER(Username)
);

CREATE TABLE IF NOT EXISTS SERVICE (
  ServiceID INT NOT NULL,
  Name VARCHAR(155) NOT NULL,
  Duration INT NOT NULL,
  Description VARCHAR(155) NOT NULL,
  PRIMARY KEY (ServiceID)
);

CREATE TABLE IF NOT EXISTS PET (
  PetID INT NOT NULL,
  OwnerID VARCHAR(155) NOT NULL,
  Name VARCHAR(155) NOT NULL,
  Animal VARCHAR(155) NOT NULL,
  Age INT NOT NULL,
  Register_date DATE,
  PRIMARY KEY (PetID),
  FOREIGN KEY (OwnerID) REFERENCES OWNER(OwnerID)
);

CREATE TABLE IF NOT EXISTS APPOINTMENT (
  ApptID INT NOT NULL,
  Day DATE NOT NULL,
  Time TIME NOT NULL,
  EmployeeID VARCHAR(155) NOT NULL,
  PetID INT NOT NULL,
  OwnerID VARCHAR(155) NOT NULL,
  ServiceID INT NOT NULL,
  ClinicID INT NOT NULL,
  PRIMARY KEY (ApptID),
  FOREIGN KEY (EmployeeID) REFERENCES EMPLOYEE(EmployeeID),
  FOREIGN KEY (PetID) REFERENCES PET(PetID),
  FOREIGN KEY (OwnerID) REFERENCES OWNER(OwnerID),
  FOREIGN KEY (ServiceID) REFERENCES SERVICE(ServiceID),
  FOREIGN KEY (ClinicID) REFERENCES CLINIC(ClinicID)
);

INSERT INTO USER VALUES
('dogluvr', 'lovespotty', 'John Smith', '542 Sycamore Street, San Jose, CA', 'jsmith@yahoo.com', 4085550159),
('cattywins', 'lovecatty', 'Catherine Jones', '1182 Lynch Street, San Jose, CA', 'cjones@gmail.com', 4085550110),
('jackieruns', 'lovejackie', 'Jack Nguyen', '4706 Jim Rosa Lane, San Jose, CA', 'jnguyen@yahoo.com', 4085550154),
('robdoves', 'loverob', 'Roberto Escalino', '999 Ford Street, San Jose, CA', 'rescalino@hotmail.com', 4085657045),
('samsonbarks', 'lovesamson', 'Richard Villanueva', '3430 Boring Lane, San Jose, CA', 'rvillanueva@gmail.com', 4084603913),
('tsukisuki', 'lovesuki', 'Ana Oyama', '4218 Lindale Avenue, San Jose, CA', 'aoyama@yahoo.com', 4086732048),
('ribbitgibby', 'lovegibby', 'Arsh Patel', '260 Hide A Way Road, San Jose, CA', 'apatel@hotmail.com', 6501387320),
('mikescratch', 'lovemike', 'Michael Maldonaldo', '3284 Rardin Drive, San Jose, CA', 'mmaldonaldo@yahoo.com', 4086930835),
('zotzotmaira', 'lovemaira', 'Cindy Poppins', '4282 Fairway Drive, San Jose, CA', 'cpoppins@yahoo.com', 4083328720),
('kessisbest', 'lovekess', 'Luisa Montgomery', '2544 Hillview Drive, San Jose, CA', 'lmontgomery@gmail.com', 4088704724),
('drbob', 'petdr1', 'Bob Smith', '542 Sycamore Street, San Jose, CA', 'bsmith@yahoo.com', 4081309138),
('frontsam', 'petclerk1', 'Sam Brooks', '1190 Rose Street, San Jose, CA', 'sbrooks@gmail.com', 6509138013),
('frontdave', 'petclerk2', 'David Trinh', '4816 Gregory Lane, San Jose, CA', 'dtrinh@yahoo.com', 4082498362),
('drjan', 'petdr2', 'Jan Schwitz', '9139 Maple Street, San Jose, CA', 'jschwitz@hotmail.com', 4081122023),
('drsarah', 'petdr3', 'Sarah Atul', '234 Circle Lane, San Jose, CA', 'satul@gmail.com', 7073804682),
('frontjess', 'petclerk3', 'Jessica Robredo', '913 Scottsview Avenue, San Jose, CA', 'jrobredo@yahoo.com', 408234538),
('asstmaurice', 'petassist1', 'Maurice Frefel', '8612 Hidalgo Road, San Jose, CA', 'mfrefel@hotmail.com', 6508967233),
('asstjulia', 'petassist2', 'Julia Aquilino', '889 Roarin Drive, San Jose, CA', 'jaquilino@yahoo.com', 4082224333),
('internabe', 'petern1', 'Abraham Patel', '4532 Dracarys Drive, San Jose, CA', 'apatel@yahoo.com', 4082242018),
('asstmatt', 'petassist3', 'Matthew Brady', '800 S Park Drive, San Jose, CA', 'mbrady@gmail.com', 4088308134);

INSERT INTO CLINIC VALUES
(1029, 'San Jose', '08:00:00', '17:00:00', 'MTWRF'),
(1031, 'San Jose', '08:00:00', '17:00:00', 'MTWRF'),
(1024, 'Milpitas', '09:00:00', '18:00:00', 'MWF'),
(1026, 'Milpitas', '09:00:00', '18:00:00', 'MWF'),
(1030, 'San Jose', '08:00:00', '17:00:00', 'MF'),
(1028, 'San Jose', '08:00:00', '16:00:00', 'MTWRF'),
(1025, 'Milpitas', '08:00:00', '17:00:00', 'MTWRF'),
(1042, 'Gilroy', '08:00:00', '17:00:00', 'MTWRF'),
(1043, 'Gilroy', '08:00:00', '17:00:00', 'MTWR'),
(1011, 'Fremont', '08:00:00', '17:00:00', 'MTWRF'),
(1012, 'Fremont', '08:00:00', '17:00:00', 'MTWR');

INSERT INTO OWNER VALUES
(4401, 'dogluvr', '2018-03-14'),
(4402, 'cattywins', '2018-03-14'),
(4403, 'jackieruns', '2019-06-10'),
(4404, 'robdoves', '2019-08-23'),
(4405, 'samsonbarks', '2019-09-11'),
(4406, 'tsukisuki', '2019-12-17'),
(4407, 'ribbitgibby', '2020-01-04'),
(4408, 'mikescratch', '2020-02-02'),
(4409, 'zotzotmaira', '2021-04-18'),
(4410, 'kessisbest', '2021-11-06');

INSERT INTO EMPLOYEE VALUES
(901, 'drbob', 'veterinarian'),
(902, 'frontsam', 'clerk'),
(903, 'frontdave', 'clerk'),
(904, 'drjan', 'veterinarian'),
(905, 'drsarah', 'veterinarian'),
(906, 'frontjess', 'clerk'),
(907, 'asstmaurice', 'assistant'),
(908, 'asstjulia', 'assistant'),
(909, 'internabe', 'intern'),
(910, 'asstmatt', 'assistant');

INSERT INTO SERVICE VALUES
(501, 'Grooming', 2, 'Pet maintenance care (washing, haircuts, nail treatments'),
(502, 'Dental', 1, 'Pet teeth checkup and cleaning'),
(503, 'Surgical', 4, 'Pet specialized surgical procedures'),
(504, 'Emergency', 2, 'Pet urgent care for emergency situations'),
(505, 'Annual Checkup', 2, 'Pet overall health and wellness evaluation'),
(506, 'Lab', 1, 'Pet technician service for lab work (blood tests, x-rays)'),
(507, 'Vaccination', 1, 'Pet vaccinations / boosters'),
(508, 'Online', 1, 'Pet virtual consultations'),
(509, 'Nutrition', 1, 'Pet evaluation and recommendation of diet'),
(510, 'Training', 3, 'Pet training sessions');

INSERT INTO PET VALUES
(8801, 4409, 'Sally', 'Snake', 7, '2018-05-03'),
(8802, 4401, 'Lucy', 'Dog', 10, '2015-08-10'),
(8803, 4404, 'Tweety', 'Parrot', 20, '2006-09-06'),
(8804, 4406, 'Peter', 'Rabbit', 4, '2019-03-19'),
(8805, 4401, 'Milo', 'Dog', 8, '2017-01-30'),
(8806, 4407, 'Nemo', 'Fish', 5, '2018-04-14'),
(8807, 4405, 'Sam', 'Dog', 6, '2016-10-16'),
(8808, 4408, 'Mike', 'Cat', 13, '2010-11-08'),
(8809, 4410, 'Fluffy', 'Hamster', 1, '2021-7-20'),
(8810, 4402, 'Keri', 'Cat', 3, '2020-06-05');

INSERT INTO APPOINTMENT VALUES
(3000, '2008-10-16', '08:00', 901, 8803, 4404, 505, 1043),
(3015, '2011-12-18', '10:00', 907, 8808, 4408, 501, 1031),
(3020, '2013-09-01', '15:00', 904, 8808, 4408, 509, 1031),
(3035, '2017-11-06', '18:00', 910, 8807, 4405, 510, 1025),
(3040, '2018-02-28', '08:00', 905, 8805, 4401, 502, 1030),
(3055, '2019-06-03', '18:00', 908, 8801, 4409, 506, 1026),
(3060, '2020-03-09', '08:00', 905, 8805, 4401, 505, 1030),
(3075, '2021-04-10', '16:00', 909, 8804, 4406, 507, 1011),
(3080, '2021-08-15', '11:00', 901, 8810, 4402, 505, 1028),
(3095, '2022-07-08', '09:00', 904, 8809, 4410, 509, 1031);
