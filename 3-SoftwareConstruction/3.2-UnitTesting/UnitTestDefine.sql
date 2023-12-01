-- Unit-testing of restaurantSearch function
DECLARE
   result INT;
BEGIN
   DBMS_OUTPUT.PUT_LINE(' ');
   DBMS_OUTPUT.PUT_LINE('Unit-testing of restaurantSearch function');
   
   -- TC 1.1: назва = Olio Pizza, категорія = італійська кухня Результат = 1
   DBMS_OUTPUT.PUT('TC 1.1: ');
   result := restaurantSearch('Olio Pizza', 'Italian food');
   IF result = 1 THEN
      DBMS_OUTPUT.PUT_LINE('Passed');
   ELSE
      DBMS_OUTPUT.PUT_LINE('Failed');
   END IF;

   -- TC 1.2: назва = Olio Pizza категорія = null Результат = 1
   DBMS_OUTPUT.PUT('TC 1.2: ');
   result := restaurantSearch('Olio Pizza', null);
   IF result = 1 THEN
      DBMS_OUTPUT.PUT_LINE('Passed');
   ELSE
      DBMS_OUTPUT.PUT_LINE('Failed');
   END IF;

   -- TC 1.3: назва = null категорія = італійська кухня	Результат = 1
   DBMS_OUTPUT.PUT('TC 1.3: ');
   result := restaurantSearch(null, 'Italian food');
   IF result = 1 THEN
      DBMS_OUTPUT.PUT_LINE('Passed');
   ELSE
      DBMS_OUTPUT.PUT_LINE('Failed');
   END IF;

   -- TC 1.4: назва = Olio Pizza + 100 символів категорія = італійська кухня Результат = -1
   DBMS_OUTPUT.PUT('TC 1.4: ');
   result := restaurantSearch('Olio Pizza' || RPAD('X', 100, 'X'), 'Italian food');
   IF result = -1 THEN
      DBMS_OUTPUT.PUT_LINE('Passed');
   ELSE
      DBMS_OUTPUT.PUT_LINE('Failed');
   END IF;

   -- TC 1.5: назва = Olio Pizza + 100 символів категорія = null Результат = -1
   DBMS_OUTPUT.PUT('TC 1.5: ');
   result := restaurantSearch('Olio Pizza' || RPAD('X', 100, 'X'), null);
   IF result = -1 THEN
      DBMS_OUTPUT.PUT_LINE('Passed');
   ELSE
      DBMS_OUTPUT.PUT_LINE('Failed');
   END IF;

   -- TC 1.6: назва = Olio Pizza категорія = 1 Результат = -2
   DBMS_OUTPUT.PUT('TC 1.6: ');
   result := restaurantSearch('Olio Pizza', 1);
   IF result = -2 THEN
      DBMS_OUTPUT.PUT_LINE('Passed');
   ELSE
      DBMS_OUTPUT.PUT_LINE('Failed');
   END IF;

   -- TC 1.7: назва = Olio Pizza категорія = 'і' Результат = -2
   DBMS_OUTPUT.PUT('TC 1.7: ');
   result := restaurantSearch('Olio Pizza', 'I');
   IF result = -2 THEN
      DBMS_OUTPUT.PUT_LINE('Passed');
   ELSE
      DBMS_OUTPUT.PUT_LINE('Failed');
   END IF;

   -- TC 1.8: назва = null категорія = '1' Результат = -2
   DBMS_OUTPUT.PUT('TC 1.8: ');
   result := restaurantSearch(null, '1');
   IF result = -2 THEN
      DBMS_OUTPUT.PUT_LINE('Passed');
   ELSE
      DBMS_OUTPUT.PUT_LINE('Failed');
   END IF;

   -- TC 1.9: назва = null категорія = 'і' Результат = -2
   DBMS_OUTPUT.PUT('TC 1.9: ');
   result := restaurantSearch(null, 'і');
   IF result = -2 THEN
      DBMS_OUTPUT.PUT_LINE('Passed');
   ELSE
      DBMS_OUTPUT.PUT_LINE('Failed');
   END IF;

   -- TC 1.10: назва = null категорія = 1 Результат = -2
   DBMS_OUTPUT.PUT('TC 1.10: ');
   result := restaurantSearch(null, 1);
   IF result = -2 THEN
      DBMS_OUTPUT.PUT_LINE('Passed');
   ELSE
      DBMS_OUTPUT.PUT_LINE('Failed');
   END IF;

   -- TC 1.11: No input
   DBMS_OUTPUT.PUT('TC 1.11: ');
   result := restaurantSearch(null, null);
   IF result = -3 THEN
      DBMS_OUTPUT.PUT_LINE('Passed');
   ELSE
      DBMS_OUTPUT.PUT_LINE('Failed');
   END IF;
END;