--CAR SERVICE CENTER MANAGEMENT SYSTEM--
create database if not exists car_service_center;
use car_service_center;
create table if not exists customer(customer_id int primary key,name varchar(60) not null,phone varchar(15) unique,email varchar(100),address varchar(100));
insert into customer(customer_id,name,phone,email,address) values(1,'rahul','9978906549','rahul@gamil.com','nashik'),(2,'mayuri','890076567','mayuri@gamil.com','pune'),(3,'sneha','88907656','sneha@gmail.com','delhi');
select*from customer;
create table if not exists car(car_id int primary key,customer_id int,car_number varchar(30) unique,brand varchar(30),model varchar(30),year int,foreign key (customer_id) references customer(customer_id));
insert into car(car_id,customer_id,car_number,brand,model,year) values(1,1,'MH15AB1234','HONDA','CITY',2022),(2,2,'MH12CD5678','HYUNDAI','i20',2021),(3,3,'MH01EF9012','MARUTI','SWIFT',2023);
SELECT*FROM CAR;
CREATE TABLE service (
    service_id INT PRIMARY KEY,
    service_name VARCHAR(50) NOT NULL,
    description VARCHAR(100),
    service_cost DECIMAL(10,2)
);
INSERT INTO service
(service_id, service_name, description, service_cost)
VALUES
(1, 'Oil Change', 'Engine oil replacement', 1500),
(2, 'General Service', 'Complete car checkup', 3000),
(3, 'Brake Service', 'Brake checking and repair', 2500),
(4, 'AC Service', 'Car AC checking and repair', 2000);
SELECT*FROM SERVICE;
CREATE TABLE mechanic (
    mechanic_id INT PRIMARY KEY,
    mechanic_name VARCHAR(50) NOT NULL,
    phone VARCHAR(15) UNIQUE,
    specialization VARCHAR(50),
    experience_years INT,
    salary DECIMAL(10,2)
);
INSERT INTO mechanic
(mechanic_id, mechanic_name, phone, specialization, experience_years, salary)
VALUES
(1, 'RAMESH Patil', '9876543210', 'Engine Repair', 5, 25000),
(2, 'MAYANK  KORE', '9876543211', 'Brake Service', 3, 22000),
(3, 'SHIVAM RAJE', '9876543212', 'AC Service', 4, 24000);
SELECT*FROM MECHANIC;
CREATE TABLE service_booking (
    booking_id INT PRIMARY KEY,
    customer_id INT,
    car_id INT,
    service_id INT,
    mechanic_id INT,
    booking_date DATE,
    booking_status VARCHAR(20),

    FOREIGN KEY (customer_id) REFERENCES customer(customer_id),
    FOREIGN KEY (car_id) REFERENCES car(car_id),
    FOREIGN KEY (service_id) REFERENCES service(service_id),
    FOREIGN KEY (mechanic_id) REFERENCES mechanic(mechanic_id)
);
DESC service_booking;
INSERT INTO service_booking
(booking_id, customer_id, car_id, service_id, mechanic_id, booking_date, booking_status)
VALUES
(1, 1, 1, 1, 1, '2026-08-23', 'Pending'),
(2, 2, 2, 2, 2, '2026-08-24', 'Completed'),
(3, 3, 3, 3, 3, '2026-08-25', 'Pending');
SELECT*FROM SERVICE_BOOKING;
CREATE TABLE service_details (
    detail_id INT PRIMARY KEY,
    booking_id INT,
    work_description VARCHAR(150),
    service_cost DECIMAL(10,2)
);
INSERT INTO service_details
(detail_id, booking_id, work_description, service_cost)
VALUES
(1, 1, 'Engine oil changed', 1500),
(2, 1, 'Oil filter replaced', 500),
(3, 2, 'Brake pads checked', 2500);
SELECT*FROM SERVICE_DETAILS;
CREATE TABLE spare_parts (
    part_id INT PRIMARY KEY,
    part_name VARCHAR(50) NOT NULL,
    price DECIMAL(10,2),
    stock_quantity INT
);
INSERT INTO spare_parts
(part_id, part_name, price, stock_quantity)
VALUES
(1, 'Oil Filter', 500, 20),
(2, 'Brake Pad', 2500, 10),
(3, 'Air Filter', 800, 15),
(4, 'Spark Plug', 300, 25);
SELECT*FROM SPARE_PARTS;
CREATE TABLE parts_used (
    parts_used_id INT PRIMARY KEY,
    booking_id INT,
    part_id INT,
    quantity INT
);
INSERT INTO parts_used
(parts_used_id, booking_id, part_id, quantity)
VALUES
(1, 1, 1, 1),
(2, 1, 2, 2),
(3, 2, 3, 1);
SELECT*FROM PARTS_USED;
CREATE TABLE employee (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(50) NOT NULL,
    phone VARCHAR(15) UNIQUE,
    role VARCHAR(30),
    salary DECIMAL(10,2)
);
INSERT INTO employee
(employee_id, employee_name, phone, role, salary)
VALUES
(1, 'MAYANK', '9876543201', 'Receptionist', 22000),
(2, 'SIDDHARTH', '9876543202', 'Accountant', 28000),
(3, 'PrANIT', '9876543203', 'Manager', 35000);
SELECT*FROM EMPLOYEE;
CREATE TABLE supplier (
    supplier_id INT PRIMARY KEY,
    supplier_name VARCHAR(50) NOT NULL,
    phone VARCHAR(15) UNIQUE,
    email VARCHAR(100),
    address VARCHAR(100)
);
INSERT INTO supplier
(supplier_id, supplier_name, phone, email, address)
VALUES
(1, 'dhiraj Auto Parts', '9876543101', 'abc@gmail.com', 'Pune'),
(2, 'Shree Motors', '9876543102', 'shree@gmail.com', 'Nashik'),
(3, 'mine Supplies', '9876543103', 'cartech@gmail.com', 'Mumbai');
select*from supplier;
CREATE TABLE invoice (
    invoice_id INT PRIMARY KEY,
    booking_id INT,
    invoice_date DATE,
    total_amount DECIMAL(10,2),
    invoice_status VARCHAR(20)
);
INSERT INTO invoice
(invoice_id, booking_id, invoice_date, total_amount, invoice_status)
VALUES
(1, 1, '2026-08-23', 2000, 'Unpaid'),
(2, 2, '2026-08-24', 2500, 'Paid'),
(3, 3, '2026-08-25', 3000, 'Paid'),
(4, 1, '2026-08-26', 3500, 'Pending'),
(5, 2, '2026-08-27', 1800, 'Paid');
select*from invoice;
CREATE TABLE payment (
    payment_id INT PRIMARY KEY,
    invoice_id INT,
    payment_date DATE,
    amount DECIMAL(10,2),
    payment_method VARCHAR(20),
    payment_status VARCHAR(20)
);
INSERT INTO payment
(payment_id, invoice_id, payment_date, amount, payment_method, payment_status)
VALUES
(1, 1, '2026-08-23', 2000, 'UPI', 'Paid'),
(2, 2, '2026-08-24', 2500, 'Card', 'Paid'),
(3, 3, '2026-08-25', 3000, 'Cash', 'Paid'),
(4, 4, '2026-08-26', 3500, 'UPI', 'Pending'),
(5, 5, '2026-08-27', 1800, 'Card', 'Paid');
select*from payment;
CREATE TABLE feedback (
    feedback_id INT PRIMARY KEY,
    customer_id INT,
    booking_id INT,
    rating INT,
    comments VARCHAR(200),
    feedback_date DATE
);
INSERT INTO feedback
(feedback_id, customer_id, booking_id, rating, comments, feedback_date)
VALUES
(1, 1, 1, 5, 'Excellent service', '2026-08-23'),
(2, 2, 2, 4, 'Good service', '2026-08-24'),
(3, 3, 3, 5, 'Very good service', '2026-08-25'),
(4, 1, 1, 4, 'Service was good', '2026-08-26'),
(5, 2, 2, 3, 'Average service', '2026-08-27');
select*from feedback;
CREATE TABLE branch (
    branch_id INT PRIMARY KEY,
    branch_name VARCHAR(50) NOT NULL,
    location VARCHAR(100),
    phone VARCHAR(15) UNIQUE
);
INSERT INTO branch
(branch_id, branch_name, location, phone)
VALUES
(1, 'Pune Branch', 'Pune', '9876543001'),
(2, 'Nashik Branch', 'Nashik', '9876543002'),
(3, 'Mumbai Branch', 'Mumbai', '9876543003'),
(4, 'Nagpur Branch', 'Nagpur', '9876543004'),
(5, 'Aurangabad Branch', 'Aurangabad', '9876543005');
select*from branch;
desc customer;
desc car;
ALTER TABLE car
ADD CONSTRAINT fk_car_customer
FOREIGN KEY (customer_id)
REFERENCES customer(customer_id);
ALTER TABLE service_details
ADD CONSTRAINT fk_details_booking
FOREIGN KEY (booking_id)
REFERENCES service_booking(booking_id);
DESC service_details;
ALTER TABLE parts_used
ADD CONSTRAINT fk_partsused_booking
FOREIGN KEY (booking_id)
REFERENCES service_booking(booking_id);
DESC PARTS_USED;
SELECT customer.name, car.car_number
FROM customer
JOIN car
ON customer.customer_id = car.customer_id;
SELECT customer.name, service_booking.booking_id
FROM customer
JOIN service_booking
ON customer.customer_id = service_booking.customer_id;
SELECT customer.name,
       car.car_number,
       service_booking.booking_id
FROM customer
JOIN car
ON customer.customer_id = car.customer_id
JOIN service_booking
ON customer.customer_id = service_booking.customer_id;
SELECT service_booking.booking_id,
       service.service_name,
       mechanic.mechanic_name
FROM service_booking
JOIN service
ON service_booking.service_id = service.service_id
JOIN mechanic
ON service_booking.mechanic_id = mechanic.mechanic_id;
SELECT service_booking.booking_id,
       service_details.work_description,
       service_details.service_cost
FROM service_booking
JOIN service_details
ON service_booking.booking_id = service_details.booking_id;
SELECT spare_parts.part_name,
       spare_parts.price,
       parts_used.quantity
FROM spare_parts
JOIN parts_used
ON spare_parts.part_id = parts_used.part_id;
SELECT service_booking.booking_id,
       spare_parts.part_name,
       spare_parts.price,
       parts_used.quantity
FROM service_booking
JOIN parts_used
ON service_booking.booking_id = parts_used.booking_id
JOIN spare_parts
ON parts_used.part_id = spare_parts.part_id;
SELECT customer_id, COUNT(*)  total_bookings
FROM service_booking
GROUP BY customer_id;
SELECT booking_id, SUM(service_cost) AS total_cost
FROM service_details
GROUP BY booking_id;
SELECT AVG(service_cost) AS average_cost
FROM service_details;
SELECT MIN(service_cost) AS minimum_cost
FROM service_details;
SELECT MAX(service_cost) AS maximum_cost
FROM service_details;
SELECT * FROM spare_parts;
UPDATE spare_parts
SET price = 550
WHERE part_id = 1;
SELECT*FROM SPARE_PARTS;
SELECT * FROM spare_parts
WHERE part_id = 1;
DESCRIBE spare_parts;
SELECT *
FROM car
LIMIT 3;
SELECT *
FROM car
LIMIT 3 OFFSET 2;
DESCRIBE mechanic;
SELECT mechanic_name, salary
FROM mechanic
ORDER BY salary DESC
LIMIT 1 OFFSET 1;
SELECT mechanic_name, salary
FROM mechanic
ORDER BY salary DESC
LIMIT 1;
CREATE INDEX idx_customer_name
ON customer(name);
SHOW INDEX FROM customer;
CREATE INDEX idx_customer_name_phone
ON customer(name, phone);
SHOW INDEX FROM CUSTOMER;
DESCRIBE service;
CREATE FULLTEXT INDEX idx_service_description
ON service(description);
SELECT *
FROM service
WHERE MATCH(description)
AGAINST('engine');
SHOW TABLES;
SELECT * FROM customer;
SELECT * FROM car;
SELECT * FROM service;
SELECT * FROM service_booking;
SELECT * FROM service_details;
SELECT * FROM mechanic;
SELECT * FROM spare_parts;
SELECT * FROM parts_used;
