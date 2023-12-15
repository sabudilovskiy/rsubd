CREATE TABLE MRV_Owner (
    owner_id NUMBER PRIMARY KEY,
    last_name VARCHAR2(255),
    first_name VARCHAR2(255),
    patronymic VARCHAR2(255),
    date_of_birth DATE,
    address VARCHAR2(255),
    email VARCHAR2(255),
    phone VARCHAR2(255)
);
 
CREATE TABLE MRV_Settlement (
    settlement_id NUMBER PRIMARY KEY,
    name VARCHAR2(255),
    type VARCHAR2(255),
    region VARCHAR2(255)
);
 
CREATE TABLE MRV_Address (
    address_id NUMBER PRIMARY KEY,
    street VARCHAR2(255),
    house_number VARCHAR2(255),
    settlement_id NUMBER REFERENCES MRV_Settlement(settlement_id)
);
 
CREATE TABLE MRV_Hotel (
    hotel_id NUMBER PRIMARY KEY,
    name VARCHAR2(255),
    address_id NUMBER REFERENCES MRV_Address(address_id),
    email VARCHAR2(255),
    phone VARCHAR2(255),
    year_of_opening NUMBER,
    area FLOAT,
    owner_id NUMBER REFERENCES MRV_Owner(owner_id)
);
 
CREATE TABLE MRV_RoomType (
    room_type_id NUMBER PRIMARY KEY,
    type_name VARCHAR2(255),
    description VARCHAR2(255)
);
 
CREATE TABLE MRV_Room (
    room_id NUMBER PRIMARY KEY,
    hotel_id NUMBER REFERENCES MRV_Hotel(hotel_id),
    room_type_id NUMBER REFERENCES MRV_RoomType(room_type_id),
    number_of_seats NUMBER,
    floor NUMBER
);
 
CREATE TABLE MRV_Rate (
    rate_id NUMBER PRIMARY KEY,
    room_type_id NUMBER REFERENCES MRV_RoomType(room_type_id),
    price_per_night NUMBER(10, 2),
    start_date TIMESTAMP
);
 
CREATE TABLE MRV_Client (
    client_id NUMBER PRIMARY KEY,
    last_name VARCHAR2(255),
    first_name VARCHAR2(255),
    patronymic VARCHAR2(255),
    passport_data VARCHAR2(255),
    date_of_birth DATE
);
 
CREATE TABLE MRV_Booking (
    booking_id NUMBER PRIMARY KEY,
    client_id NUMBER REFERENCES MRV_Client(client_id),
    room_id NUMBER REFERENCES MRV_Room(room_id),
    check_in_date TIMESTAMP,
    check_out_date TIMESTAMP
);
 
CREATE TABLE MRV_Invoice (
    invoice_id NUMBER PRIMARY KEY,
    client_id NUMBER REFERENCES MRV_Client(client_id),
    room_id NUMBER REFERENCES MRV_Room(room_id),
    amount NUMBER(10, 2)
);
 
CREATE TABLE MRV_AdditionalService (
    service_id NUMBER PRIMARY KEY,
    service_name VARCHAR2(255),
    price NUMBER(10, 2)
);
 
CREATE TABLE MRV_InvoiceAdditionalService (
    invoice_id NUMBER REFERENCES MRV_Invoice(invoice_id),
    service_id NUMBER REFERENCES MRV_AdditionalService(service_id),
    quantity NUMBER,
    PRIMARY KEY (invoice_id, service_id)
);
 
CREATE TABLE MRV_Fine (
    fine_id NUMBER PRIMARY KEY,
    client_id NUMBER REFERENCES MRV_Client(client_id),
    fine_type VARCHAR2(255),
    fine_date TIMESTAMP,
    amount NUMBER(10, 2)
);
 
CREATE TABLE MRV_Employee (
    employee_id NUMBER PRIMARY KEY,
    hotel_id NUMBER REFERENCES MRV_Hotel(hotel_id),
    last_name VARCHAR2(255),
    first_name VARCHAR2(255),
    patronymic VARCHAR2(255),
    date_of_birth DATE,
    passport_data VARCHAR2(255),
    job_type VARCHAR2(255),
    salary NUMBER(10, 2)
);