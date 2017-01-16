DELETE FROM Employee_has_TrainingProgram;
DELETE FROM TrainingProgram;
DELETE FROM Computer;
DELETE FROM Employee;
DELETE FROM Department;
DELETE FROM PaymentType_has_Customer;
DELETE FROM BangOrder_has_Product;
DELETE FROM BangOrder;
DELETE FROM PaymentType;
DELETE FROM Product;
DELETE FROM Customer;
DELETE FROM ProductType;

DROP TABLE IF EXISTS Employee_has_TrainingProgram;
DROP TABLE IF EXISTS TrainingProgram;
DROP TABLE IF EXISTS Computer;
DROP TABLE IF EXISTS Employee;
DROP TABLE IF EXISTS Department;
DROP TABLE IF EXISTS PaymentType_has_Customer;
DROP TABLE IF EXISTS BangOrder_has_Product;
DROP TABLE IF EXISTS BangOrder;
DROP TABLE IF EXISTS PaymentType;
DROP TABLE IF EXISTS Product;
DROP TABLE IF EXISTS Customer;
DROP TABLE IF EXISTS ProductType;


CREATE TABLE `Department` (
	`idDepartment` INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	`Name` TEXT NOT NULL,
	`SupervisorId` INTEGER NOT NULL,
	`ExpenseBudget` INTEGER NOT NULL
);

INSERT INTO Department (Name, SupervisorId, ExpenseBudget)
VALUES ('Leather Jackets', 1, 400000);
INSERT INTO Department (Name, SupervisorId, ExpenseBudget)
VALUES ('Laser Guns', 2, 4600000);

CREATE TABLE `Employee` (
	`idEmployee` INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	`LastName` TEXT NOT NULL,
	`FirstName` TEXT NOT NULL,
	`JobTitle` TEXT NOT NULL,
	`idDepartment` INTEGER NOT NULL,
	FOREIGN KEY(`idDepartment`) REFERENCES `Department`(`idDepartment`)
);

INSERT INTO Employee (LastName, FirstName, JobTitle, idDepartment)
VALUES ('Rogers', 'Rogert', 'Supervisor', 1);
INSERT INTO Employee (LastName, FirstName, JobTitle, idDepartment)
VALUES ('Matthews', 'Matty', 'Supervisor', 2);
INSERT INTO Employee (LastName, FirstName, JobTitle, idDepartment)
VALUES ('Joers', 'Joey', 'Cashier', 1);
INSERT INTO Employee (LastName, FirstName, JobTitle, idDepartment)
VALUES ('Steele', 'Remington', 'Research & Development', 2);


CREATE TABLE `TrainingProgram` (
	`idTrainingProgram` INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	`Name` TEXT NOT NULL,
	`StartDate` TEXT NOT NULL,
	`EndDate` TEXT NOT NULL,
	`MaximumAttendees` INTEGER NOT NULL
);

INSERT INTO TrainingProgram (Name, StartDate, EndDate, MaximumAttendees)
VALUES ('Assisted Astral Projection', '1/1/2017', '2/2/2017', 12);
INSERT INTO TrainingProgram (Name, StartDate, EndDate, MaximumAttendees)
VALUES ('Slapping is not decent', '1/2/2017', '3/4/2017', 10);


CREATE TABLE `Employee_has_TrainingProgram` (
	`idEmployee` INTEGER NOT NULL,
	`idTrainingProgram` INTEGER NOT NULL,
	FOREIGN KEY(`idEmployee`) REFERENCES `Employee`(`idEmployee`),
	FOREIGN KEY(`idTrainingProgram`) REFERENCES `TrainingProgram`(`idTrainingProgram`)
);

INSERT INTO Employee_has_TrainingProgram (idEmployee, idTrainingProgram)
VALUES (1, 1);
INSERT INTO Employee_has_TrainingProgram (idEmployee, idTrainingProgram)
VALUES (2, 1);
INSERT INTO Employee_has_TrainingProgram (idEmployee, idTrainingProgram)
VALUES (3, 2);
INSERT INTO Employee_has_TrainingProgram (idEmployee, idTrainingProgram)
VALUES (4, 2);

CREATE TABLE `Computer` (
	`idComputer` INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	`PurchaseDate` TEXT NOT NULL,
	`DecommissionDate` TEXT NOT NULL,
	`idEmployee` INTEGER NOT NULL,
	FOREIGN KEY (`idEmployee`) REFERENCES `Employee`(`idEmployee`)
);

INSERT INTO Computer (PurchaseDate, DecommissionDate, idEmployee)
VALUES ('2/2/2015', '2/2/2018', 1);
INSERT INTO Computer (PurchaseDate, DecommissionDate, idEmployee)
VALUES ('3/3/2015', '3/3/2018', 2);
INSERT INTO Computer (PurchaseDate, DecommissionDate, idEmployee)
VALUES ('4/4/2015', '4/4/2018', 3);
INSERT INTO Computer (PurchaseDate, DecommissionDate, idEmployee)
VALUES ('5/5/2015', '5/5/2018', 4);

CREATE TABLE `PaymentType` (
	`idPaymentType` INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	`Name` TEXT NOT NULL,
	`AccountNumber` INTEGER NOT NULL
);

INSERT INTO PaymentType (Name, AccountNumber)
VALUES ('Visa', 12345678);
INSERT INTO PaymentType (Name, AccountNumber)
VALUES ('Paypal', 87654321);
INSERT INTO PaymentType (Name, AccountNumber)
VALUES ('DogeCoin', 99887766);

CREATE TABLE `Customer` (
	`idCustomer` INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	`FirstName` TEXT NOT NULL,
	`LastName` TEXT NOT NULL,
	`AccountCreationDate` TEXT NOT NULL,
	`IsActive` INTEGER NOT NULL
);

INSERT INTO Customer (FirstName, LastName, AccountCreationDate, IsActive)
VALUES ('Duck', 'Donald', '1/5/2014', 1);
INSERT INTO Customer (FirstName, LastName, AccountCreationDate, IsActive)
VALUES ('Brew', 'Sternan', '6/5/2014', 1);
INSERT INTO Customer (FirstName, LastName, AccountCreationDate, IsActive)
VALUES ('Grips', 'Relff', '6/15/2014', 0);

CREATE TABLE `ProductType` (
	`idProductType` INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	`Category` TEXT NOT NULL
);

INSERT INTO ProductType (Category)
VALUES ('Leather Jacket');
INSERT INTO ProductType (Category)
VALUES ('Laser Gun');

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

INSERT INTO Product (Price, Title, Description, idProductType, idCustomer)
VALUES (99, 'Scorpion Leather Jacket', 'Hand stitched killer scorp logo, dude!', 1, 1);
INSERT INTO Product (Price, Title, Description, idProductType, idCustomer)
VALUES (299, 'Honey Badger Leather Jacket', 'Hand stitched honey badger does not give a flip logo, dude!', 1, 2);
INSERT INTO Product (Price, Title, Description, idProductType, idCustomer)
VALUES (599, 'Plasma Gun', 'This shoots plasma lasers...I know right!', 2, 1);
INSERT INTO Product (Price, Title, Description, idProductType, idCustomer)
VALUES (6799, 'Dark Side of the Moon Gun', 'A rainbow of instantly blinding colors!', 2, 3);

CREATE TABLE `BangOrder` (
	`idBangOrder` INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	`OrderName` TEXT NOT NULL,
	`idProduct` INTEGER NOT NULL,
	`idPaymentType` INTEGER NOT NULL,
	`idCustomer` INTEGER NOT NULL,
	FOREIGN KEY (`idProduct`) REFERENCES `Product`(`idProduct`),
	FOREIGN KEY (`idPaymentType`) REFERENCES `PaymentType`(`idPaymentType`),
	FOREIGN KEY (`idCustomer`) REFERENCES `Customer`(`idCustomer`)
);

INSERT INTO BangOrder (OrderName, idProduct, idPaymentType, idCustomer)
VALUES ('Bubba Corporation', 1, 1, 1);
INSERT INTO BangOrder (OrderName, idProduct, idPaymentType, idCustomer)
VALUES ('Totally Not Evil Villains, LLC', 4, 2, 2);

CREATE TABLE `PaymentType_has_Customer` (
	`idPaymentType` INTEGER NOT NULL,
	`idCustomer` INTEGER NOT NULL,
	FOREIGN KEY(`idPaymentType`) REFERENCES `PaymentType`(`idPaymentType`),
	FOREIGN KEY(`idCustomer`) REFERENCES `Customer`(`idCustomer`)
);

INSERT INTO PaymentType_has_Customer (idPaymentType, idCustomer)
VALUES (1, 1);
INSERT INTO PaymentType_has_Customer (idPaymentType, idCustomer)
VALUES (2, 3);
INSERT INTO PaymentType_has_Customer (idPaymentType, idCustomer)
VALUES (3, 2);

CREATE TABLE `BangOrder_has_Product` (
	`idBangOrder` INTEGER NOT NULL,
	`idProduct` INTEGER NOT NULL,
	FOREIGN KEY(`idBangOrder`) REFERENCES `BangOrder`(`idBangOrder`),
	FOREIGN KEY(`idProduct`) REFERENCES `Product`(`idProduct`)
);

INSERT INTO BangOrder_has_Product (idBangOrder, idProduct)
VALUES (1, 1);
INSERT INTO BangOrder_has_Product (idBangOrder, idProduct)
VALUES (2, 3);
INSERT INTO BangOrder_has_Product (idBangOrder, idProduct)
VALUES (2, 4);

