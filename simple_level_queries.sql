-- customers
-- 01 How many customers do we have per country?
SELECT
    country,
    COUNT(customerid) AS total_customers
FROM
    customers
GROUP BY
    country
ORDER BY
    country ASC;
-- 02 Which country has the most customers?
SELECT
    country,
    COUNT(customerid) AS total_customers
FROM
    customers
GROUP BY
    country
ORDER BY
    total_customers DESC
LIMIT
    1;
-- 03 How many customers registered each year?
SELECT
    EXTRACT(
        YEAR
        FROM
            registrationdate
    ) AS year_registration,
    COUNT(customerid) AS total_customers
FROM
    customers
GROUP BY
    year_registration
ORDER BY
    year_registration ASC;
-- 04 Who are our 3 newest customers?
SELECT
    CONCAT (
        firstname,
        ' ',
        lastname
    ) AS customer_name,
    country,
    registrationdate
FROM
    customers
ORDER BY
    registrationdate DESC
LIMIT
    3;
-- 05 Which customers have never placed an order?
SELECT
    CONCAT (
        firstname,
        ' ',
        lastname
    ) AS full_name,
    country,
    registrationdate
FROM
    customers
WHERE
    customerid NOT IN (
        SELECT
            customerid
        FROM
            orders
    );
-- 06 Which customers registered in 2023, and where are they from?
SELECT
    CONCAT (
        firstname,
        ' ',
        lastname
    ) AS customer_full_name,
    country,
    EXTRACT(
        YEAR
        FROM
            registrationdate
    ) AS year_registration
FROM
    customers
WHERE
    EXTRACT(
        YEAR
        FROM
            registrationdate
    ) = '2023';
-- products
    -- 07 What is the average price per product category?
SELECT
    category,
    ROUND(AVG(price), 2) AS avg_price
FROM
    products
GROUP BY
    category
ORDER BY
    avg_price DESC;
-- 08 Which product has the highest price?
SELECT
    productname,
    category,
    price
FROM
    products
ORDER BY
    price DESC
LIMIT
    1;
-- 09 How many products do we have in each category?
SELECT
    category,
    COUNT(productid) AS total_products
FROM
    products
GROUP BY
    category
ORDER BY
    total_products DESC;
-- 10 Which products are running low on stock (below 40 units)?
SELECT
    productname,
    category,
    price,
    stock
FROM
    products
WHERE
    stock < 40
ORDER BY
    stock ASC;
-- 11 What is the total inventory value per category?
SELECT
    category,
    SUM(
        price * stock
    ) AS inventory_value
FROM
    products
GROUP BY
    category
ORDER BY
    inventory_value DESC;
-- 12 Can we label each product as Expensive, Moderate, or Budget?
SELECT
    productname,
    category,
    price,
    CASE
        WHEN price > 500 THEN 'Expensive'
        WHEN price BETWEEN 100
        AND 500 THEN 'Moderate'
        ELSE 'Budget'
    END AS price_label
FROM
    products
ORDER BY
    price DESC;
-- Orders
    -- 13 What is the total revenue generated from all orders (quantity * price)?
SELECT
    SUM(
        p.price * o.quantity
    ) AS total_revenue
FROM
    orders o
    JOIN products p
    ON p.productid = o.productid;
-- 14 How many orders were placed each month in 2023?
SELECT
    EXTRACT(
        MONTH
        FROM
            orderdate
    ) AS MONTH,
    COUNT(orderid) AS total_orders
FROM
    orders
WHERE
    EXTRACT(
        YEAR
        FROM
            orderdate
    ) = 2023
GROUP BY
    1
ORDER BY
    MONTH;
-- 15 Which customer has spent the most money overall?
SELECT
    CONCAT (
        C.firstname,
        ' ',
        C.lastname
    ) AS full_name,
    C.country,
    SUM(
        p.price * o.quantity
    ) AS total_spent
FROM
    customers C
    JOIN orders o
    ON C.customerid = o.customerid
    JOIN products p
    ON p.productid = o.productid
GROUP BY
    C.customerid,
    C.firstname,
    C.lastname,
    C.country
ORDER BY
    total_spent DESC
LIMIT
    1;
--16 What is our best-selling product by quantity?
SELECT
    p.productname,
    p.category,
    SUM(
        o.quantity
    ) AS total_quantity_sold
FROM
    products p
    JOIN orders o
    ON p.productid = o.productid
GROUP BY
    p.productid,
    p.productname,
    p.category
ORDER BY
    total_quantity_sold DESC
LIMIT
    1;
--17 Which product category generates the most revenue?
SELECT
    p.category,
    SUM(
        p.price * o.quantity
    ) AS total_revenue
FROM
    products p
    JOIN orders o
    ON p.productid = o.productid
GROUP BY
    p.category
ORDER BY
    total_revenue DESC
LIMIT
    1;
--Advanced (multi-table)
    --18 Show each customer's name, products bought, and total spend per order.
SELECT
    CONCAT (
        C.firstname,
        ' ',
        C.lastname
    ) AS full_name,
    p.productname,
    o.quantity,
    p.price,
    (
        p.price * o.quantity
    ) AS order_total
FROM
    customers C
    JOIN orders o
    ON C.customerid = o.customerid
    JOIN products p
    ON p.productid = o.productid
ORDER BY
    order_total DESC;
--19 Which countries generate the most revenue (over $500)?
SELECT
    C.country,
    SUM(
        p.price * o.quantity
    ) AS total_revenue
FROM
    customers C
    JOIN orders o
    ON C.customerid = o.customerid
    JOIN products p
    ON p.productid = o.productid
GROUP BY
    C.country
HAVING
    SUM(
        p.price * o.quantity
    ) > 500
ORDER BY
    total_revenue DESC;
--20 How many orders has each customer placed, including those with zero orders?
SELECT
    CONCAT (
        C.firstname,
        ' ',
        C.lastname
    ) AS full_name,
    C.country,
    COUNT(
        o.orderid
    ) AS total_orders
FROM
    customers C
    LEFT JOIN orders o
    ON C.customerid = o.customerid
GROUP BY
    C.customerid,
    C.firstname,
    C.lastname,
    C.country
ORDER BY
    total_orders DESC;
-- 21 Are there any products that have never been ordered?
SELECT
    productname,
    category,
    price,
    stock
FROM
    products
WHERE
    productid NOT IN (
        SELECT
            productid
        FROM
            orders
    );
-- 22 What is the average order value per country?
SELECT
    C.country,
    ROUND(AVG(p.price * o.quantity), 2) AS avg_order_value
FROM
    customers C
    JOIN orders o
    ON C.customerid = o.customerid
    JOIN products p
    ON p.productid = o.productid
GROUP BY
    C.country
ORDER BY
    avg_order_value DESC;
