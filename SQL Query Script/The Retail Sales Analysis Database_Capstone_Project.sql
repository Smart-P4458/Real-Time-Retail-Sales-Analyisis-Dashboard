SELECT * FROM retail.dim_product;

---Running some basic but important tests--

---TEST 1 — Dimension Row Counts (Basic Health Check)
SELECT 'dim_customer' AS table, COUNT(*) AS rows FROM retail.dim_customer
UNION ALL
SELECT 'dim_product', COUNT(*) FROM retail.dim_product
UNION ALL
SELECT 'dim_store', COUNT(*) FROM retail.dim_store
UNION ALL
SELECT 'dim_date', COUNT(*) FROM retail.dim_date
UNION ALL
SELECT 'dim_promotion', COUNT(*) FROM retail.dim_promotion
UNION ALL
SELECT 'dim_payment_method', COUNT(*) FROM retail.dim_payment_method;

---TEST 2 — Fact Table Count
SELECT COUNT(*) AS fact_row_count
FROM retail.fact_sales;

---TEST 3 — Check for Orphan Customers (Fact → Customer FK)---
SELECT COUNT(*) AS missing_customer_fk
FROM retail.fact_sales f
LEFT JOIN retail.dim_customer d
    ON f.customer_id = d.customer_id
WHERE d.customer_id IS NULL;

---TEST 4 — Check for Orphan Products (Fact → Product FK)---
SELECT COUNT(*) AS missing_product_fk
FROM retail.fact_sales f
LEFT JOIN retail.dim_product p
    ON f.product_id = p.product_id
WHERE p.product_id IS NULL;

---TEST 5 — Check for Orphan Stores (Fact → Store FK)---
SELECT COUNT(*) AS missing_store_fk
FROM retail.fact_sales f
LEFT JOIN retail.dim_store s
    ON f.store_id = s.store_id
WHERE s.store_id IS NULL;

---TEST 6 — Check for Orphan Dates (Fact → Date FK)---
SELECT COUNT(*) AS missing_date_fk
FROM retail.fact_sales f
LEFT JOIN retail.dim_date d
    ON f.date_id = d.date_id
WHERE d.date_id IS NULL;

---TEST 7 — Check for Orphan Promotions (Fact → Promotion FK)---
SELECT COUNT(*) AS missing_promotion_fk
FROM retail.fact_sales f
LEFT JOIN retail.dim_promotion p
    ON f.promotion_id = p.promotion_id
WHERE p.promotion_id IS NULL;

---TEST 8 — Check for Orphan Payment Methods (Fact → PaymentMethod FK)---
SELECT COUNT(*) AS missing_payment_method_fk
FROM retail.fact_sales f
LEFT JOIN retail.dim_payment_method pm
    ON f.payment_method_id = pm.payment_method_id
WHERE pm.payment_method_id IS NULL;


---Answering some Real_World Business Questions with my new uploaded tables from Python---

--- Question 1. Which store has highest total revenue---
SELECT s.store_id, s.city, s.store_type, SUM(f.quantity * f.revenue) AS total_revenue
FROM retail.fact_sales f
JOIN retail.dim_store s ON f.store_id = s.store_id
GROUP BY s.store_id, s.city, s.store_type
ORDER BY total_revenue DESC
LIMIT 1;

---Question 2. What are the Top 5 Cities by Revenue?---
SELECT s.city, SUM(f.quantity * f.revenue) AS city_revenue
FROM retail.fact_sales f
JOIN retail.dim_store s ON f.store_id = s.store_id
GROUP BY s.city
ORDER BY city_revenue DESC
LIMIT 5;

---Question 3. Store type with highest average transaction revenue---
SELECT s.store_type, ROUND(AVG(f.quantity * f.revenue)::numeric,2) AS avg_revenue
FROM retail.fact_sales f
JOIN retail.dim_store s ON f.store_id = s.store_id
GROUP BY s.store_type
ORDER BY avg_revenue DESC;

---Question 4. Monthly revenue trend per store---
SELECT s.store_id, s.city, d.year, d.month, SUM(f.quantity * f.revenue) AS monthly_revenue
FROM retail.fact_sales f
JOIN retail.dim_store s ON f.store_id = s.store_id
JOIN retail.dim_date d ON f.date_id = d.date_id
GROUP BY s.store_id, s.city, d.year, d.month
ORDER BY d.year, d.month, monthly_revenue DESC;

---Question 5. Product category revenue per store type---
SELECT s.store_type, SUM(f.quantity * f.revenue) AS revenue
FROM retail.fact_sales f
JOIN retail.dim_store s ON f.store_id = s.store_id
JOIN retail.dim_product p ON f.product_id = p.product_id
GROUP BY s.store_type
ORDER BY revenue DESC;

---Question 6. Top 10 customers per store---
SELECT s.store_id, c.customer_name, SUM(f.quantity * f.revenue) AS total_spent
FROM retail.fact_sales f
JOIN retail.dim_store s ON f.store_id = s.store_id
JOIN retail.dim_customer c ON f.customer_id = c.customer_id
GROUP BY s.store_id, c.customer_name
ORDER BY total_spent DESC
LIMIT 10;

---Question 7. Revenue by day of the week per store---
SELECT s.store_id, d.day, SUM(f.quantity * f.revenue) AS revenue
FROM retail.fact_sales f
JOIN retail.dim_store s ON f.store_id = s.store_id
JOIN retail.dim_date d ON f.date_id = d.date_id
GROUP BY s.store_id, d.day
ORDER BY revenue DESC;

---High-Value Customers (Spending ≥ 10,000)---
SELECT 
    c.customer_name,
    SUM(f.revenue) AS total_spent
FROM retail.fact_sales f
JOIN retail.dim_customer c
    ON f.customer_id = c.customer_id
GROUP BY c.customer_name
HAVING SUM(f.revenue) >= 10000
ORDER BY total_spent DESC;

