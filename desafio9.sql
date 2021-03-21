DELIMITER $$

CREATE PROCEDURE albuns_do_artista(IN name VARCHAR(100))
BEGIN
    SELECT ArtistName AS 'artista', AlbumName AS 'album'
    FROM SpotifyClone.artists AS AR
    INNER JOIN SpotifyClone.albums AS AL ON AR.ArtistID = AL.ArtistID
    WHERE ArtistName = name
    ORDER BY  AlbumName;
    
END $$

DELIMITER ;
