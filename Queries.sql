SELECT c.name AS customer_name, c.email, ip.name AS plan_name, ip.speed, ip.price
FROM Customers c
JOIN InternetPlans ip ON c.plan_id = ip.id
ORDER BY c.name;

SELECT c.name AS customer_name, p.amount, p.paymentDate
FROM Customers c
JOIN Payments p ON c.id = p.customer_id
ORDER BY p.paymentDate DESC;

SELECT e.name AS equipment_name, COUNT(er.id) AS rental_count
FROM Equipment e
LEFT JOIN EquipmentRentals er ON e.id = er.equipment_id
GROUP BY e.name
HAVING COUNT(er.id) > 0;

SELECT w.name AS worker_name, c.name AS customer_name, sc.callDate, sc.issueResolved
FROM Workers w
JOIN ServiceCalls sc ON w.id = sc.worker_id
JOIN Customers c ON sc.customer_id = c.id
WHERE sc.issueResolved = 'Y'
ORDER BY sc.callDate DESC;

SELECT c.name AS customer_name, cmp.complaintText, cmp.status AS complaint_status, cmp.dateFiled
FROM Customers c
JOIN Complaints cmp ON c.id = cmp.customer_id
WHERE cmp.status <> 'Resolved'
ORDER BY cmp.dateFiled DESC;