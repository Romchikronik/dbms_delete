-- Remove a previously inserted film from the inventory and all corresponding rental records
-- Remove any records related to you (as a customer) from all tables except "Customer" and "Inventory"

DELETE FROM rental
WHERE inventory_id IN (SELECT inventory_id FROM inventory WHERE film_id = (SELECT film_id FROM film WHERE film_id = 1001));

-- Delete the film from the inventory
DELETE FROM inventory
WHERE film_id = (SELECT film_id FROM film WHERE film_id = 1001);

DELETE FROM film
WHERE film_id = 1001;

-- Remove any records related to you (as a customer) from all tables except "Customer" and "Inventory"

DELETE FROM payment WHERE customer_id = 1;
DELETE FROM rental WHERE customer_id = 1;
DELETE FROM address WHERE address_id = (SELECT address_id FROM CUSTOMER WHERE customer_id = 1);



-- Удаление самого customer
--DELETE FROM CUSTOMER WHERE customer_id = 1;







