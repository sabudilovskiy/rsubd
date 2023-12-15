ACCEPT name_from_prompt CHAR prompt 'Введите имя студента: ';

DECLARE
  v_id INTEGER;
BEGIN
  SELECT STUDENT_LAB_5_SEQ.NEXTVAL INTO v_id FROM dual;
  INSERT INTO STUDENT_LAB_5(ID, NAME) VALUES (v_id, '&name_from_prompt');
  COMMIT;
END;
/
