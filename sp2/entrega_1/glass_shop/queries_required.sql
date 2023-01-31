SELECT * FROM ulleres_cul_ampolla.sales WHERE idCustomer = 1;

SELECT *
FROM
    ulleres_cul_ampolla.sales
WHERE `Sold by` = "Aethelbert";

SELECT suppliers.*
FROM
    ulleres_cul_ampolla.suppliers
WHERE
    suppliers.idSuppliers IN (
        SELECT
            `brand suppliers`.`idSuppliers`
        FROM
            ulleres_cul_ampolla.`brand suppliers`
        WHERE
            `brand suppliers`.Brand IN (
                SELECT
                    glasses.`Brand`
                FROM
                    ulleres_cul_ampolla.glasses
                WHERE
                    glasses.idGlasses IN (
                        SELECT
                            sales.idGlasses
                        FROM
                            ulleres_cul_ampolla.sales
                    )
            )
    );