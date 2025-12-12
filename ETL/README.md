### 🛒 Project Title: E-commerce Data Warehousing ETL Pipeline
Extract, Transform, and Load (ETL) Process for the Online Retail Dataset into a Star Schema
##  Overview

This project implements a robust ETL pipeline designed to ingest raw transactional data from the "Online Retail" dataset (a large e-commerce transaction log) and prepare it for analytical querying. The pipeline performs extensive data cleaning, transformation, and filtering before loading the data into an SQLite database.

The core output of this project is the construction of a simple Star Schema—composed of a central Sales Fact Table and related Customer and Product Dimension Tables—ready for efficient analytical querying and reporting.
## 🎯 Project Goals

    Extraction: Read the large "Online Retail" dataset from its original Excel format.

    Transformation: Perform comprehensive data cleaning, handle missing values and duplicates, filter irrelevant/cancelled transactions, apply feature engineering (calculate TotalPrice), and filter the data to focus on a specific time period (2011 transactions).

    Loading: Save the cleaned data locally as a CSV file to improve subsequent read performance, and then load it into an SQLite database.

    Data Modeling: Query the database to construct three essential tables for a star schema:

        Sales_fact (Fact Table)

        Customer_dim (Dimension Table)

        Product_dim (Dimension Table)

## ⚙️ Technology Stack

The pipeline utilizes core Python libraries for data processing and database interaction:

    Data Handling: Pandas and NumPy.

    Database: sqlite3 (Python's built-in library for SQLite).

## 🚀 Detailed ETL Methodology

The entire process is encapsulated in the etl_process function, ensuring the data moves sequentially through the required stages.
# 1. Data Cleaning (data_cleaning function)

The initial cleaning phase focuses on ensuring data quality and addressing fundamental issues:

    Missing Values:

        Missing CustomerID values were imputed with 0. This placeholder allows us to retain the transactional data for trend analysis while isolating non-customer transactions.

        Rows with missing Description values were dropped, as this field is crucial for product identification and cannot be reliably imputed.

    Duplicates: All exact duplicate rows across all columns were identified and removed, retaining only the first instance of each transaction.

# 2. Data Transformation (data_transformations function)

This phase prepares the data for analysis by creating new features and applying necessary filters:

    Feature Engineering: A new analytical column, TotalPrice, was calculated as the product of Quantity and UnitPrice.

    Date Formatting: The InvoiceDate column was converted to a proper datetime object for accurate time-based filtering.

    Outlier/Cancellation Handling: Transactions with non-positive values for Quantity or UnitPrice were removed. These entries typically represent cancelled orders (often indicated by negative quantity) or data errors, which would skew sales analysis.

    Time Filtering: The data was filtered to retain only records spanning the year 2011, focusing the analysis on the most recent complete period.

# 3. Data Persistence (CSV and SQLite)

To optimize the subsequent database loading and future querying, the data underwent a two-step persistence process:

    CSV Conversion: The cleaned and transformed DataFrame was saved as a local CSV file. This significantly reduces the runtime required to read the data compared to repeatedly accessing the large Excel file.

    SQLite Loading: An SQLite database file (OnlineRetail.db) was created and a connection was established. The final, clean DataFrame was loaded directly into this database as the table OnlineRetail.

# 4. Data Modeling: Creating the Star Schema (querries function)

Once the master table (OnlineRetail) was loaded into the database, standard SQL queries were executed via Pandas' pd.read_sql_query to extract the components of the Star Schema.

Getty Images

    Sales Fact Table (Sales_fact): This is the central table containing quantitative, measurable data.

        Columns: InvoiceNo, CustomerID, StockCode, TotalPrice, and InvoiceDate.

    Customer Dimension Table (Customer_dim): This table contains attributes describing the customer.

        Columns: Distinct CustomerID and Country. (Rows with CustomerID=0 were excluded here as they are not identifiable customers).

    Product Dimension Table (Product_dim): This table contains descriptive information about the products.

        Columns: Distinct StockCode, Description, and UnitPrice.

The resulting Fact and Dimension tables were successfully printed for confirmation and saved as individual CSV files for easy access by other analytical tools.
#  Future Work

    RFM Analysis: Use the Sales_fact and Customer_dim tables to perform Recency, Frequency, and Monetary (RFM) analysis for customer segmentation.

    Advanced Data Cleaning: Incorporate fuzzy matching to standardize product descriptions (e.g., handling slight variations in spelling).

    Visualization Layer: Connect the final dimension tables to a BI tool (e.g., Tableau, Power BI) or use visualization libraries (e.g., Seaborn, Matplotlib) to create dashboards showcasing top-selling products, geographical sales, and monthly trends.