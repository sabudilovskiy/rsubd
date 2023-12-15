
DROP TABLE LOGGING_TABLE;
DROP SEQUENCE LOGGING_TABLE_SEQ;
DROP TRIGGER STUDENT_STIPEND_AVERAGE_CHECK;

CREATE TABLE LOGGING_TABLE (
  LOG_ID INTEGER PRIMARY KEY,
  LOG_MESSAGE CHAR(200) NOT NULL,
  LOG_DATE DATE
);


CREATE SEQUENCE LOGGING_TABLE_SEQ
 START WITH     1
 INCREMENT BY   1;


CREATE OR REPLACE TRIGGER STUDENT_STIPEND_AVERAGE_CHECK
BEFORE INSERT ON STUDENT
FOR EACH ROW
DECLARE
  average_stipend INT;
  deviation_threshold INT := 10; -- Задаем порог уклонения
BEGIN
  -- Calculate the average stipend
  SELECT AVG(STIPEND)
  INTO average_stipend
  FROM STUDENT;

  -- Check if the stipend of the new student deviates from the average
  IF deviation_threshold < ABS(:NEW.STIPEND - average_stipend) THEN
    -- Insert a row into the logging table
    INSERT INTO LOGGING_TABLE (LOG_ID, LOG_MESSAGE, LOG_DATE)
    VALUES (LOGGING_TABLE_SEQ.NEXTVAL, 'Стипендия превышает среднее значение:', SYSDATE);
  
    -- Only allow the insert if the stipend does not deviate too much from the average
    --RAISE_APPLICATION_ERROR(-20000, 'Стипендия нового студента сильно отклоняется от среднего значения.');
  END IF;
END;
/

