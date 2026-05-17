-- Purpose: Create clean summary views for Power BI reporting.

DROP VIEW IF EXISTS vw_late_by_shipping_mode;
DROP VIEW IF EXISTS vw_late_by_customer_segment;
DROP VIEW IF EXISTS vw_late_by_market;
DROP VIEW IF EXISTS vw_shipping_mode_market_heatmap;
DROP VIEW IF EXISTS vw_kpi_summary;

-- View 1: Late delivery performance by shipping mode
CREATE VIEW vw_late_by_shipping_mode AS
SELECT
    shipping_mode,
    COUNT(*) AS total_orders,
    SUM(late_delivery_risk) AS late_orders,
    ROUND(AVG(late_delivery_risk) * 100, 2) AS late_delivery_rate_percent,
    ROUND(AVG(delay_gap), 2) AS avg_delay_gap_days,
    ROUND(AVG(benefit_per_order), 2) AS avg_benefit_per_order
FROM orders_cleaned
WHERE delivery_status <> 'Shipping Canceled'
GROUP BY shipping_mode;


-- View 2: Late delivery performance by customer segment
CREATE VIEW vw_late_by_customer_segment AS
SELECT
    customer_segment,
    COUNT(*) AS total_orders,
    SUM(late_delivery_risk) AS late_orders,
    ROUND(AVG(late_delivery_risk) * 100, 2) AS late_delivery_rate_percent,
    ROUND(AVG(benefit_per_order), 2) AS avg_benefit_per_order
FROM orders_cleaned
WHERE delivery_status <> 'Shipping Canceled'
GROUP BY customer_segment;


-- View 3: Late delivery performance by market
CREATE VIEW vw_late_by_market AS
SELECT
    market,
    COUNT(*) AS total_orders,
    SUM(late_delivery_risk) AS late_orders,
    ROUND(AVG(late_delivery_risk) * 100, 2) AS late_delivery_rate_percent,
    ROUND(AVG(delay_gap), 2) AS avg_delay_gap_days,
    ROUND(AVG(benefit_per_order), 2) AS avg_benefit_per_order
FROM orders_cleaned
WHERE delivery_status <> 'Shipping Canceled'
GROUP BY market;


-- View 4: Heatmap-ready view for shipping mode and market
CREATE VIEW vw_shipping_mode_market_heatmap AS
SELECT
    shipping_mode,
    market,
    COUNT(*) AS total_orders,
    SUM(late_delivery_risk) AS late_orders,
    ROUND(AVG(late_delivery_risk) * 100, 2) AS late_delivery_rate_percent,
    ROUND(AVG(delay_gap), 2) AS avg_delay_gap_days
FROM orders_cleaned
WHERE delivery_status <> 'Shipping Canceled'
GROUP BY shipping_mode, market;


-- View 5: KPI summary for Power BI cards
CREATE VIEW vw_kpi_summary AS
SELECT
    COUNT(*) AS total_orders,
    SUM(late_delivery_risk) AS late_orders,
    ROUND(AVG(late_delivery_risk) * 100, 2) AS late_delivery_rate_percent,
    SUM(CASE WHEN delivery_status = 'Shipping Canceled' THEN 1 ELSE 0 END) AS cancelled_orders,
    ROUND(
        SUM(CASE WHEN delivery_status = 'Shipping Canceled' THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
        2
    ) AS cancellation_rate_percent,
    ROUND(AVG(benefit_per_order), 2) AS avg_benefit_per_order,
    SUM(negative_profit_flag) AS negative_profit_orders
FROM orders_cleaned;

SELECT * 
FROM vw_kpi_summary;

SELECT * 
FROM vw_late_by_shipping_mode;