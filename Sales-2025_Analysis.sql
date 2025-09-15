-- Create Sales Database
CREATE DATABASE sales;

-- Create Sales_DB Table
create table sales_db(
Invoice_Id int primary key,
InvoiceNo VARCHAR(25),
InvoiceDate DATE,
PtyName	VARCHAR(100),
ConName	VARCHAR(100),
Sites VARCHAR(25),	
Tax_Form VARCHAR(25),
Godown	VARCHAR(25),
TotReels INT,
TotWeight FLOAT,
Rate FLOAT,
Partycity VARCHAR(100),
Concity VARCHAR(100),
PtyGSTin VARCHAR(25),	
Transporter VARCHAR(100)
);

-- FEATCH TOP 10 RECORDS 
SELECT * FROM SALES_DB LIMIT 10;

-- FEATCH COUNT THE NUMBER OF ENTRY
SELECT COUNT(*) FROM SALES_DB;

-- DATA Cleaning for all columns check null values
SELECT * FROM SALES_dB WHERE
INVOICE_ID IS NULL OR
INVOICENO IS NULL OR
PTYNAME IS NULL OR
CONNAME IS NULL OR
CONCITY IS NULL OR
PTYGSTIN IS NULL OR
TRANSPORTER IS NULL;

-- How many sales we have?
SELECT ROUND(SUM(TOTWEIGHT)) FROM SALES_DB; 

-- How many uniuque party's we have ?
SELECT COUNT(DISTINCT PTYNAME) FROM SALES_DB;

-- Which city has maximum party's ?
SELECT partycity, COUNT(DISTINCT PTYNAME) AS PARTY_COUNT FROM sales_db 
GROUP BY partycity ORDER BY PARTY_COUNT DESC LIMIT 1;

-- Which Party has maximum Consignee's ?
SELECT PTYNAME, COUNT(DISTINCT CONNAME) AS CON_COUNT FROM sales_db 
GROUP BY PTYNAME ORDER BY CON_COUNT DESC LIMIT 1;

-- Q.1 Write a SQL query to retrieve all columns for sales made on Month of May
SELECT * FROM SALES_DB WHERE INVOICEDATE BETWEEN '2025-05-01' AND '2025-05-30';
-- Q.2 Write a SQL query to cou how many sales we have in may month
SELECT ROUND(SUM(TOTWEIGHT)) FROM SALES_DB WHERE INVOICEDATE BETWEEN '2025-05-01' AND '2025-05-30';

-- Q.3 Write a SQL query to find out how many unique party's we have in may month
SELECT COUNT(DISTINCT PTYNAME) FROM SALES_DB WHERE INVOICEDATE BETWEEN '2025-05-01' AND '2025-05-30';
-- Q.4 Which city has maximum party's in may month
SELECT partycity, COUNT(DISTINCT PTYNAME) AS PARTY_COUNT FROM sales_db 
WHERE INVOICEDATE BETWEEN '2025-05-01' AND '2025-05-30' GROUP BY partycity ORDER BY PARTY_COUNT DESC LIMIT 1;

-- Q.5 Which Party has maximum Consignee's in may month
SELECT PTYNAME, COUNT(DISTINCT CONNAME) AS CON_COUNT FROM sales_db 
WHERE INVOICEDATE BETWEEN '2025-05-01' AND '2025-05-30' GROUP BY PTYNAME ORDER BY CON_COUNT DESC LIMIT 1;

-- Q.6 Write a SQL query to retrieve all columns for sales made on Month of June
SELECT * FROM SALES_DB WHERE INVOICEDATE BETWEEN '2025-06-01' AND '2025-06-30';
-- Q.7 Write a SQL query to cou how many sales we have in june month   
SELECT ROUND(SUM(TOTWEIGHT)) FROM SALES_DB WHERE INVOICEDATE BETWEEN '2025-06-01' AND '2025-06-30';

-- Q.8 Write a SQL query to calculate total sales amount
SELECT ptyname, ROUND(SUM(TOTWEIGHT * RATE)) FROM SALES_DB
GROUP BY ptyname ORDER BY ROUND(SUM(TOTWEIGHT * RATE)) DESC;

-- Q.9 Write a SQL query to calculate total sales amount month wise 
SELECT to_char(INVOICEDATE, 'month') AS SALE_MONTH, ROUND(SUM(TOTWEIGHT * RATE)) AS TOTAL_SALES_AMOUNT
FROM SALES_DB
GROUP BY SALE_MONTH ORDER BY SALE_MONTH;
-- Q.10 Write a SQL query to calculate total sales amount party wise
SELECT ptyname, ROUND(SUM(TOTWEIGHT * RATE)) AS TOTAL_SALES_AMOUNT
FROM SALES_DB
GROUP BY ptyname ORDER BY TOTAL_SALES_AMOUNT DESC;

-- Q.11 Write a SQL query to calculate total sales amount city wise
SELECT partycity, ROUND(SUM(TOTWEIGHT * RATE)) AS TOTAL_SALES_AMOUNT
FROM SALES_DB
GROUP BY partycity ORDER BY TOTAL_SALES_AMOUNT DESC;
-- Q.12 Write a SQL query to calculate total sales amount month and party wise
SELECT to_char(INVOICEDATE, 'month') AS SALE_MONTH, ptyname, ROUND(SUM(TOTWEIGHT * RATE)) AS TOTAL_SALES_AMOUNT
FROM SALES_DB
GROUP BY SALE_MONTH, ptyname ORDER BY SALE_MONTH, TOTAL_SALES_AMOUNT DESC;

-- Q.13 Write a SQL query to calculate total sales amount month and city wise
SELECT to_char(INVOICEDATE, 'month') AS SALE_MONTH, partycity, ROUND(SUM(TOTWEIGHT * RATE)) AS TOTAL_SALES_AMOUNT
FROM SALES_DB
GROUP BY SALE_MONTH, partycity ORDER BY SALE_MONTH, TOTAL_SALES_AMOUNT DESC;

