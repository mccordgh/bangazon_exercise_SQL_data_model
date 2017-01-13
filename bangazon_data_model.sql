DELETE FROM Employee;
DELETE FROM TrainingProgram;
DELETE FROM Employee_has_TrainingProgram;
DELETE FROM Computer;
DELETE FROM Department;
DELETE FROM Customer;
DELETE FROM Product;
DELETE FROM ProductType;
DELETE FROM BangOrder;
DELETE FROM PaymentType;
DELETE FROM PaymentType_has_Customer;

DROP TABLE IF EXISTS Employee;
DROP TABLE IF EXISTS TrainingProgram;
DROP TABLE IF EXISTS Employee_has_TrainingProgram;
DROP TABLE IF EXISTS Computer;
DROP TABLE IF EXISTS Department;
DROP TABLE IF EXISTS Customer;
DROP TABLE IF EXISTS Product;
DROP TABLE IF EXISTS ProductType;
DROP TABLE IF EXISTS BangOrder;
DROP TABLE IF EXISTS PaymentType;
DROP TABLE IF EXISTS PaymentType_has_Customer;


CREATE TABLE `Department` (
	`idDepartment` INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	`SupervisorId` INTEGER NOT NULL,
	`ExpenseBudget` INTEGER NOT NULL
);

CREATE TABLE `Employee` (
	`idEmployee` INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	`LastName` TEXT NOT NULL,
	`FirstName` TEXT NOT NULL,
	`JobTitle` TEXT NOT NULL,
	`idDepartment` INTEGER NOT NULL,
	FOREIGN KEY(`idDepartment`) REFERENCES `Department`(`idDepartment`)
);

CREATE TABLE `TrainingProgram` (
	`idTrainingProgram` INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	`StartDate` TEXT NOT NULL,
	`EndDate` TEXT NOT NULL,
	`MaximumAttendees` INTEGER NOT NULL
);

CREATE TABLE `Employee_has_TrainingProgram` (
	`idEmployee` INTEGER NOT NULL,
	`idTrainingProgram` INTEGER NOT NULL,
	FOREIGN KEY(`idEmployee`) REFERENCES `Employee`(`idEmployee`),
	FOREIGN KEY(`idTrainingProgram`) REFERENCES `TrainingProgram`(`idTrainingProgram`)
);

CREATE TABLE `Computer` (
	`idComputer` INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	`PurchaseDate` TEXT NOT NULL,
	`DecommissionDate` TEXT NOT NULL,
	`idEmployee` INTEGER NOT NULL,
	FOREIGN KEY (`idEmployee`) REFERENCES `Employee`(`idEmployee`)
);

CREATE TABLE `PaymentType` (
	`idPaymentType` INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	`AccountNumber` INTEGER NOT NULL
);

CREATE TABLE `BangOrder` (
	`idBangOrder` INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	`OrderName` TEXT NOT NULL,
	`idPaymentType` INTEGER NOT NULL,
	FOREIGN KEY (`idPaymentType`) REFERENCES `PaymentType`(`idPaymentType`)
);

CREATE TABLE `Customer` (
	`idCustomer` INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	`FirstName` TEXT NOT NULL,
	`LastName` TEXT NOT NULL,
	`AccountCreationDate` TEXT NOT NULL,
	`Active` BOOLEAN NOT NULL,
	`idBangOrder` INTEGER NOT NULL,
	FOREIGN KEY (`idBangOrder`) REFERENCES `BangOrder`(`idBangOrder`)
);

CREATE TABLE `PaymentType_has_Customer` (
	`idPaymentType` INTEGER NOT NULL,
	`idCustomer` INTEGER NOT NULL,
	FOREIGN KEY(`idPaymentType`) REFERENCES `PaymentType`(`idPaymentType`),
	FOREIGN KEY(`idCustomer`) REFERENCES `Customer`(`idCustomer`)
);

CREATE TABLE `ProductType` (
	`idProductType` INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	`Category` TEXT NOT NULL
);

CREATE TABLE `Product` (
	`idProduct` INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	`Price` INTEGER NOT NULL,
	`Title` TEXT NOT NULL,
	`Description` TEXT NOT NULL,
	`idProductType` INTEGER NOT NULL,
	`idCustomer` INTEGER NOT NULL,
	FOREIGN KEY (`idProductType`) REFERENCES `ProductType`(`idProductType`),
	FOREIGN KEY (`idCustomer`) REFERENCES `Customer`(`idCustomer`)
);
