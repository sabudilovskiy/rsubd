DROP table TRACK_FUNCTION;

DROP SEQUENCE TRACK_FUNCTION_CALL_COUNT;

CREATE SEQUENCE TRACK_FUNCTION_CALL_COUNT
START WITH 1
INCREMENT BY 1
NOMAXVALUE;


CREATE TABLE TRACK_FUNCTION (
  CALL_COUNT INTEGER,
  AVG_MARK FLOAT,
  SUBJECT_COUNT INTEGER
);

CREATE OR REPLACE TRIGGER TRACK_FUNCTION_CALL_COUNT_TRIGGER
BEFORE INSERT ON TRACK_FUNCTION
FOR EACH ROW
BEGIN
  SELECT TRACK_FUNCTION_CALL_COUNT.NEXTVAL INTO :new.CALL_COUNT FROM dual;
END;

/