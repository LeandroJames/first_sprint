SELECT users.*
FROM spotify.users
WHERE users.subscription_no IN (
        SELECT
            subscriptions.`idSubscription`
        FROM spotify.subscriptions
        WHERE `payment_method` = "PayPal"
    );

SELECT songs.*
FROM spotify.songs
WHERE songs.`idSong` IN (
    SELECT favourites.`idSong`
    FROM spotify.favourites
    WHERE favourites.username IN (
        SELECT users.username
        FROM spotify.users
        WHERE users.`type` = "Free"
    )
);

SELECT artists.*
FROM spotify.artists
WHERE artists.`idArtists` IN (
    SELECT songs.`idArtist`
    FROM spotify.songs
    WHERE songs.`idSong` IN (
        SELECT playlist_contents.`idSong`
        FROM spotify.playlist_contents
    )
);