DROP PACKAGE MRV_package;


CREATE OR REPLACE PACKAGE MRV_package AS
  PROCEDURE GetAllAdditionalServices;
  PROCEDURE GetClientsWithWinterBirthdays;
  PROCEDURE GetUniquePenaltyYears;
  PROCEDURE GetClientsSorted;
  PROCEDURE GetFilteredEmployees;
  PROCEDURE GetServicesById;
  PROCEDURE GetBookingsForCurrentMonth;
  PROCEDURE GetOwnersInitialsByAge;
  PROCEDURE GetTotalHotels;
  PROCEDURE GetSettlementsOrdered;
END MRV_package;
/

CREATE OR REPLACE PACKAGE BODY MRV_package AS

  PROCEDURE GetAllAdditionalServices IS
  BEGIN
    FOR rec IN (SELECT * FROM MRV_AdditionalService ORDER BY service_name) LOOP
      DBMS_OUTPUT.PUT_LINE('Service Name: ' || rec.service_name /* и другие столбцы, если есть */ );
    END LOOP;
  END GetAllAdditionalServices;
  
  PROCEDURE GetClientsWithWinterBirthdays IS
  BEGIN
    FOR rec IN (
      SELECT last_name,
             INITCAP(SUBSTR(first_name, 1, 1)) || '.' || SUBSTR(patronymic, 1, 1) || '.' AS initials
      FROM MRV_Client
      WHERE TO_NUMBER(TO_CHAR(date_of_birth, 'MM')) IN (12, 1, 2)
      ORDER BY last_name DESC
    ) LOOP
      DBMS_OUTPUT.PUT_LINE('Last Name: ' || rec.last_name || ', Initials: ' || rec.initials);
    END LOOP;
  END GetClientsWithWinterBirthdays;

  PROCEDURE GetUniquePenaltyYears IS
  BEGIN
    FOR rec IN (
      SELECT DISTINCT EXTRACT(YEAR FROM fine_date) AS penalty_year
      FROM MRV_Fine
      WHERE (EXTRACT(YEAR FROM fine_date), fine_type) IN (
          SELECT EXTRACT(YEAR FROM fine_date) AS penalty_year,
                 fine_type
          FROM MRV_Fine
          GROUP BY EXTRACT(YEAR FROM fine_date), fine_type
          HAVING COUNT(DISTINCT fine_type) = COUNT(*)
      )
      ORDER BY penalty_year ASC
    ) LOOP
      DBMS_OUTPUT.PUT_LINE('Penalty Year: ' || rec.penalty_year);
    END LOOP;
  END GetUniquePenaltyYears;

  PROCEDURE GetClientsSorted IS
  BEGIN
    FOR rec IN (
      SELECT last_name,
             first_name,
             patronymic,
             passport_data
      FROM MRV_Client
      ORDER BY last_name ASC, first_name DESC, patronymic DESC
    ) LOOP
      DBMS_OUTPUT.PUT_LINE('Client: ' || rec.last_name || ' ' || rec.first_name || ' ' || rec.patronymic);
    END LOOP;
  END GetClientsSorted;

  PROCEDURE GetFilteredEmployees IS
  BEGIN
    FOR rec IN (
      SELECT last_name, first_name, SUBSTR(patronymic, 1, 1) as first_letter
      FROM MRV_Employee
      WHERE (
          REGEXP_LIKE(last_name, ' ') OR 
          REGEXP_LIKE(last_name, 'n$') OR
          REGEXP_LIKE(last_name, 'k$')
      )
      AND MOD(employee_id, 2) = 0
      ORDER BY employee_id
    ) LOOP
      DBMS_OUTPUT.PUT_LINE('Employee: ' || rec.last_name || ' ' || rec.first_name || ' ' || rec.first_letter);
    END LOOP;
  END GetFilteredEmployees;

  PROCEDURE GetServicesById IS
  BEGIN
    FOR rec IN (
      SELECT service_id, service_name
      FROM MRV_AdditionalService
      WHERE service_id IN (1, 3, 4, 5, 8, 22)
    ) LOOP
      DBMS_OUTPUT.PUT_LINE('Service ID: ' || rec.service_id || ' Service Name: ' || rec.service_name);
    END LOOP;
  END GetServicesById;

  PROCEDURE GetBookingsForCurrentMonth IS
  BEGIN
    FOR rec IN (
      SELECT
        b.booking_id,
        c.last_name,
        c.first_name,
        r.hotel_id,
        r.room_id,
        b.check_in_date,
        b.check_out_date
      FROM
        MRV_Booking b
        INNER JOIN MRV_Room r ON b.room_id = r.room_id
        INNER JOIN MRV_Client c ON b.client_id = c.client_id
      WHERE
        EXTRACT(YEAR FROM b.check_in_date) = EXTRACT(YEAR FROM CURRENT_DATE)
    ) LOOP
      DBMS_OUTPUT.PUT_LINE('=======================');
      DBMS_OUTPUT.PUT_LINE('Booking ID: ' || rec.booking_id);
      DBMS_OUTPUT.PUT_LINE('last_name: ' || rec.last_name);
      DBMS_OUTPUT.PUT_LINE('first_name: ' || rec.first_name);
      DBMS_OUTPUT.PUT_LINE('hotel_id: ' || rec.hotel_id);
      DBMS_OUTPUT.PUT_LINE('room_id: ' || rec.room_id);
      DBMS_OUTPUT.PUT_LINE('check_in_date: ' || rec.check_in_date);
      DBMS_OUTPUT.PUT_LINE('ckeck_out_date: ' || rec.check_out_date);
    END LOOP;
  END GetBookingsForCurrentMonth;

  PROCEDURE GetOwnersInitialsByAge IS
  BEGIN
    FOR rec IN (
      SELECT
        last_name,
        INITCAP(SUBSTR(first_name, 1, 1)) || '.' || SUBSTR(patronymic, 1, 1) || '.' AS initials
      FROM
        MRV_Owner
      WHERE
        EXTRACT(YEAR FROM CURRENT_DATE) - EXTRACT(YEAR FROM date_of_birth) BETWEEN 22 AND 35
    ) LOOP
      DBMS_OUTPUT.PUT_LINE('Last Name: ' || rec.last_name || ' Initials: ' || rec.initials);
    END LOOP;
  END GetOwnersInitialsByAge;

  PROCEDURE GetTotalHotels IS
  BEGIN
    FOR rec IN (SELECT COUNT(*) AS total_hotels FROM MRV_Hotel) LOOP
      DBMS_OUTPUT.PUT_LINE('Total Number of Hotels: ' || rec.total_hotels);
    END LOOP;
  END GetTotalHotels;

  PROCEDURE GetSettlementsOrdered IS
  BEGIN
    FOR rec IN (
      SELECT name, type
      FROM MRV_Settlement
      ORDER BY type DESC, name DESC
    ) LOOP
      DBMS_OUTPUT.PUT_LINE('Settlement Name: ' || rec.name || ', Type: ' || rec.type);
    END LOOP;
  END GetSettlementsOrdered;

END MRV_package;
/
