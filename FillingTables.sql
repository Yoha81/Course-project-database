INSERT INTO Workers (id, name, position, salary, hireDate)
VALUES
(1, 'Misha Khrenov', 'Technician', 50000, '2020-01-15'),
(2, 'Taras Luktei', 'Support Agent', 45000, '2021-03-22'),
(3, 'Stas Shkrabiuk', 'Field Engineer', 55000, '2016-07-10');

INSERT INTO InternetPlans (id, name, speed, price)
VALUES
(1, 'Basic', '100Mbps', 50),
(2, 'Standard', '200Mbps', 70),
(3, 'Premium', '500Mbps', 100);

INSERT INTO Customers (id, name, address, phone, email, plan_id)
VALUES
(1, 'Yaroslav Khodak', '30 Konovaltsa St', '+380953467442', 'jarosvit.h06@gmail.com', 1),
(2, 'Sergiy Feniuk', '12 Shevchenka Ave', '+380508302484', 'sergeyBOB@gmail.com', 2),
(3, 'Roman Fushtei', '8 Bilozira Rd', '+380500175639', 'romanTOP@gmail.com', 3);

INSERT INTO Payments (id, customer_id, amount, paymentDate)
VALUES
(1, 1, 50, '2023-03-12'),
(2, 2, 70, '2023-10-15'),
(3, 3, 100, '2023-10-27');

INSERT INTO SupportTickets (id, customer_id, issueDescription, status, creationDate)
VALUES
(1, 1, 'Internet speed slow', 'Open', '2023-09-12'),
(2, 2, 'Connection drops frequently', 'In Progress', '2023-10-25'),
(3, 3, 'Billing issue', 'Resolved', '2023-12-03');

INSERT INTO Equipment (id, name, type, price)
VALUES
(1, 'Router', 'Networking', 100),
(2, 'Modem', 'Networking', 150),
(3, 'Wi-Fi Extender', 'Networking', 50);

INSERT INTO ServiceCalls (id, worker_id, customer_id, callDate, issueResolved)
VALUES
(1, 1, 1, '2023-04-16', 'Y'),
(2, 2, 2, '2023-07-07', 'N'),
(3, 3, 3, '2023-11-13', 'Y');

INSERT INTO Contracts (id, customer_id, startDate, endDate)
VALUES
(1, 1, '2023-01-01', '2024-01-01'),
(2, 2, '2023-02-01', '2024-02-01'),
(3, 3, '2023-03-01', '2024-03-01');

INSERT INTO Discounts (id, plan_id, discountPercent, validUntil)
VALUES
(1, 1, 10, '2023-12-31'),
(2, 2, 15, '2024-06-30'),
(3, 3, 20, '2024-12-31');

INSERT INTO Locations (id, city, region, postalCode)
VALUES
(1, 'Ivano-Frankivsk', 'Ivano-Frankivska obl', '76000'),
(2, 'Lviv', 'Lvivska obl', '79000'),
(3, 'Kyiv', 'Kyivska obl', '01001');

INSERT INTO Complaints (id, customer_id, complaintText, status, dateFiled)
VALUES
(1, 1, 'Slow internet', 'Resolved', '2023-09-12'),
(2, 2, 'Frequent disconnects', 'In Progress', '2023-02-08'),
(3, 3, 'Billing discrepancy', 'Closed', '2023-01-01');

INSERT INTO EquipmentRentals (id, customer_id, equipment_id, rentalStartDate, rentalEndDate)
VALUES
(1, 1, 1, '2023-01-01', '2024-12-31'),
(2, 2, 2, '2023-01-01', '2024-12-31'),
(3, 3, 3, '2023-01-01', '2024-12-31');

INSERT INTO CustomerEquipmentService (id, customer_id, equipment_id, serviceCall_id, issueResolved)
VALUES
(1, 1, 1, 1, 'Y'),
(2, 2, 2, 2, 'N'),
(3, 3, 3, 3, 'Y');

INSERT INTO PlanContracts (id, plan_id, contract_id)
VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 3);

INSERT INTO WorkerCustomerInteractions (id, worker_id, customer_id, interactionDate, interactionType)
VALUES
(1, 1, 1, '2023-03-29', 'Service Call'),
(2, 2, 2, '2023-10-30', 'Support Ticket'),
(3, 3, 3, '2023-11-12', 'Service Call');

INSERT INTO DiscountUsage (id, discount_id, customer_id, dateUsed)
VALUES
(1, 1, 1, '2023-04-29'),
(2, 2, 2, '2023-12-03'),
(3, 3, 3, '2023-06-28');
