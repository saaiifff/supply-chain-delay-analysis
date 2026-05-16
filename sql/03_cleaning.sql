-- Purpose: Create a cleaned analysis view without changing the raw orders table.

-- 03_cleaning.sql
-- Purpose: Create a cleaned analysis view without changing the raw orders table.

DROP VIEW IF EXISTS orders_cleaned;


CREATE VIEW orders_cleaned AS
SELECT
    type,
    days_for_shipping_real,
    days_for_shipment_scheduled,

    -- Difference between actual and scheduled shipping days
    days_for_shipping_real - days_for_shipment_scheduled AS delay_gap,

    benefit_per_order,

    -- Flag negative profit orders for investigation
    CASE
        WHEN benefit_per_order < 0 THEN 1
        ELSE 0
    END AS negative_profit_flag,

    sales_per_customer,

    -- Standardised text fields
    INITCAP(TRIM(delivery_status)) AS delivery_status,
    late_delivery_risk,

    category_id,
    INITCAP(TRIM(category_name)) AS category_name,

    INITCAP(TRIM(customer_city)) AS customer_city,
    INITCAP(TRIM(customer_country)) AS customer_country,
    customer_id,
    INITCAP(TRIM(customer_segment)) AS customer_segment,
    INITCAP(TRIM(customer_state)) AS customer_state,

    department_id,
    INITCAP(TRIM(department_name)) AS department_name,

    latitude,
    longitude,

    UPPER(TRIM(market)) AS market,

    INITCAP(TRIM(order_city)) AS order_city,
    INITCAP(TRIM(order_country)) AS order_country,
    order_customer_id,
    order_date,
    order_id,

    order_item_discount,
    order_item_discount_rate,
    order_item_id,
    order_item_product_price,
    order_item_profit_ratio,
    order_item_quantity,
    sales,
    order_item_total,
    order_profit_per_order,

    INITCAP(TRIM(order_region)) AS order_region,
    INITCAP(TRIM(order_state)) AS order_state,
    UPPER(TRIM(order_status)) AS order_status,

    product_card_id,
    product_category_id,
    INITCAP(TRIM(product_name)) AS product_name,
    product_price,
    product_status,

    shipping_date,

    CASE
        WHEN LOWER(TRIM(shipping_mode)) = 'first class' THEN 'First Class'
        WHEN LOWER(TRIM(shipping_mode)) = 'second class' THEN 'Second Class'
        WHEN LOWER(TRIM(shipping_mode)) = 'standard class' THEN 'Standard Class'
        WHEN LOWER(TRIM(shipping_mode)) = 'same day' THEN 'Same Day'
        ELSE INITCAP(TRIM(shipping_mode))
    END AS shipping_mode

FROM orders;


SELECT
    order_id,
    days_for_shipping_real,
    days_for_shipment_scheduled,
    delay_gap,
    benefit_per_order,
    negative_profit_flag,
    shipping_mode
FROM orders_cleaned
LIMIT 10;