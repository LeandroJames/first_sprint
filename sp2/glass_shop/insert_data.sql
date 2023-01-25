INSERT INTO `ulleres_cul_ampolla`.`customers` (`CustomerID`, `Full name`, `Address`, `Postcode`, `Town`, `Phone no`, `Email`, `Sign-up date`, `Referred by`)
	VALUES (1, "Juan Pérez", "C/ Mallorca 221, 3B", "08015", "Barcelona", "689487556", "juanperez@email.com", "2022-10-2", ""), (2, "Alba Álvarez", "C/ València 228, 4B", "08020", "Barcelona", "698874126", "albalvarez@email.com", "2022-08-20", ""), (3, "Paula Fernández", "C/ Còrsega 10, 4A", "08014", "Barcelona", "674411283", "paulafernandez@email.com", "2022-10-12", ""), (4, "Eusebio de la Gran", "C/ Diputació 140, Principal", "08010", "Barcelona", "931566648", "", "2023-01-09", ""), (5, "Jordi Coromines", "C/ Girona 10, 6C", "08021", "Barcelona", "689547887", "coromines_jordi@email.com", "2022-07-05", "");
SELECT * FROM ulleres_cul_ampolla.customers;

INSERT INTO `ulleres_cul_ampolla`.`suppliers`(`SupplierID`, `Supplier name`, `Address`, `Telephone no.`, `Fax`, `NIF`, `Brands supplied`)
	VALUES (1, "Gafas molongas", "C/ València 189, 6A, 08020 Barcelona", "559684268", "559684268", "PO89549516", "RayBan, Sting"), (2, "Lunettes Lunaires", "C/ de França 15, 16020 Figueres", "984775214", "984775214", "8989962224", "Police");;
SELECT * FROM ulleres_cul_ampolla.suppliers;

INSERT INTO `ulleres_cul_ampolla`.`glasses` (`GlassesID`, `Brand`, `Frame type`, `Graduation Left`, `Graduation Right`, `Frame colour`, `Glass colour`, `Price`, `SupplierID`)
VALUES ('1', 'RayBan', 'Wire', '2', '1', 'Silver', 'none', '160', '1'), ('2', 'Police', 'Rimless', '1', '1', 'Gold', 'none', '140', '1'), (3, "RayBan", "Rimless", "2", "1", "Black", "none", "150", "1"), ('4', 'Sting', 'Thick', '3', '3', 'Black', 'none', '120', '2'), ('5', 'Sting', 'Rimless', '7', '6', 'Blue', 'none', '90', '1');

SELECT * FROM ulleres_cul_ampolla.glasses;

INSERT INTO `ulleres_cul_ampolla`.`sales` (`Sale no`, `Date`, `CustomerID`, `GlassesID`, `Sold by`) VALUES
(1, "2023-01-24", "1", "1", "Aethelbert"), (2, "2022-12-27", "2", "1", "Aethelbert"), (3, "2022-12-22", "1", "1", "Aethelbert"), (4, "2023-01-24", "3", "5", "Cuthbert"), (5, "2023-01-24", "4", "2", "Cuthbert");
SELECT * FROM ulleres_cul_ampolla.sales;