--Выбрать фамилию, имя и первую букву отчества обслуживающего персонала. В результат включить только людей с двойной фамилии или фамилий, заканчивающееся на буквы "А" или "Я". Результат отсортировать следующим образом: в первую очередь в данные о персонале четным id.
SELECT last_name, first_name, SUBSTR(patronymic, 1, 1) as first_letter
FROM MRV_Employee
WHERE 
    (
        REGEXP_LIKE(last_name, ' ') OR 
        REGEXP_LIKE(last_name, 'n$') OR
        REGEXP_LIKE(last_name, 'k$')
    )
    AND MOD(employee_id, 2) = 0
ORDER BY employee_id;
