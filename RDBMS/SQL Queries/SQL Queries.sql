use vehicle_sales_management_system; 

#Query 1:  Give the customer details whose age is greater than 35
#simple query
SELECT customer_id, c_name, c_email, c_address, c_mobile
FROM Customer
WHERE c_age >=35;


#Query 2: Give the sales metrics of each branch and give branches where total revenue is greater than 150,000
#aggregate
SELECT branch_id, 
    COUNT(sales_id) AS TotalSales, 
    SUM(s_price) AS TotalRevenue, 
    AVG(s_price) AS AverageSalePrice
FROM Salesorder
GROUP BY branch_id
HAVING SUM(s_price) > 150000;


#Query 3: Retrieve the details of all sales orders along with the corresponding customer name:
#innerjoin 
SELECT so.sales_id, so.s_price, c.c_name 
FROM SalesOrder so
INNER JOIN Customer c ON so.customer_id = c.customer_id
ORDER BY so.sales_id ASC;


#Query 4: Fetch all vehicles and their reservation details, including vehicles without reservations
#left outer join
SELECT v.vehicle_id, v.v_status, r.reservation_id, r.reservation_status
FROM Vehicle v
LEFT OUTER JOIN Reservation r ON v.vehicle_id = r.vehicle_id;


#Query 5: Give the name, email and mobile of all customers who have purchased the most expensive vehicle.
#nested query
SELECT C.c_name, C.c_email, C.c_mobile
FROM Customer C
INNER JOIN SalesOrder S ON C.Customer_ID = S.Customer_ID
INNER JOIN Vehicle V ON S.vehicle_id = V.vehicle_id
WHERE V.v_price = (SELECT MAX(v_price) FROM Vehicle);


#Query 6: Retrieve vehicle and it's make, model whose atleast 1 service is completed
#exists query
SELECT Vehicle.vehicle_id, Vehicle.v_make, Vehicle.v_model
FROM Vehicle
WHERE EXISTS (
    SELECT 1
    FROM Services
    WHERE Services.vehicle_id = Vehicle.vehicle_id
      AND Services.sv_status = 'Completed'
);


#Query 7: Find vehicles whose total payment received are above the average payment value across all sales 
#co-related query
SELECT V.vehicle_id, V.v_model, V.v_price
FROM Vehicle V
WHERE (
    SELECT SUM(P.p_amount)
    FROM SalesOrder S
    INNER JOIN Payment P ON S.sales_id = P.sales_id
    WHERE S.vehicle_id = V.vehicle_id
) > (
    SELECT AVG(P2.p_amount)
    FROM Payment P2
);


#Query 8: Find vehicles that have been reserved on any reservation date before '07/01/2024'
# ANY query
SELECT V.vehicle_id, V.v_model, V.v_make
FROM Vehicle V
WHERE V.vehicle_id = ANY (
    SELECT R.vehicle_id
    FROM Reservation R
    WHERE R.reservation_date < '07/01/2024'
);


#Query 9: List all sales orders with the number of vehicles sold in each order as an additional column
#subquery in select clause
SELECT S.sales_id, 
       S.s_price, 
       (SELECT COUNT(V.vehicle_id) 
        FROM Vehicle V 
        WHERE V.vehicle_id = S.vehicle_id) AS NumberOfVehicles
FROM SalesOrder S;


#Query 10: Combine customers who have either made a reservation or purchased a vehicle.
#Union query
SELECT C.customer_id, C.c_name, 'Reservation' AS InteractionType
FROM Customer C
INNER JOIN Reservation R ON C.customer_id = R.customer_id
UNION
SELECT C.customer_id, C.c_name, 'SalesOrder' AS InteractionType
FROM Customer C
INNER JOIN SalesOrder S ON C.customer_id = S.customer_id;


