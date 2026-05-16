-- Purpose: Understand the structure, completeness, and key delivery metrics of the supply chain dataset.

-- 1. Total row count
SELECT COUNT(*) AS total_orders
FROM orders;

-- 2. Distinct delivery statuses
SELECT 
    delivery_status,
    COUNT(*) AS order_count
FROM orders
GROUP BY delivery_status
ORDER BY order_count DESC;

-- 3. Distinct shipping modes
SELECT 
    shipping_mode,
    COUNT(*) AS order_count
FROM orders
GROUP BY shipping_mode
ORDER BY order_count DESC;

-- 4. Distinct customer segments
SELECT 
    customer_segment,
    COUNT(*) AS order_count
FROM orders
GROUP BY customer_segment
ORDER BY order_count DESC;

-- 5. Distinct markets
SELECT 
    market,
    COUNT(*) AS order_count
FROM orders
GROUP BY market
ORDER BY order_count DESC;

-- 6. Null checks on key columns
SELECT
    COUNT(*) - COUNT(delivery_status) AS delivery_status_nulls,
    COUNT(*) - COUNT(shipping_mode) AS shipping_mode_nulls,
    COUNT(*) - COUNT(customer_segment) AS customer_segment_nulls,
    COUNT(*) - COUNT(market) AS market_nulls,
    COUNT(*) - COUNT(late_delivery_risk) AS late_delivery_risk_nulls,
    COUNT(*) - COUNT(days_for_shipping_real) AS real_shipping_days_nulls,
    COUNT(*) - COUNT(days_for_shipment_scheduled) AS scheduled_shipping_days_nulls,
    COUNT(*) - COUNT(benefit_per_order) AS benefit_per_order_nulls
FROM orders;

-- 7. Overall late delivery rate
SELECT 
    COUNT(*) AS total_orders,
    SUM(late_delivery_risk) AS late_orders,
    ROUND(AVG(late_delivery_risk) * 100, 2) AS late_delivery_rate_percent
FROM orders
WHERE delivery_status <> 'Shipping canceled';

-- 8. Shipping days summary
SELECT
    MIN(days_for_shipping_real) AS min_real_shipping_days,
    MAX(days_for_shipping_real) AS max_real_shipping_days,
    ROUND(AVG(days_for_shipping_real), 2) AS avg_real_shipping_days,
    MIN(days_for_shipment_scheduled) AS min_scheduled_shipping_days,
    MAX(days_for_shipment_scheduled) AS max_scheduled_shipping_days,
    ROUND(AVG(days_for_shipment_scheduled), 2) AS avg_scheduled_shipping_days
FROM orders
WHERE delivery_status <> 'Shipping canceled';

-- 9. Benefit per order summary
SELECT
    MIN(benefit_per_order) AS min_benefit_per_order,
    MAX(benefit_per_order) AS max_benefit_per_order,
    ROUND(AVG(benefit_per_order), 2) AS avg_benefit_per_order
FROM orders;

-- 10. Count negative profit orders
SELECT
    COUNT(*) AS negative_profit_orders
FROM orders
WHERE benefit_per_order < 0;