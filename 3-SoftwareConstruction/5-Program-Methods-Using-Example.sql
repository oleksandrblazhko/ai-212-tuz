DECLARE
    v_result INT;
BEGIN
    -- Виклик функції restaurantSearch
    v_result := restaurantSearch('Olio Pizza', 'Italian food');

    -- Обробка результату
    IF v_result = 1 THEN
        DBMS_OUTPUT.PUT_LINE('Запит успішний. Ресторан існує.');
    ELSIF v_result = -1 THEN
        DBMS_OUTPUT.PUT_LINE('Помилка! Неправильно введена назва ресторану.');
    ELSIF v_result = -2 THEN
        DBMS_OUTPUT.PUT_LINE('Помилка! Неправильно введена категорія ресторану.');
    ELSIF v_result = -3 THEN
        DBMS_OUTPUT.PUT_LINE('Помилка! Не введено назву чи категорію ресторану.');
    ELSIF v_result = -4 THEN
        DBMS_OUTPUT.PUT_LINE('Помилка! Ресторан з вказаною назвою не існує.');
    END IF;
END;
/