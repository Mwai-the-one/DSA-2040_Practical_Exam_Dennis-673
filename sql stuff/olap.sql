-- SQLite
-- Querries
-- Rollup-  total sales grouped by country and quarter
SELECT 
    Country,
    -- Manual Quarter Calculation: Year + "-Q" + ((Month + 2) / 3)
    STRFTIME('%Y', InvoiceDate) || '-Q' || ((CAST(STRFTIME('%m', InvoiceDate) AS INT) + 2) / 3) AS Quarter,
    SUM(TotalPrice) AS TotalSales
FROM OnlineRetail
GROUP BY Quarter, Country
ORDER BY Quarter


-- Drilll down- united kingdom orders by month
SELECT 
    SUM(TotalPrice) AS MonthlySales,
    STRFTIME('%Y-%m', DATETIME(InvoiceDate)) AS Month
FROM  OnlineRetail
WHERE Country = 'United Kingdom'
GROUP BY Month


-- how many uk customers monthly in 2011
SELECT DISTINCT COUNT(CustomerID) AS MonthlyCustomers,
    STRFTIME('%Y-%m', DATETIME(InvoiceDate)) AS Month
FROM  OnlineRetail
WHERE Country = 'United Kingdom' AND STRFTIME('%Y', InvoiceDate) = '2011'
GROUP BY Month


-- slice- due to lack of category column in product_dim table, we will slice based on product names containing 'bag'
select SUM(TotalPrice) AS BagSales, Description
From OnlineRetail  
WHERE Description LIKE '%bag%'

-- Visits monthly trend

SELECT 
    STRFTIME('%Y-%m', DATETIME(InvoiceDate)) AS Month,
    COUNT(DISTINCT InvoiceNo) AS MonthlyVisits
FROM OnlineRetail
GROUP BY Month 
ORDER BY Month