Primero se ha de crear la base de datos ejecutando create_spotify.sql con el siguiente comando:
`$ mysql -u root -p < create_spotify.sql`

A continuación hay que llenar la base de datos. Para ello, se puede ejecutar el siguiente comando:

`$ mysql -u root -p < insert_data.sql`

Finalmente, hay un archivo con queries (spotify_queries.sql) que se puede ejecutar para comprobar su correcto funcionamiento. La primera query devolverá todos los usuarios que han pagado con PayPal. La segunda, las canciones favoritas de los usuarios que no pagan por el servicio. La última, los artistas cuyas canciones han sido incluidas en playlists.