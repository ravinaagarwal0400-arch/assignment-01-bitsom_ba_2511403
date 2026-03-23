## Anomaly Analysis

1. Insert Anomaly

In a flat table, we cannot insert a new product or customer unless an order exists.

Example:

Suppose we want to add a new product Product_X but no order has been placed yet.
Since the table is order-driven, there is no row to store product details independently.

Columns involved: product_id, product_name, price
Issue: Product data depends on order existence

2. Update Anomaly

Customer or product information is duplicated across multiple rows.

Example:

Customer CUST006 appears in multiple rows (e.g., ORD2013, ORD2021, ORD2026, ORD2055)
If their city changes, we must update multiple rows

Columns involved: customer_id, customer_name, city
Issue: Risk of inconsistent updates (some rows updated, others not)

3. Delete Anomaly

Deleting an order can unintentionally delete important data.

Example:

If order ORD2001 (only order for a product/customer) is deleted
We lose:
Customer details
Product details

Columns involved: Entire row
Issue: Loss of independent entity data


## Normalization Justification

Keeping all data in a single denormalized table may appear simpler initially, but it introduces significant data integrity and maintenance issues. In the provided dataset, customer, product, and order information are repeated across multiple rows. For instance, a customer such as CUST006 appears in several orders (ORD2013, ORD2021, ORD2026, ORD2055 ). If their city or contact details change, the update must be applied to multiple rows, increasing the risk of inconsistencies—this is a classic update anomaly.

Similarly, the structure prevents independent insertion of entities. A new product cannot be added unless it is associated with an order, demonstrating an insert anomaly. This restricts business operations such as catalog management.

Deletion anomalies are equally problematic. If an order is deleted and it happens to be the only record containing a particular product or customer, all associated information is lost. This results in unintended data loss beyond the intended deletion scope.

Normalization to Third Normal Form (3NF) eliminates these issues by decomposing the data into logically distinct tables such as customers, products, orders, and order_items. Each table represents a single entity, ensuring that updates occur in one place, insertions are independent, and deletions do not cascade unintentionally.

While normalization introduces more tables and joins, it significantly improves data integrity, scalability, and maintainability. Therefore, the argument that normalization is over-engineering does not hold in systems where data accuracy and consistency are critical.