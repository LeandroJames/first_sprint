SELECT * FROM ulleres_cul_ampolla.sales WHERE CustomerID = 1;

SELECT * FROM ulleres_cul_ampolla.sales;
SELECT * FROM ulleres_cul_ampolla.sales WHERE sold_by = "Aethelbert";

SELECT suppliers.* FROM ulleres_cul_ampolla.suppliers
WHERE suppliers.idSuppliers IN
(SELECT glasses.Supplier_ID FROM ulleres_cul_ampolla.glasses
WHERE glasses.idGlasses IN (SELECT sales.idGlasses FROM ulleres_cul_ampolla.sales));
