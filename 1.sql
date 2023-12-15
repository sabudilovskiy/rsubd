DECLARE 
    -- Объявляем исключительную ситуацию
    found_mgu EXCEPTION;

    CURSOR university_cur IS 
        SELECT * FROM UNIVERSITY WHERE CITY = 'МОСКВА';
        
    univ university_cur%ROWTYPE;

BEGIN 
    -- Открываем курсор
    OPEN university_cur;
    
    LOOP 
        -- Получаем данные из курсора
        FETCH university_cur INTO univ; 
        EXIT WHEN university_cur%NOTFOUND; 
        
        -- Проверяем названия университетов
        IF univ.UNIV_NAME = 'МОСКОВСКИЙ_ГОСУДАРСТВЕННЫЙ_УНИВЕРСИТЕТ' THEN 
            RAISE found_mgu;
        END IF;
        
        DBMS_OUTPUT.PUT_LINE('Университет: ' || univ.UNIV_NAME);
    END LOOP; 

    -- Закрываем курсор
    CLOSE university_cur;

EXCEPTION 
    WHEN found_mgu THEN 
        DBMS_OUTPUT.PUT_LINE('Пропускаем МГУ');
END;
