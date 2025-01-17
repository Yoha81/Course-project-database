CREATE TABLE Workers (
  id INT PRIMARY KEY,
  name VARCHAR(50),
  position VARCHAR(50),
  salary INT,
  hireDate DATE
);

CREATE TABLE Customers (
  id INT PRIMARY KEY,
  name VARCHAR(50),
  address VARCHAR(100),
  phone VARCHAR(20),
  email VARCHAR(50),
  plan_id INT
);

CREATE TABLE InternetPlans (
  id INT PRIMARY KEY,
  name VARCHAR(50),
  speed VARCHAR(20),
  price INT
);

CREATE TABLE Payments (
  id INT PRIMARY KEY,
  customer_id INT,
  amount INT,
  paymentDate DATE
);

CREATE TABLE SupportTickets (
  id INT PRIMARY KEY,
  customer_id INT,
  issueDescription VARCHAR(255),
  status VARCHAR(50),
  creationDate DATE
);

CREATE TABLE Equipment (
  id INT PRIMARY KEY,
  name VARCHAR(50),
  type VARCHAR(50),
  price INT
);

CREATE TABLE ServiceCalls (
  id INT PRIMARY KEY,
  worker_id INT,
  customer_id INT,
  callDate DATE,
  issueResolved CHAR(1)
);

CREATE TABLE Contracts (
  id INT PRIMARY KEY,
  customer_id INT,
  startDate DATE,
  endDate DATE
);

CREATE TABLE Discounts (
  id INT PRIMARY KEY,
  plan_id INT,
  discountPercent INT,
  validUntil DATE
);

CREATE TABLE Locations (
  id INT PRIMARY KEY,
  city VARCHAR(50),
  region VARCHAR(50),
  postalCode VARCHAR(10)
);

CREATE TABLE Complaints (
  id INT PRIMARY KEY,
  customer_id INT,
  complaintText VARCHAR(255),
  status VARCHAR(50),
  dateFiled DATE
);

CREATE TABLE EquipmentRentals (
  id INT PRIMARY KEY,
  customer_id INT,
  equipment_id INT,
  rentalStartDate DATE,
  rentalEndDate DATE
);

CREATE TABLE CustomerEquipmentService (
  id INT PRIMARY KEY,
  customer_id INT,
  equipment_id INT,
  serviceCall_id INT,
  issueResolved CHAR(1)
);

CREATE TABLE PlanContracts (
  id INT PRIMARY KEY,
  plan_id INT,
  contract_id INT
);

CREATE TABLE WorkerCustomerInteractions (
  id INT PRIMARY KEY,
  worker_id INT,
  customer_id INT,
  interactionDate DATE,
  interactionType VARCHAR(50)
);

CREATE TABLE DiscountUsage (
  id INT PRIMARY KEY,
  discount_id INT,
  customer_id INT,
  dateUsed DATE
);

