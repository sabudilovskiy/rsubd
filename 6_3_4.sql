--Выбрать все данные о клиентах. Результат сортировать по фамилии в лексикографическом порядке, по имени и отчеству в порядке обратном лексикографическому. 
SELECT
last_name,
first_name,
patronymic,
passport_data
FROM
MRV_Client
ORDER BY
last_name ASC,
first_name DESC,
patronymic DESC;
