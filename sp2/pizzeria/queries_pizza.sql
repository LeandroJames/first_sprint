SELECT products.*
FROM pizzeria.products
WHERE
    products.`idProducts` IN (
        SELECT
            `order item`.`idProduct`
        FROM pizzeria.`order item`
        WHERE
            `order item`.`idOrder` IN (
                SELECT `order`.`idOrder`
                FROM pizzeria.`order`
                WHERE `order`.`idCustomer` IN (
                        SELECT
                            `customers`.`idCustomers`
                        FROM pizzeria.`customers`
                        WHERE
                            `customers`.`City` = "Barcelona"
                    )
            )
    )
    AND `Type` = "Drink";

SELECT `order`.*
FROM pizzeria.`order`
WHERE `Order`.`Delivered by`=2