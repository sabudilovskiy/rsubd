--Выбрать годы, в которые выписывались штрафы, без повторений. Результат отсортировать по возрастанию. 
SELECT DISTINCT EXTRACT(YEAR FROM fine_date) AS penalty_year
FROM MRV_Fine
WHERE (EXTRACT(YEAR FROM fine_date), fine_type) IN (
    SELECT EXTRACT(YEAR FROM fine_date) AS penalty_year,
           fine_type
    FROM MRV_Fine
    GROUP BY EXTRACT(YEAR FROM fine_date), fine_type
    HAVING COUNT(DISTINCT fine_type) = COUNT(*)
)
ORDER BY penalty_year ASC;
