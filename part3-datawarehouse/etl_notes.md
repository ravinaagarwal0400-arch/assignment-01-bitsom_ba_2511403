# ETL Decisions

# Decision 1 — Standardizing Date Formats

Problem:
The raw dataset contained inconsistent date formats (e.g., DD-MM-YYYY, YYYY/MM/DD). This makes aggregation and joins unreliable.

Resolution:
All dates were converted into a standard ISO format (YYYY-MM-DD). Additionally, a separate dim_date table was created to enable time-based analysis such as monthly and quarterly reporting.

# Decision 2 — Handling NULL Values

Problem:
Certain fields (e.g., quantity or total_amount) had NULL values, which could distort aggregate calculations like total revenue.

Resolution:

NULL numeric values were either:
Replaced with 0 where appropriate, or
Rows were excluded if critical data was missing
NOT NULL constraints were enforced in the fact table to maintain data integrity

# Decision 3 — Normalizing Category Casing

Problem:
Product categories appeared in inconsistent formats such as electronics, Electronics, ELECTRONICS.

Resolution:
All category values were standardized to proper case (e.g., Electronics, Clothing, Groceries) before loading into dim_product. This ensures accurate grouping and prevents duplicate category buckets during analysis.