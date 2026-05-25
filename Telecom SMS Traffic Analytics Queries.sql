USE sms_analytics;

-- Customer Performance Analysis
SELECT 
    c.customer_name,
    c.industry,
    SUM(s.messages_sent) AS total_messages
FROM sms_campaigns s
JOIN customers c
ON s.customer_id = c.customer_id
GROUP BY c.customer_name, c.industry
ORDER BY total_messages DESC;

-- Operator Performance Analysis
SELECT
    o.operator_name,
    o.success_rate,
    SUM(s.delivered) AS total_delivered
FROM sms_campaigns s
JOIN operators o
ON s.operator = o.operator_name
GROUP BY o.operator_name, o.success_rate;

-- Region & Industry Analysis
SELECT
    c.region,
    c.industry,
    SUM(s.messages_sent) AS total_messages
FROM sms_campaigns s
JOIN customers c
ON s.customer_id = c.customer_id
GROUP BY c.region, c.industry;

-- Message Type Analysis
SELECT
    c.industry,
    s.message_type,
    SUM(s.messages_sent) AS total_messages
FROM sms_campaigns s
JOIN customers c
ON s.customer_id = c.customer_id
GROUP BY c.industry, s.message_type;

-- Delivery Failure Analysis
SELECT
    operator,
    SUM(failed) AS total_failed_messages,
    AVG(delivery_time_sec) AS avg_delivery_time
FROM sms_campaigns
GROUP BY operator
ORDER BY total_failed_messages DESC;
