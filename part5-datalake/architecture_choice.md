## Architecture Recommendation

For a fast-growing food delivery startup handling diverse data types such as GPS logs, customer reviews, payment transactions, and menu images, I would strongly recommend a Data Lakehouse architecture.

First, the system deals with highly heterogeneous data—structured (transactions), semi-structured (JSON logs), and unstructured (images, text reviews). A traditional Data Warehouse is optimized only for structured data and would struggle with this diversity. A Data Lakehouse, on the other hand, supports all formats in a unified storage layer.

Second, the startup requires both real-time analytics and reliable reporting. Data Lakes provide scalability but lack strong consistency and governance, while Data Warehouses provide ACID guarantees but are less flexible. A Lakehouse combines both by enabling ACID transactions on top of scalable object storage using formats like Delta Lake or Apache Iceberg.

Third, the business likely needs advanced analytics and machine learning, such as route optimization, fraud detection, and sentiment analysis on reviews. A Lakehouse architecture allows direct access to raw and processed data for data scientists without requiring complex ETL pipelines.

Additionally, as the company scales, the ability to perform schema evolution and incremental processing becomes critical. Lakehouses support these capabilities while maintaining performance through indexing and caching.

In summary, a Data Lakehouse provides the optimal balance of scalability, flexibility, and reliability required for a modern, data-intensive platform, making it the most suitable choice over a pure Data Warehouse or Data Lake.