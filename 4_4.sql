DELETE FROM STUDENT
where STUD_ID = 987;

INSERT INTO STUDENT(
    STUD_ID,
    SURNAME,
    "NAME",
    STIPEND,
    KURS,
    CITY,
    BIRTHDAY,
    UNIV_ID
  )
VALUES
  (
    987,
    'SURNAME',
    'NAME',
    3000,
    3,
    'МАСКВА',
    NULL,
    1
  );
