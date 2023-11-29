CREATE OR REPLACE FUNCTION restaurantSearch  (
    p_res_name IN VARCHAR2,
    p_category IN VARCHAR2
)
RETURN INT IS
    v_res_name RestaurantList.res_name%TYPE := TRIM(UPPER(p_res_name));
    v_category RestaurantList.category%TYPE := TRIM(UPPER(p_category));
    v_count NUMBER := 0;
BEGIN
    -- Перевірка умов 1 та 2 для назви ресторану
    IF v_res_name IS NOT NULL THEN
        IF LENGTH(v_res_name) > 100 OR NOT REGEXP_LIKE(v_res_name, '[a-zA-Z]') THEN
            RETURN -1;
        END IF;
    END IF;

    -- Перевірка умови 3 для категорії ресторану
    IF v_category IS NOT NULL THEN
        IF NOT REGEXP_LIKE(v_category, '^[a-zA-Z]') THEN
            RETURN -2;
        END IF;
    END IF;

    -- Перевірка чи введено назву або категорію ресторану
    IF v_res_name IS NULL AND v_category IS NULL THEN
        RETURN -3;
    END IF;

    -- Перевірка існування ресторану із задананими назвою або категорією
    SELECT COUNT(*)
    INTO v_count
    FROM RestaurantList
    WHERE res_name = v_res_name OR category = v_category;

    IF v_count = 0 THEN
        RETURN -4;
    END IF;

    RETURN 1; -- Припустимий код успішного виконання - користувач успішно ввів всі дані
END;
/
