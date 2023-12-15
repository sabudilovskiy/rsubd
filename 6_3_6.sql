--Выбрать название услуг c id равным 1, 3, 4, 5, 8, 22
SELECT service_id, service_name
FROM MRV_AdditionalService
WHERE service_id IN (1, 3, 4, 5, 8, 22);