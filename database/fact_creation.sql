USE gravity_books_DWH;
GO

CREATE TABLE fact_orderline (
    orderline_sk BIGINT IDENTITY(1,1) PRIMARY KEY,

    -- Foreign Keys
    date_sk INT NOT NULL,
    book_sk INT NOT NULL,
    customer_sk INT NOT NULL,
    shipping_sk INT NOT NULL,
    status_sk INT NOT NULL,

    -- Degenerate Dimensions
    order_id INT NOT NULL,
    line_id INT NOT NULL,

    -- Measures
    price DECIMAL(10,2) NOT NULL,
    quantity INT NOT NULL,

    -- Derived Measure (optional but recommended)
    total_amount AS (price * quantity) PERSISTED
);
GO
ALTER TABLE fact_orderline
ADD CONSTRAINT FK_fact_date
FOREIGN KEY (date_sk) REFERENCES DimDate(DateSK);

ALTER TABLE fact_orderline
ADD CONSTRAINT FK_fact_book
FOREIGN KEY (book_sk) REFERENCES dim_book(book_sk);

ALTER TABLE fact_orderline
ADD CONSTRAINT FK_fact_customer
FOREIGN KEY (customer_sk) REFERENCES dim_customer(customer_sk);

ALTER TABLE fact_orderline
ADD CONSTRAINT FK_fact_shipping
FOREIGN KEY (shipping_sk) REFERENCES dim_shipping(shipping_sk);

ALTER TABLE fact_orderline
ADD CONSTRAINT FK_fact_status
FOREIGN KEY (status_sk) REFERENCES dim_orderstatus(status_sk);

ALTER TABLE fact_orderline DROP COLUMN total_amount;
GO

ALTER TABLE fact_orderline DROP COLUMN quantity;
GO

ALTER TABLE fact_orderline 
ALTER COLUMN quantity INT NULL; 

ALTER TABLE fact_orderline 
ADD total_amount AS (price * quantity) PERSISTED;
GO
ALTER TABLE fact_orderline NOCHECK CONSTRAINT FK_fact_date;