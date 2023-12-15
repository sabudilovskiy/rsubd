--Выбрать фамилию и инициалы владельцев отеля в возрасте от 22 до 35 лет. 
SELECT
    last_name,
    INITCAP(SUBSTR(first_name, 1, 1) || '.' || SUBSTR(patronymic, 1, 1) || '.') AS initials
FROM
    MRV_Owner
WHERE
    EXTRACT(YEAR FROM CURRENT_DATE) - EXTRACT(YEAR FROM date_of_birth) BETWEEN 22 AND 35;
