INSERT INTO spotify.card_details VALUES (1, 487863678, "2024-01-30", 666), (2, 123456789, "2025-01-01", 998);

INSERT INTO spotify.subscriptions VALUES (1, "2023-01-15", "2023-02-15", "Card", 1, NULL), (2, "2023-01-20", "2023-02-20", "PayPal", NULL, 12345678), (3, "2023-01-28", "2023-02-28", "Card", 2, NULL);

INSERT INTO spotify.past_payments VALUES (1, 1, "Card", "2022-12-15", 9.95), (2, 1, "Card", "2023-01-15", 9.95), (3, 2, "PayPal", "2023-01-20", 9.95), (4, 3, "Card", "2023-01-28", 9.95);

INSERT INTO spotify.users VALUES ("juani", "juaniperez@email.com", "1234", "1980-07-03", "F", "Spain", "22191", "Free", NULL), ("pepe", "pepevazquez@email.com", "2345", "1985-01-02", "M", "Spain", "15009", "Premium", 1), ("eritreo", "pacogarcia@email.com", "5555", "1995-05-20", "M", "Spain", "18008", "Premium", 2), ("albita", "albarodriguez@email.com", "9876", "1999-12-31", "F", "Spain", "37002", "Premium", 3), ("pierrot", "pierrelegrand@email.com", "7777", "1983-10-08", "M", "France", "31100", "Free", NULL);

INSERT INTO spotify.artists VALUES (1, "Charanga", "IMAGEN", NULL), (2, "Bananarama", "IMAGEN", NULL), (3, "Covers covers", "IMAGEN", 1);

UPDATE spotify.artists SET `related_artists`=3 WHERE idArtists =1;

INSERT INTO spotify.following VALUES (1, "pierrot", 3), (2, "pierrot", 1), (3, "pepe", 2);

INSERT INTO spotify.albums VALUES (1, "Éxitos charangueros", 1, 2011, "cover_image"), (2, "Fruity", 2, 1978, "cover_image"), (3, "Éxitos de ayer y hoy", 3, 2015, "cover_image"), (4, "Más éxitos charangueros", 1, 2018, "cover_image");

INSERT INTO spotify.songs VALUES (1, "Paquito el chocolatero", 1, 1, 170, 25), (2, "Pintxo de tortilla", 1, 1, 154, 36), (3, "Bragas amarillas", 1, 1, 123, 31), (4, "Blueberries", 2, 2, 189, 68), (5, "Plums", 2, 2, 210, 24), (6, "Peaches", 2, 2, 300, 12), (7, "Final countdown de Europe", 3, 3, 230, 98), (8, "Highway to Hell de los ACDC", 3, 3, 280, 63), (9, "A la pared my senyor", 1, 4, 134, 94), (10, "Me han dicho que te diga", 1, 4, 154, 123);

INSERT INTO spotify.favourties VALUES (1, 1, NULL, "pierrot"), (2, 9, NULL, "pierrot"), (3, 3, NULL, "pierrot"), (4, NULL, 2, "albita");

INSERT INTO spotify.playlists VALUES (1, "Pachangueo del güeno", "2023-01-16", "juani", "Active"), (2, "Cositas", "2023-01-28", "eritreo", "Inactive");

INSERT INTO spotify.playlist_contents VALUES (1, 1, 2, "juani", "2023-01-16"), (2, 1, 7, "juani", "2023-01-16"), (3, 1, 2, "juani", "2023-01-16"), (4, 1, 9, "juani", "2023-01-22"), (5, 2, 5, "eritreo", "2023-01-28");