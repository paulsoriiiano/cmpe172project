DROP DATABASE IF EXISTS PETHEALTHCARE;
CREATE DATABASE IF NOT EXISTS PETHEALTHCARE;
USE PETHEALTHCARE;

CREATE TABLE IF NOT EXISTS USER (
	Username VARCHAR(155) NOT NULL,
  Password VARCHAR(155) NOT NULL,
  Name VARCHAR(155) NOT NULL,
  Address VARCHAR(155) NOT NULL,
  Email VARCHAR(155),
  Phone CHAR(9),
  PRIMARY KEY (Username)
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
