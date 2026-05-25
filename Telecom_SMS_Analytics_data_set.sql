
-- CREATE DATABASE
CREATE DATABASE sms_analytics;
USE sms_analytics;

-- TABLE 1: CUSTOMERS
CREATE TABLE customers (
    customer_id VARCHAR(10) PRIMARY KEY,
    customer_name VARCHAR(50),
    industry VARCHAR(50),
    region VARCHAR(20)
);

INSERT INTO customers VALUES
('C101', 'Flipkart', 'E-commerce', 'South'),
('C102', 'Amazon', 'E-commerce', 'North'),
('C103', 'Paytm', 'FinTech', 'East'),
('C104', 'Swiggy', 'Food Delivery', 'West'),
('C105', 'Zomato', 'Food Delivery', 'South'),
('C106', 'PhonePe', 'FinTech', 'North'),
('C107', 'Myntra', 'Fashion', 'East'),
('C108', 'Meesho', 'E-commerce', 'West'),
('C109', 'BigBasket', 'Retail', 'South'),
('C110', 'Nykaa', 'Beauty', 'North');



-- TABLE 2: SMS_CAMPAIGNS
CREATE TABLE sms_campaigns (
    message_id VARCHAR(10) PRIMARY KEY,
    customer_id VARCHAR(10),
    operator VARCHAR(20),
    message_type VARCHAR(20),
    messages_sent INT,
    delivered INT,
    failed INT,
    delivery_time_sec DECIMAL(4,2),
    campaign_date DATE,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

INSERT INTO sms_campaigns VALUES
('MSG001','C101','Airtel','OTP',5000,4900,100,2.1,'2026-01-01'),
('MSG002','C102','Jio','Promotional',7200,6900,300,3.5,'2026-01-01'),
('MSG003','C103','VI','OTP',4300,4200,100,2.0,'2026-01-02'),
('MSG004','C104','Airtel','Transactional',6500,6300,200,2.8,'2026-01-02'),
('MSG005','C105','Jio','Promotional',8100,7800,300,4.1,'2026-01-03'),
('MSG006','C106','VI','OTP',3900,3800,100,1.9,'2026-01-03'),
('MSG007','C107','Airtel','Transactional',5600,5450,150,2.4,'2026-01-04'),
('MSG008','C108','Jio','OTP',4700,4600,100,2.2,'2026-01-04'),
('MSG009','C109','VI','Promotional',8800,8400,400,4.5,'2026-01-05'),
('MSG010','C110','Airtel','OTP',5100,5000,100,2.3,'2026-01-05'),
('MSG011','C101','Jio','Transactional',6200,6000,200,3.0,'2026-01-06'),
('MSG012','C102','VI','Promotional',7600,7200,400,4.0,'2026-01-06'),
('MSG013','C103','Airtel','OTP',5300,5200,100,2.1,'2026-01-07'),
('MSG014','C104','Jio','Transactional',6800,6600,200,3.1,'2026-01-07'),
('MSG015','C105','VI','Promotional',9100,8700,400,4.8,'2026-01-08'),
('MSG016','C106','Airtel','OTP',4800,4700,100,2.0,'2026-01-08'),
('MSG017','C107','Jio','Transactional',7100,6900,200,3.2,'2026-01-09'),
('MSG018','C108','VI','OTP',4500,4400,100,2.1,'2026-01-09'),
('MSG019','C109','Airtel','Promotional',8300,7900,400,4.3,'2026-01-10'),
('MSG020','C110','Jio','Transactional',6400,6200,200,2.9,'2026-01-10');



-- TABLE 3: OPERATORS
CREATE TABLE operators (
    operator_id VARCHAR(10) PRIMARY KEY,
    operator_name VARCHAR(20),
    region VARCHAR(20),
    success_rate DECIMAL(5,2)
);

INSERT INTO operators VALUES
('OP101', 'Airtel', 'Pan India', 98.10),
('OP102', 'Jio', 'Pan India', 97.40),
('OP103', 'VI', 'Pan India', 95.80);

