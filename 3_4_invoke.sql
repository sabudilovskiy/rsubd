
DECLARE
  SUBJECT_COUNT INTEGER;
BEGIN
  -- Вызываем функцию
  SUBJECT_COUNT := PKG.COUNT_SUBJECTS;

  dbms_output.put_line('Количество предметов: ' || SUBJECT_COUNT);
EXCEPTION
  WHEN OTHERS THEN
    dbms_output.put_line(SQLERRM);
END;
/