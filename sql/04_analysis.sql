-- Purpose: Answer key business questions about delivery delays using the cleaned orders view.

-- Q1: Late delivery rate by shipping mode — which shipping mode fails most?
SELECT
    shipping_mode,
    COUNT(*) AS total_orders,
    SUM(late_delivery_risk) AS late_orders,
    ROUND(AVG(late_delivery_risk) * 100, 2) AS late_delivery_rate_percent
FROM orders_cleaned
WHERE delivery_status <> 'Shipping Canceled'
GROUP BY shipping_mode
ORDER BY late_delivery_rate_percent DESC;


-- Q2: Late delivery rate by customer segment — are some customer groups affected more than others?
SELECT
    customer_segment,
    COUNT(*) AS total_orders,
    SUM(late_delivery_risk) AS late_orders,
    ROUND(AVG(late_delivery_risk) * 100, 2) AS late_delivery_rate_percent
FROM orders_cleaned
WHERE delivery_status <> 'Shipping Canceled'
GROUP BY customer_segment
ORDER BY late_delivery_rate_percent DESC;


-- Q3: Late delivery rate by market — where geographically are delays worst?
SELECT
    market,
    COUNT(*) AS total_orders,
    SUM(late_delivery_risk) AS late_orders,
    ROUND(AVG(late_delivery_risk) * 100, 2) AS late_delivery_rate_percent
FROM orders_cleaned
WHERE delivery_status <> 'Shipping Canceled'
GROUP BY market
ORDER BY late_delivery_rate_percent DESC;


-- Q4: Average delay gap by shipping mode — not just late/not late, but how far off is the actual shipping time from the scheduled time?
SELECT
    shipping_mode,
    COUNT(*) AS total_orders,
    ROUND(AVG(delay_gap), 2) AS avg_delay_gap_days,
    MIN(delay_gap) AS min_delay_gap_days,
    MAX(delay_gap) AS max_delay_gap_days
FROM orders_cleaned
WHERE delivery_status <> 'Shipping Canceled'
GROUP BY shipping_mode
ORDER BY avg_delay_gap_days DESC;


-- Q5: Profit impact — what is the average profit per order for late vs non-late shipments?
SELECT
    CASE
        WHEN late_delivery_risk = 1 THEN 'Late Delivery'
        ELSE 'Not Late'
    END AS delivery_group,
    COUNT(*) AS total_orders,
    ROUND(AVG(benefit_per_order), 2) AS avg_benefit_per_order,
    ROUND(SUM(benefit_per_order), 2) AS total_benefit
FROM orders_cleaned
WHERE delivery_status <> 'Shipping Canceled'
GROUP BY delivery_group
ORDER BY avg_benefit_per_order DESC;


-- Q6: Negative profit orders by delivery group — are late deliveries more likely to lose money?
SELECT
    CASE
        WHEN late_delivery_risk = 1 THEN 'Late Delivery'
        ELSE 'Not Late'
    END AS delivery_group,
    COUNT(*) AS total_orders,
    SUM(negative_profit_flag) AS negative_profit_orders,
    ROUND(AVG(negative_profit_flag) * 100, 2) AS negative_profit_rate_percent
FROM orders_cleaned
WHERE delivery_status <> 'Shipping Canceled'
GROUP BY delivery_group
ORDER BY negative_profit_rate_percent DESC;