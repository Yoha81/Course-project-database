ALTER TABLE Customers
ADD CONSTRAINT fk_customers_plan
FOREIGN KEY (plan_id) REFERENCES InternetPlans(id);

ALTER TABLE Payments
ADD CONSTRAINT fk_payments_customer
FOREIGN KEY (customer_id) REFERENCES Customers(id);

ALTER TABLE SupportTickets
ADD CONSTRAINT fk_supporttickets_customer
FOREIGN KEY (customer_id) REFERENCES Customers(id);

ALTER TABLE Contracts
ADD CONSTRAINT fk_contracts_customer
FOREIGN KEY (customer_id) REFERENCES Customers(id);

ALTER TABLE Discounts
ADD CONSTRAINT fk_discounts_plan
FOREIGN KEY (plan_id) REFERENCES InternetPlans(id);

ALTER TABLE Complaints
ADD CONSTRAINT fk_complaints_customer
FOREIGN KEY (customer_id) REFERENCES Customers(id);

ALTER TABLE EquipmentRentals
ADD CONSTRAINT fk_equipmentrentals_customer
FOREIGN KEY (customer_id) REFERENCES Customers(id);
ALTER TABLE EquipmentRentals
ADD CONSTRAINT fk_equipmentrentals_equipment
FOREIGN KEY (equipment_id) REFERENCES Equipment(id);

ALTER TABLE CustomerEquipmentService
ADD CONSTRAINT fk_customer_equipment_service_customer
FOREIGN KEY (customer_id) REFERENCES Customers(id);
ALTER TABLE CustomerEquipmentService
ADD CONSTRAINT fk_customer_equipment_service_equipment
FOREIGN KEY (equipment_id) REFERENCES Equipment(id);
ALTER TABLE CustomerEquipmentService
ADD CONSTRAINT fk_customer_equipment_service_serviceCall
FOREIGN KEY (serviceCall_id) REFERENCES ServiceCalls(id);

ALTER TABLE PlanContracts
ADD CONSTRAINT fk_plan_contracts_plan
FOREIGN KEY (plan_id) REFERENCES InternetPlans(id);
ALTER TABLE PlanContracts
ADD CONSTRAINT fk_plan_contracts_contract
FOREIGN KEY (contract_id) REFERENCES Contracts(id);

ALTER TABLE WorkerCustomerInteractions
ADD CONSTRAINT fk_worker_customer_interactions_worker
FOREIGN KEY (worker_id) REFERENCES Workers(id);
ALTER TABLE WorkerCustomerInteractions
ADD CONSTRAINT fk_worker_customer_interactions_customer
FOREIGN KEY (customer_id) REFERENCES Customers(id);

ALTER TABLE DiscountUsage
ADD CONSTRAINT fk_discount_usage_discount
FOREIGN KEY (discount_id) REFERENCES Discounts(id);
ALTER TABLE DiscountUsage
ADD CONSTRAINT fk_discount_usage_customer
FOREIGN KEY (customer_id) REFERENCES Customers(id);