--Выбрать все данные о проживании в номере, забронированном в текущем месяце.
SELECT
    b.booking_id,
    c.last_name,
    c.first_name,
    r.hotel_id,
    r.room_id,
    b.check_in_date,
    b.check_out_date
FROM
    MRV_Booking b
    INNER JOIN MRV_Room r ON b.room_id = r.room_id
    INNER JOIN MRV_Client c ON b.client_id = c.client_id
WHERE
    EXTRACT(YEAR FROM b.check_in_date) = EXTRACT(YEAR FROM CURRENT_DATE)