--Выбрать фамилию и инициалы клиентов рожденные зимой. Результат отсортировать по фамилии в порядке обратном лексикографическому. 
SELECT last_name,
       INITCAP(SUBSTR(first_name, 1, 1) || '.' || SUBSTR(patronymic, 1, 1) || '.') AS initials
FROM MRV_Client
WHERE TO_NUMBER(TO_CHAR(date_of_birth, 'MM')) IN (12, 1, 2)
ORDER BY last_name DESC;
