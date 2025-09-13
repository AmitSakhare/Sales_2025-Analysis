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
