SELECT * FROM ulleres_cul_ampolla.sales WHERE CustomerID = 1;

SELECT * FROM ulleres_cul_ampolla.sales;
SELECT * FROM ulleres_cul_ampolla.sales WHERE `Sold by` = "Aethelbert";

SELECT suppliers.* FROM ulleres_cul_ampolla.suppliers
WHERE suppliers.SupplierID IN
(SELECT glasses.SupplierID FROM ulleres_cul_ampolla.glasses
WHERE glasses.GlassesID IN (SELECT sales.GlassesID FROM ulleres_cul_ampolla.sales));
