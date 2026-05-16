DROP TABLE IF EXISTS orders;

CREATE TABLE orders (
    type VARCHAR(50),
    days_for_shipping_real INTEGER,
    days_for_shipment_scheduled INTEGER,
    benefit_per_order NUMERIC,
    sales_per_customer NUMERIC,
    delivery_status VARCHAR(50),
    late_delivery_risk INTEGER,
    category_id INTEGER,
    category_name VARCHAR(100),
    customer_city VARCHAR(100),
    customer_country VARCHAR(100),
    customer_email VARCHAR(150),
    customer_fname VARCHAR(100),
    customer_id INTEGER,
    customer_lname VARCHAR(100),
    customer_password VARCHAR(150),
    customer_segment VARCHAR(50),
    customer_state VARCHAR(100),
    customer_street VARCHAR(200),
    customer_zipcode NUMERIC,
    department_id INTEGER,
    department_name VARCHAR(100),
    latitude NUMERIC,
    longitude NUMERIC,
    market VARCHAR(100),
    order_city VARCHAR(100),
    order_country VARCHAR(100),
    order_customer_id INTEGER,
    order_date TIMESTAMP,
    order_id INTEGER,
    order_item_cardprod_id INTEGER,
    order_item_discount NUMERIC,
    order_item_discount_rate NUMERIC,
    order_item_id INTEGER,
    order_item_product_price NUMERIC,
    order_item_profit_ratio NUMERIC,
    order_item_quantity INTEGER,
    sales NUMERIC,
    order_item_total NUMERIC,
    order_profit_per_order NUMERIC,
    order_region VARCHAR(100),
    order_state VARCHAR(100),
    order_status VARCHAR(50),
    order_zipcode NUMERIC,
    product_card_id INTEGER,
    product_category_id INTEGER,
    product_description TEXT,
    product_image TEXT,
    product_name VARCHAR(200),
    product_price NUMERIC,
    product_status INTEGER,
    shipping_date TIMESTAMP,
    shipping_mode VARCHAR(50)
);

COPY orders
FROM 'C:\Users\saifm\OneDrive\Desktop\supply-chain-delay-analysis\DataCoSupplyChainDataset.csv'
WITH (
    FORMAT CSV,
    HEADER TRUE,
    ENCODING 'LATIN1'
);

SELECT count(*) as total_orders
from orders;