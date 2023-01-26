SELECT products.* FROM pizzeria.products
WHERE
    products.`idProducts` IN 
        (SELECT `order item`.`idProduct` FROM pizzeria.`order item`)
    AND `Type`= "Drink";


 ulleres_cul_ampolla.sales WHERE CustomerID = 1;

SELECT * FROM ulleres_cul_ampolla.sales;
SELECT * FROM ulleres_cul_ampolla.sales WHERE `Sold by` = "Aethelbert";

SELECT suppliers.* FROM ulleres_cul_ampolla.suppliers
WHERE suppliers.SupplierID IN
(SELECT glasses.SupplierID FROM ulleres_cul_ampolla.glasses
WHERE glasses.GlassesID IN (SELECT sales.GlassesID FROM ulleres_cul_ampolla.sales));

Llista quants productes de tipus “Begudes”. s'han venut en una determinada localitat.
Llista quantes comandes ha efectuat un determinat empleat/da.
