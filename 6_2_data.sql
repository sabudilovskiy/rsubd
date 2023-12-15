-- Insert into MRV_Owner
INSERT INTO MRV_Owner (owner_id, last_name, first_name, patronymic, date_of_birth, address, email, phone)
SELECT 1, 'Smith', 'John', 'Doe', TO_DATE('1980-01-01', 'YYYY-MM-DD'), '123 Main St', 'john.smith@example.com', '123-456-7890' FROM DUAL
UNION ALL
SELECT 2, 'Johnson', 'Alice', 'M', TO_DATE('1975-05-15', 'YYYY-MM-DD'), '456 Oak St', 'alice.johnson@example.com', '987-654-3210' FROM DUAL
UNION ALL
SELECT 3, 'Williams', 'Robert', 'J', TO_DATE('1990-11-20', 'YYYY-MM-DD'), '789 Elm St', 'robert.williams@example.com', '555-123-4567' FROM DUAL
UNION ALL
SELECT 4, 'Davis', 'Emily', 'S', TO_DATE('1988-03-10', 'YYYY-MM-DD'), '234 Pine St', 'emily.davis@example.com', '777-888-9999' FROM DUAL
UNION ALL
SELECT 5, 'Miller', 'Michael', 'W', TO_DATE('1985-08-05', 'YYYY-MM-DD'), '567 Birch St', 'michael.miller@example.com', '111-222-3333' FROM DUAL;

-- Insert into MRV_Settlement
INSERT INTO MRV_Settlement (settlement_id, name, type, region)
SELECT 1, 'Cityville', 'Urban', 'Central' FROM DUAL
UNION ALL
SELECT 2, 'Townsville', 'Suburban', 'North' FROM DUAL
UNION ALL
SELECT 3, 'Villageville', 'Rural', 'South' FROM DUAL
UNION ALL
SELECT 4, 'Seaside', 'Coastal', 'West' FROM DUAL
UNION ALL
SELECT 5, 'Mountainview', 'Mountainous', 'East' FROM DUAL;

-- Insert into MRV_Address
INSERT INTO MRV_Address (address_id, street, house_number, settlement_id)
SELECT 1, 'Main St', '123', 1 FROM DUAL
UNION ALL
SELECT 2, 'Oak St', '456', 2 FROM DUAL
UNION ALL
SELECT 3, 'Elm St', '789', 3 FROM DUAL
UNION ALL
SELECT 4, 'Pine St', '234', 4 FROM DUAL
UNION ALL
SELECT 5, 'Birch St', '567', 5 FROM DUAL;

-- Insert into MRV_Hotel
INSERT INTO MRV_Hotel (hotel_id, name, address_id, email, phone, year_of_opening, area, owner_id)
SELECT 1, 'City Hotel', 1, 'cityhotel@example.com', '111-111-1111', 2000, 5000.50, 1 FROM DUAL
UNION ALL
SELECT 2, 'Suburb Lodge', 2, 'suburblodge@example.com', '222-222-2222', 2010, 3000.75, 2 FROM DUAL
UNION ALL
SELECT 3, 'Rural Inn', 3, 'ruralinn@example.com', '333-333-3333', 1995, 2000.25, 3 FROM DUAL
UNION ALL
SELECT 4, 'Seaside Resort', 4, 'seasideresort@example.com', '444-444-4444', 2005, 8000.00, 4 FROM DUAL
UNION ALL
SELECT 5, 'Mountain Retreat', 5, 'mountainretreat@example.com', '555-555-5555', 2015, 6000.00, 5 FROM DUAL;

-- Insert into MRV_RoomType
INSERT INTO MRV_RoomType (room_type_id, type_name, description)
SELECT 1, 'Single', 'Single bed with basic amenities' FROM DUAL
UNION ALL
SELECT 2, 'Double', 'Double bed with additional seating area' FROM DUAL
UNION ALL
SELECT 3, 'Suite', 'Luxurious suite with separate living room' FROM DUAL
UNION ALL
SELECT 4, 'Twin', 'Two separate beds for double occupancy' FROM DUAL
UNION ALL
SELECT 5, 'Family', 'Spacious room for family with kids' FROM DUAL;

-- Insert into MRV_Room
INSERT INTO MRV_Room (room_id, hotel_id, room_type_id, number_of_seats, floor)
SELECT 1, 1, 1, 1, 5 FROM DUAL
UNION ALL
SELECT 2, 2, 2, 2, 2 FROM DUAL
UNION ALL
SELECT 3, 3, 3, 3, 1 FROM DUAL
UNION ALL
SELECT 4, 4, 4, 2, 3 FROM DUAL
UNION ALL
SELECT 5, 5, 5, 4, 4 FROM DUAL;

-- Insert into MRV_Rate
INSERT INTO MRV_Rate (rate_id, room_type_id, price_per_night, start_date)
SELECT 1, 1, 100.00, TO_TIMESTAMP('2023-01-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS') FROM DUAL
UNION ALL
SELECT 2, 2, 150.00, TO_TIMESTAMP('2023-01-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS') FROM DUAL
UNION ALL
SELECT 3, 3, 200.00, TO_TIMESTAMP('2023-01-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS') FROM DUAL
UNION ALL
SELECT 4, 4, 120.00, TO_TIMESTAMP('2023-01-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS') FROM DUAL
UNION ALL
SELECT 5, 5, 180.00, TO_TIMESTAMP('2023-01-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS') FROM DUAL;

-- Insert into MRV_Client
INSERT INTO MRV_Client (client_id, last_name, first_name, patronymic, passport_data, date_of_birth)
SELECT 1, 'Johnson', 'Mark', 'A', 'AB123456', TO_DATE('1982-04-15', 'YYYY-MM-DD') FROM DUAL
UNION ALL
SELECT 2, 'Anderson', 'Sarah', 'M', 'CD789012', TO_DATE('1990-08-20', 'YYYY-MM-DD') FROM DUAL
UNION ALL
SELECT 3, 'Davis', 'Christopher', 'R', 'EF345678', TO_DATE('1975-12-01', 'YYYY-MM-DD') FROM DUAL
UNION ALL
SELECT 4, 'Smith', 'Jessica', 'L', 'GH901234', TO_DATE('1988-06-10', 'YYYY-MM-DD') FROM DUAL
UNION ALL
SELECT 5, 'Taylor', 'Brian', 'K', 'IJ567890', TO_DATE('1984-02-25', 'YYYY-MM-DD') FROM DUAL;

-- Insert into MRV_Booking
INSERT INTO MRV_Booking (booking_id, client_id, room_id, check_in_date, check_out_date)
SELECT 1, 1, 1, TO_TIMESTAMP('2023-05-01 14:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2023-05-05 10:00:00', 'YYYY-MM-DD HH24:MI:SS') FROM DUAL
UNION ALL
SELECT 2, 2, 2, TO_TIMESTAMP('2023-06-10 12:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2023-06-15 11:00:00', 'YYYY-MM-DD HH24:MI:SS') FROM DUAL
UNION ALL
SELECT 3, 3, 3, TO_TIMESTAMP('2023-03-20 15:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2023-03-25 09:00:00', 'YYYY-MM-DD HH24:MI:SS') FROM DUAL
UNION ALL
SELECT 4, 4, 4, TO_TIMESTAMP('2023-07-05 16:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2023-07-10 14:00:00', 'YYYY-MM-DD HH24:MI:SS') FROM DUAL
UNION ALL
SELECT 5, 5, 5, TO_TIMESTAMP('2023-04-01 13:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2023-04-05 12:00:00', 'YYYY-MM-DD HH24:MI:SS') FROM DUAL;

-- Insert into MRV_Invoice
INSERT INTO MRV_Invoice (invoice_id, client_id, room_id, amount)
SELECT 1, 1, 1, 500.00 FROM DUAL
UNION ALL
SELECT 2, 2, 2, 750.00 FROM DUAL
UNION ALL
SELECT 3, 3, 3, 1000.00 FROM DUAL
UNION ALL
SELECT 4, 4, 4, 600.00 FROM DUAL
UNION ALL
SELECT 5, 5, 5, 900.00 FROM DUAL;

-- Insert into MRV_AdditionalService
INSERT INTO MRV_AdditionalService (service_id, service_name, price)
SELECT 1, 'Wi-Fi', 10.00 FROM DUAL
UNION ALL
SELECT 2, 'Breakfast', 20.00 FROM DUAL
UNION ALL
SELECT 3, 'Parking', 15.00 FROM DUAL
UNION ALL
SELECT 4, 'Gym Access', 30.00 FROM DUAL
UNION ALL
SELECT 5, 'Laundry Service', 25.00 FROM DUAL;

-- Insert into MRV_InvoiceAdditionalService
INSERT INTO MRV_InvoiceAdditionalService (invoice_id, service_id, quantity)
SELECT 1, 1, 2 FROM DUAL
UNION ALL
SELECT 2, 2, 1 FROM DUAL
UNION ALL
SELECT 3, 3, 3 FROM DUAL
UNION ALL
SELECT 4, 4, 2 FROM DUAL
UNION ALL
SELECT 5, 5, 1 FROM DUAL;

-- Insert into MRV_Fine
INSERT INTO MRV_Fine (fine_id, client_id, fine_type, fine_date, amount)
SELECT 1, 1, 'Late Check-out', TO_TIMESTAMP('2023-05-05 12:00:00', 'YYYY-MM-DD HH24:MI:SS'), 50.00 FROM DUAL
UNION ALL
SELECT 2, 2, 'Smoking Violation', TO_TIMESTAMP('2023-06-15 10:00:00', 'YYYY-MM-DD HH24:MI:SS'), 100.00 FROM DUAL
UNION ALL
SELECT 3, 3, 'Noise Complaint', TO_TIMESTAMP('2023-03-25 08:00:00', 'YYYY-MM-DD HH24:MI:SS'), 75.00 FROM DUAL
UNION ALL
SELECT 4, 4, 'Damage to Property', TO_TIMESTAMP('2023-07-10 13:00:00', 'YYYY-MM-DD HH24:MI:SS'), 200.00 FROM DUAL
UNION ALL
SELECT 5, 5, 'Unauthorized Pet', TO_TIMESTAMP('2023-04-05 11:00:00', 'YYYY-MM-DD HH24:MI:SS'), 150.00 FROM DUAL;

-- Insert into MRV_Employee
INSERT INTO MRV_Employee (employee_id, hotel_id, last_name, first_name, patronymic, date_of_birth, passport_data, job_type, salary)
SELECT 1, 1, 'Wilson', 'David', 'R', TO_DATE('1980-08-10', 'YYYY-MM-DD'), 'KL123456', 'Manager', 50000.00 FROM DUAL
UNION ALL
SELECT 2, 2, 'Martin', 'Susan', 'M', TO_DATE('1975-12-05', 'YYYY-MM-DD'), 'MN789012', 'Receptionist', 30000.00 FROM DUAL
UNION ALL
SELECT 3, 3, 'Carter', 'Brian', 'K', TO_DATE('1990-03-20', 'YYYY-MM-DD'), 'OP345678', 'Housekeeping', 25000.00 FROM DUAL
UNION ALL
SELECT 4, 4, 'Harrison', 'Emily', 'S', TO_DATE('1988-01-15', 'YYYY-MM-DD'), 'QR901234', 'Chef', 40000.00 FROM DUAL
UNION ALL
SELECT 5, 5, 'Cooper', 'Michael', 'W', TO_DATE('1985-06-25', 'YYYY-MM-DD'), 'ST567890', 'Maintenance', 35000.00 FROM DUAL;
