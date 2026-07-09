
import sqlite3
import pandas as pd

conn = sqlite3.connect("customer_analytics.db")

with open("queries/analysis_queries.sql") as f:
    sql_text = f.read()

# Split into individual queries using the "-- N." comment markers
queries = [q.strip() for q in sql_text.split(";") if q.strip() and "SELECT" in q.upper()]

titles = [
    "1. Revenue & Orders by Segment",
    "2. Top 10 Customers by Lifetime Value",
    "3. Monthly Revenue Trend",
    "4. Revenue by Product Category",
    "5. City-wise Customer Distribution",
    "6. Customers With No Orders",
    "7. Repeat Customer Rate",
]

for title, q in zip(titles, queries):
    print("=" * 60)
    print(title)
    print("=" * 60)
    df = pd.read_sql_query(q, conn)
    print(df.to_string(index=False))
    print()

conn.close()
