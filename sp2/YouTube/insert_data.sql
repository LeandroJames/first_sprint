INSERT INTO youtube.users VALUES ("queen_elisabeth","dieu_et_mon_droit", "ellie@buckingham.co.uk", "1926-04-21", "F", "United Kingdom", "SW1A 1AA"), ("coletas_pablo", "PODEMOS", "piglesiasturrion@universidad.es", "1978-10-17", "M", "Spain", "28031"), ("aYusItaMaddrizz", "pecas_el_perro", "isabelayuso@comunidaddemadrid.es", "1978-10-17", "F", "Spain", "28001"), ("pamangoelmio", "motosmotos", "isacifu@email.es", "1964-07-01", "F", "Spain", "28001");

SELECT * FROM youtube.users;

INSERT INTO youtube.videos VALUES (1, "Yo de pinchos en pandemia", "Madrid siempre contra el comunismo", 15687, "bar_manolo", 165, 2, "Public", "aYusItaMaddrizz", "2020-05-22"), (2, "Yo y mis cremitas pal pelo", "Este supermercado es baratísimo", 190007, "no_publicar_peligro", 244, 7890, "Hidden", "pamangoelmio", "2020-05-22"), (3, "Dialéctica Kantiana de la coleta", "Exposición eterna sobre por qué me necesitáis, nunca me equivoqué y me rogaréis que vuelva cuando os deis cuenta de vuestro error", 8954878, "horatoria", 370, 0, "Public", "coletas_pablo", "2022-01-26"), (4, "España es Madrid", "Ya lo sabías. Y muerte al comunismo", 1489, "ole_y_ole", 199, 320, "Public", "aYusItaMaddrizz", "2021-03-15"), (5, "Mascarillas para todos", "No es corrupción porque las comprara mi hermano, ¡malpensados!", 630, "buena_tajada", 263, 890, "Public", "aYusItaMaddrizz", "2022-08-09");

SELECT * FROM youtube.videos;

INSERT INTO youtube.channels VALUES (1, "Dead but not gone", "Royal news from beyond the grave", "2022-09-08", "queen_elisabeth"), (2, "ElTornillo", "Entrevistas con agenda", "2008-07-05", "coletas_pablo");

SELECT * FROM youtube.channels;

INSERT INTO youtube.`channel_contents` VALUES (1, 2, 3);

SELECT * FROM youtube.`channel_contents`;

INSERT INTO youtube.subscriptions VALUES (1, "aYusItaMaddrizz", 1), (2, "aYusItaMaddrizz", 1), (3, "coletas_pablo", 1), (4, "pamangoelmio", 1);

SELECT * FROM youtube.subscriptions;

INSERT INTO youtube.comments VALUES (1, 5, "¡Ladrona!", "2022-08-09", "coletas_pablo"), (2, 3, "Rojo flipao", "2022-08-09", "aYusItaMaddrizz");

SELECT * FROM youtube.`channel contents`;

INSERT INTO youtube.likes VALUES (1, "pamangoelmio", 1, null, "Yes", "No", "2020-05-22"), (2, "aYusItaMaddrizz", 3, null, "No", "Yes", "2022-01-26"), (3, "pamangoelmio", null, 1, "No", "Yes", "2022-08-09"), (4, "pamangoelmio", null, 2, "Yes", "No", "2022-08-09");

SELECT * FROM youtube.likes;

INSERT INTO youtube.tags VALUES (1, "canyas", 1), (2, "mascarillas", 2), (3, "madrid", 1), (4, "pelo", 3), (5, "mascarillas", 5), (6, "pelo", 2);

SELECT * FROM youtube.tags;

INSERT INTO youtube.playlists VALUES (1, "random_stuff", "2023-01-25", "Private", "queen_elisabeth"), (2, "cosas", "2023-01-27", "Public", "pamangoelmio");

SELECT * FROM youtube.playlists;

INSERT INTO youtube.playlist_contents VALUES (1, 1, 1), (2,2,1), (3, 1, 2), (4, 1, 4), (5, 1, 5), (6, 2, 5);

SELECT * FROM youtube.playlist_contents;