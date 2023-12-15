-- Invoke the Function
DECLARE
    v_max_hours NUMBER;
BEGIN
    v_max_hours := max_hours(23, 27, 'ЭКОНОМИКА');
    DBMS_OUTPUT.PUT_LINE('Maximum Hours for ЭКОНОМИКА and Lecturer IDs 1 to 5: ' || v_max_hours);
END;
/