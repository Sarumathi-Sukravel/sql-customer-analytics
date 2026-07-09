# 🗃️ SQL Customer Analytics

A SQL-driven analytics project answering common e-commerce business questions — customer lifetime value, revenue trends, category performance, and churn — using a relational SQLite database.

## 📊 Overview

This project simulates a customer & orders database (300 customers, 2,000 orders) and answers:

- Which customer segment brings the most revenue?
- Who are the top 10 highest-value customers?
- How does monthly revenue trend over 2 years?
- Which product categories perform best?
- What's the repeat customer rate?

## 🛠️ Tech Stack

- **SQL (SQLite)**
- **Python** (sqlite3, pandas) — for running & displaying query results

## 📁 Project Structure

```
sql-customer-analytics/
├── customer_analytics.db       # SQLite database
├── queries/
│   └── analysis_queries.sql    # 7 business-question SQL queries
├── run_queries.py               # Runs all queries and prints results
└── README.md
```

## 🚀 How to Run

```bash
pip install pandas
python run_queries.py
```

Or open `customer_analytics.db` in any SQL client (DB Browser for SQLite, DBeaver) and run queries from `queries/analysis_queries.sql` directly.

## 📈 Key Queries Included

1. Revenue & orders by customer segment
2. Top 10 customers by lifetime value
3. Monthly revenue trend
4. Revenue by product category
5. City-wise customer distribution & average spend
6. Inactive customers (no orders placed)
7. Repeat customer rate

## 📌 Sample Finding

> **Groceries** and **Electronics** are the top two revenue-generating categories, while **Pune** leads in average revenue per customer — useful for regional marketing prioritization.


---
*Part of my Data Analytics portfolio — [Sarumathi Sukravel](https://github.com/Sarumathi-Sukravel)*
