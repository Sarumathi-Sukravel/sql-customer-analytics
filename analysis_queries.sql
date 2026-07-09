-- =====================================================
-- SQL Customer Analytics — Key Business Queries
-- Database: customer_analytics.db (SQLite)
-- Tables: customers(customer_id, name, city, signup_date, segment)
--         orders(order_id, customer_id, order_date, amount, product_category)
-- =====================================================

-- 1. Total revenue and order count by customer segment
SELECT
    c.segment,
    COUNT(o.order_id)      AS total_orders,
    ROUND(SUM(o.amount),2) AS total_revenue,
    ROUND(AVG(o.amount),2) AS avg_order_value
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.segment
ORDER BY total_revenue DESC;

-- 2. Top 10 highest-spending customers (customer lifetime value)
SELECT
    c.customer_id,
    c.name,
    c.city,
    c.segment,
    COUNT(o.order_id)      AS num_orders,
    ROUND(SUM(o.amount),2) AS lifetime_value
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id
ORDER BY lifetime_value DESC
LIMIT 10;

-- 3. Monthly revenue trend
SELECT
    strftime('%Y-%m', order_date) AS month,
    ROUND(SUM(amount),2)          AS monthly_revenue,
    COUNT(*)                      AS orders
FROM orders
GROUP BY month
ORDER BY month;

-- 4. Revenue by product category
SELECT
    product_category,
    COUNT(*)               AS orders,
    ROUND(SUM(amount),2)   AS revenue,
    ROUND(AVG(amount),2)   AS avg_order_value
FROM orders
GROUP BY product_category
ORDER BY revenue DESC;

-- 5. City-wise customer distribution and average spend
SELECT
    c.city,
    COUNT(DISTINCT c.customer_id) AS num_customers,
    ROUND(SUM(o.amount),2)        AS total_revenue,
    ROUND(SUM(o.amount) * 1.0 / COUNT(DISTINCT c.customer_id), 2) AS avg_revenue_per_customer
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.city
ORDER BY total_revenue DESC;

-- 6. Customers who never placed an order (churn/inactive candidates)
SELECT c.customer_id, c.name, c.city, c.segment
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id
WHERE o.order_id IS NULL;

-- 7. Repeat customer rate
SELECT
    ROUND(100.0 * SUM(CASE WHEN order_count > 1 THEN 1 ELSE 0 END) / COUNT(*), 2) AS repeat_customer_pct
FROM (
    SELECT customer_id, COUNT(*) AS order_count
    FROM orders
    GROUP BY customer_id
);
