# Database Recommendation

For a healthcare startup building a patient management system, I would recommend MySQL (Relational Database) as the primary datastore. Healthcare systems require strong guarantees around data consistency, integrity, and correctness. Patient records, prescriptions, billing, and medical histories must adhere to strict transactional reliability. MySQL follows the ACID properties—Atomicity, Consistency, Isolation, and Durability—which ensure that all transactions are processed reliably and errors do not corrupt critical data. This is essential in healthcare, where even minor inconsistencies can have serious consequences.

From a CAP theorem perspective, healthcare systems prioritize Consistency and Partition Tolerance (CP) over Availability. It is preferable for the system to delay responses rather than serve inconsistent or incorrect patient data.

MongoDB, on the other hand, follows BASE principles (Basically Available, Soft state, Eventually consistent). While it offers flexibility in schema design and scalability, its eventual consistency model may not be suitable for core healthcare operations where strict correctness is required.

However, if the system also includes a fraud detection module, my recommendation would evolve into a hybrid architecture. Fraud detection often involves ingesting large volumes of semi-structured or unstructured data (logs, behavioral patterns, transaction streams), where MongoDB or other NoSQL databases excel due to schema flexibility and horizontal scalability.

In such a case:

Use MySQL for core patient records (system of record)
Use MongoDB for analytics, fraud detection, and high-velocity data ingestion

This approach balances consistency with scalability and aligns with modern distributed system design practices.