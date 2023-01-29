SELECT videos.*
FROM youtube.videos
WHERE videos.`idVideo` IN (
        SELECT
            likes.`idVideo`
        FROM youtube.`likes`
        WHERE `liked` = "Yes"
    );

SELECT COUNT (idplaylist)
FROM
    youtube.playlist_contents
WHERE `idPlaylist` = 1;

SELECT videos.*
FROM youtube.videos
WHERE videos.`idVideo` IN (
        SELECT tags.`idVideo`
        FROM youtube.tags
        WHERE
            tag_name = "mascarillas"
    )