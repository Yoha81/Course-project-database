CREATE VIEW CustomerPlanDetails AS 
SELECT 
    c.id AS customer_id,
    c.name AS customer_name,
    c.address,
    c.phone,
    c.email,
    p.name AS plan_name,
    p.speed AS plan_speed,
    p.price AS plan_price
FROM 
    Customers c
JOIN 
    InternetPlans p ON c.plan_id = p.id;
	GO

CREATE VIEW CustomerPaymentHistory AS
SELECT
    c.id AS customer_id,
    c.name AS customer_name,
    p.amount AS payment_amount,
    p.paymentDate AS payment_date
FROM
    Customers c
JOIN
    Payments p ON c.id = p.customer_id;
	GO

CREATE VIEW CustomerServiceHistory AS
SELECT
    c.id AS customer_id,
    c.name AS customer_name,
    sc.callDate AS service_call_date,
    sc.issueResolved AS issue_resolved,
    w.name AS worker_name
FROM
    Customers c
JOIN
    ServiceCalls sc ON c.id = sc.customer_id
JOIN
    Workers w ON sc.worker_id = w.id;
	GO

CREATE VIEW CustomerDiscountUsage AS
SELECT
    c.id AS customer_id,
    c.name AS customer_name,
    d.discountPercent AS discount_percentage,
    du.dateUsed AS discount_used_date
FROM
    Customers c
JOIN
    DiscountUsage du ON c.id = du.customer_id
JOIN
    Discounts d ON du.discount_id = d.id;
	GO

CREATE VIEW ActiveCustomerContracts AS
SELECT
    c.id AS customer_id,
    c.name AS customer_name,
    ct.startDate AS contract_start,
    ct.endDate AS contract_end
FROM
    Customers c
JOIN
    Contracts ct ON c.id = ct.customer_id
WHERE
    ct.endDate > CAST(GETDATE() AS DATE);
	GO
	
CREATE VIEW OpenSupportTickets AS
SELECT
    st.id AS ticket_id,
    c.id AS customer_id,
    c.name AS customer_name,
    st.issueDescription,
    st.status,
    st.creationDate
FROM
    SupportTickets st
JOIN
    Customers c ON st.customer_id = c.id
WHERE
    st.status != 'Resolved';
	GO

CREATE VIEW EquipmentRentalStats AS
SELECT
    e.name AS equipment_name,
    COUNT(er.id) AS total_rentals,
    AVG(ABS(DATEDIFF(DAY, er.rentalStartDate, er.rentalEndDate))) AS avg_rental_duration
FROM
    Equipment e
JOIN
    EquipmentRentals er ON e.id = er.equipment_id
GROUP BY
    e.name;