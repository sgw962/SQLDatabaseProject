create table Customer
(
Customer_ID int primary key not null,
Customer_Phone varchar(15) not null,
Customer_FName varchar(30) not null,
Customer_LName varchar(30) not null,
Customer_Address varchar(150) not null,
Customer_Email varchar(40) not null
);

create table Branch
(
Branch_ID int primary key not null,
Branch_Name varchar(50) not null,
Branch_Address varchar(150) not null
);

create table Car
(
Car_ID int primary key not null,
Registration varchar(8) not null,
Model_Number int not null,
Car_Description varchar(250) not null,
Car_Cost decimal(11,2) not null,
New_or_Not varchar(11) not null,
Car_Name varchar(40) not null,
Make varchar(40) not null,
Manufacturing_Date date not null
);

create table Car_Component
(
Component_ID int primary key not null,
Part_or_Accessory varchar(9) not null,
Component_Description varchar(150) not null,
Component_Cost decimal(6,2) not null
);

create table Sales_Agent
(
Agent_ID int primary key not null,
Agent_FName varchar(30) not null,
Agent_LName varchar(30) not null,
Agent_Email varchar(40) not null,
Agent_Phone varchar(15) not null,
Branch_ID int not null,
foreign key (Branch_ID) references Branch (Branch_ID)
);

create table Purchase
(
Purchase_ID int primary key not null,
Car_ID int,
Component_ID int,
Customer_ID int not null,
Agent_ID int not null,
Purchase_Date date not null,
Payment_Method varchar(50) not null,
Branch_ID int not null,
foreign key (Car_ID) references Car (Car_ID),
foreign key (Component_ID) references Car_Component (Component_ID),
foreign key (Customer_ID) references Customer (Customer_ID),
foreign key (Agent_ID) references Sales_Agent (Agent_ID),
foreign key (Branch_ID) references Branch (Branch_ID)
);

create table Returned
(
Return_ID int primary key not null,
Car_ID int,
Component_ID int,
Customer_ID int not null,
Agent_ID int not null,
Branch_ID int not null,
Return_Reason varchar(250) not null,
foreign key (Car_ID) references Car (Car_ID),
foreign key (Component_ID) references Car_Component (Component_ID),
foreign key (Customer_ID) references Customer (Customer_ID),
foreign key (Agent_ID) references Sales_Agent (Agent_ID),
foreign key (Branch_ID) references Branch (Branch_ID)
);

INSERT INTO Customer (Customer_ID, Customer_Phone, Customer_FName, Customer_LName, Customer_Address, Customer_Email)
VALUES
(101, '07012 345678', 'John', 'Smith', '123 Main Street, London', 'john.smith@example.com'),
(102, '07234 567890', 'Emma', 'Johnson', '456 High Street, Manchester', 'emma.johnson@example.com'),
(103, '07131 234567', 'David', 'Wilson', '789 Elm Street, Leeds', 'david.wilson@example.com'),
(104, '07512 345678', 'Sophie', 'Brown', '101 Oak Avenue, Liverpool', 'sophie.brown@example.com'),
(105, '07908 123456', 'James', 'Taylor', '321 Maple Road, Milton Keynes', 'james.taylor@example.com'),
(106, '07312 345678', 'Olivia', 'Davies', '543 Pine Street, Edinburgh', 'olivia.davies@example.com'),
(107, '07613 456789', 'William', 'Evans', '876 Birch Lane, Manchester', 'william.evans@example.com'),
(108, '07772 345678', 'Emily', 'Thomas', '987 Cedar Drive, Preston', 'emily.thomas@example.com'),
(109, '07412 345678', 'Daniel', 'Roberts', '654 Elm Street, Glasgow', 'daniel.roberts@example.com'),
(110, '07273 456789', 'Charlotte', 'Clark', '234 Oak Street, Brighton', 'charlotte.clark@example.com');

INSERT INTO Branch (Branch_ID, Branch_Name, Branch_Address) 
VALUES
    (1, 'London Central', '123 Main Street, London'),
    (2, 'West London', '456 Park Avenue, London'),
    (3, 'North London', '789 Elm Street, London'),
    (4, 'South London', '101 Oak Street, London'),
    (5, 'East London', '234 Maple Avenue, London'),
    (6, 'Camden', '567 Pine Street, London'),
    (7, 'Barnes', '890 Cedar Street, London'),
    (8, 'London Heathrow', '111 Airport Road, London'),
    (9, 'London Victoria', '222 Train Station Square, London'),
    (10, 'Putney', '333 Riverside Drive, London');

INSERT INTO Car (Car_ID, Registration, Model_Number, Car_Description, Car_Cost, New_or_Not, Car_Name, Make, Manufacturing_Date) VALUES
(401, 'AB123CD', 2022, 'Compact hatchback, suitable for urban driving.', 18000.00, 'New', 'Volkswagen Polo', 'Volkswagen', '2023-02-15'),
(402, 'EF456GH', 2023, 'Family SUV with ample space and modern features.', 28000.00, 'New', 'Ford Kuga', 'Ford', '2023-07-20'),
(403, 'IJ789KL', 2021, 'Elegant executive sedan, perfect for business trips.', 35000.00, 'Used', 'BMW 5 Series', 'BMW', '2021-11-10'),
(404, 'MN012OP', 2024, 'Sporty coupe with high-performance engine.', 42000.00, 'New', 'Audi TT', 'Audi', '2024-03-05'),
(405, 'QR345ST', 2023, 'Electric city car with eco-friendly credentials.', 27000.00, 'New', 'Nissan Leaf', 'Nissan', '2023-10-28'),
(406, 'UV678WX', 2022, 'Robust pickup truck, ideal for off-road adventures.', 32000.00, 'Used', 'Toyota Hilux', 'Toyota', '2022-05-16'),
(407, 'YZ901AB', 2023, 'Compact crossover, perfect for young professionals.', 23000.00, 'New', 'Renault Captur', 'Renault', '2023-08-12'),
(408, 'CD234EF', 2021, 'Luxurious SUV offering comfort and refinement.', 55000.00, 'Used', 'Range Rover Velar', 'Land Rover', '2021-09-30'),
(409, 'GH567IJ', 2023, 'Agile city car, great for navigating busy streets.', 15000.00, 'Used', 'Volkswagen Golf', 'Volkswagen', '2023-04-25'),
(4010, 'KL890MN', 2022, 'Practical estate car with generous cargo space.', 25000.00, 'Used', 'Volvo V60', 'Volvo', '2022-08-18'),
(411, 'OP234QR', 2023, 'Compact sedan with fuel-efficient engine.', 20000.00, 'New', 'Honda Civic', 'Honda', '2023-05-12'),
(412, 'ST567UV', 2024, 'Luxury SUV featuring advanced technology.', 60000.00, 'New', 'Mercedes-Benz GLE', 'Mercedes-Benz', '2024-01-20'),
(413, 'WX890YZ', 2022, 'Versatile crossover offering comfort and style.', 27000.00, 'Used', 'Kia Sportage', 'Kia', '2022-09-28'),
(414, 'AB123CD', 2024, 'Hybrid hatchback with impressive fuel economy.', 22000.00, 'New', 'Toyota Prius', 'Toyota', '2024-02-15'),
(415, 'EF456GH', 2022, 'Performance sedan delivering thrilling driving experience.', 40000.00, 'Used', 'BMW 3 Series', 'BMW', '2022-07-10');


INSERT INTO Car_Component (Component_ID, Part_or_Accessory, Component_Description, Component_Cost)
VALUES
    (1, 'Part', 'Brake pads - Front', 50.00),
    (2, 'Part', 'Brake pads - Rear', 45.00),
    (3, 'Part', 'Air filter', 15.00),
    (4, 'Part', 'Oil filter', 10.00),
    (5, 'Accessory', 'Car floor mats', 25.00),
	(6, 'Accessory', 'USB car charger', 12.50),
    (7, 'Part', 'Spark plugs', 8.00),
    (8, 'Accessory', 'Car phone holder', 20.00),
    (9, 'Part', 'Windshield wipers', 30.00),
    (10, 'Accessory', 'Car air freshener', 5.00),
	(11, 'Part', 'Cabin air filter', 20.00),
    (12, 'Accessory', 'Roof rack', 150.00),
    (13, 'Part', 'Engine oil', 35.00),
    (14, 'Accessory', 'Dash cam', 100.00),
    (15, 'Part', 'Headlight bulb', 12.00);
    
INSERT INTO Sales_Agent (Agent_ID, Agent_FName, Agent_LName, Agent_Email, Agent_Phone, Branch_ID) 
VALUES
    (201, 'Michael', 'Brown', 'michael.brown@example.com', '07123 456789', 1),
    (202, 'Jessica', 'Wilson', 'jessica.wilson@example.com', '07567 890123', 2),
    (203, 'Matthew', 'Taylor', 'matthew.taylor@example.com', '07890 234567', 3),
    (204, 'Emma', 'Anderson', 'emma.anderson@example.com', '07234 567890', 4),
    (205, 'James', 'Martinez', 'james.martinez@example.com', '07901 234567', 5),
    (206, 'Sophia', 'Garcia', 'sophia.garcia@example.com', '07345 678901', 6),
    (207, 'Daniel', 'Hernandez', 'daniel.hernandez@example.com', '07678 901234', 7),
    (208, 'Olivia', 'Lopez', 'olivia.lopez@example.com', '07456 789012', 8),
    (209, 'Alexander', 'Gonzalez', 'alexander.gonzalez@example.com', '07789 012345', 9),
    (210, 'Isabella', 'Rodriguez', 'isabella.rodriguez@example.com', '07234 123456', 10);
    
INSERT INTO Purchase (Purchase_ID, Car_ID, Component_ID, Customer_ID, Agent_ID, Purchase_Date, Payment_Method, Branch_ID) 
VALUES
    (301, 401, NULL, 101, 201, '2024-03-01', 'Credit Card', 1),
    (302, NULL, 3, 102, 202, '2024-03-02', 'By Finance', 2),
    (303, 403, NULL, 103, 203, '2024-03-03', 'By Finance', 3),
    (304, 404, NULL, 104, 204, '2024-03-04', 'Credit Card', 4),
    (305, NULL, 7, 105, 205, '2024-03-05', 'Credit Card', 5),
    (306, 406, NULL, 106, 206, '2024-03-06', 'By Finance', 6),
    (307, NULL, 9, 107, 207, '2024-03-07', 'Credit Card', 7),
    (308, NULL, 10, 108, 208, '2024-03-08', 'Credit Card', 10),
    (309, 409, NULL, 109, 209, '2024-03-09', 'By Finance', 9),
    (310, NULL, 4, 110, 210, '2024-03-10', 'Credit Card', 8),
    (311, NULL, 6, 101, 203, '2024-03-11', 'Credit Card', 3),
    (312, NULL, 8, 102, 204, '2024-03-12', 'By Finance', 4);  

INSERT INTO Returned (Return_ID, Car_ID, Component_ID, Customer_ID, Agent_ID, Branch_ID, Return_Reason) 
VALUES
    (501, 415, NULL, 103, 203, 3, 'Defective engine'),
    (502, NULL, 13, 104, 204, 4, 'Mismatched specifications'),
    (503, 413, NULL, 105, 205, 5, 'Change of mind'),
    (504, NULL, 11, 106, 206, 6, 'Financial issues'),
    (505, 412, NULL, 107, 207, 7, 'Vehicle too small'),
    (506, NULL, 15, 108, 208, 8, 'Found better deal elsewhere'),
    (507, NULL, 12, 109, 209, 9, 'Faulty electronics'),
    (508, 411, NULL, 110, 210, 10, 'Upgrade to larger model'),
    (509, 414, NULL, 101, 202, 1, 'Defective transmission'),
    (510, NULL, 14, 102, 201, 2, 'Change of plans');

INSERT INTO Car (Car_ID, Registration, Model_Number, Car_Description, Car_Cost, New_or_Not, Car_Name, Make, Manufacturing_Date) VALUES
(411, 'OP234QR', 2023, 'Compact sedan with fuel-efficient engine.', 20000.00, 'New', 'Honda Civic', 'Honda', '2023-05-12'),
(412, 'ST567UV', 2024, 'Luxury SUV featuring advanced technology.', 60000.00, 'New', 'Mercedes-Benz GLE', 'Mercedes-Benz', '2024-01-20'),
(413, 'WX890YZ', 2022, 'Versatile crossover offering comfort and style.', 27000.00, 'Used', 'Kia Sportage', 'Kia', '2022-09-28'),
(414, 'AB123CD', 2024, 'Hybrid hatchback with impressive fuel economy.', 22000.00, 'New', 'Toyota Prius', 'Toyota', '2024-02-15'),
(415, 'EF456GH', 2022, 'Performance sedan delivering thrilling driving experience.', 40000.00, 'Used', 'BMW 3 Series', 'BMW', '2022-07-10');

INSERT INTO Car_Component (Component_ID, Part_or_Accessory, Component_Description, Component_Cost)
VALUES
    (11, 'Part', 'Cabin air filter', 20.00),
    (12, 'Accessory', 'Roof rack', 150.00),
    (13, 'Part', 'Engine oil', 35.00),
    (14, 'Accessory', 'Dash cam', 100.00),
    (15, 'Part', 'Headlight bulb', 12.00);

SELECT Customer_LName, Car_ID, Agent_ID, Payment_method from Customer inner join Purchase on Customer.Customer_ID=Purchase.Customer_ID;
SELECT * from Car inner join Returned on Car.Car_ID=Returned.Car_ID;
SELECT * from Branch inner join Sales_Agent on Branch.Branch_ID=Sales_Agent.Branch_ID;