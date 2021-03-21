CREATE VIEW  perfil_artistas AS
SELECT 
    AR.ArtistName AS 'artista',
    AL.AlbumName AS 'album',
    COUNT(AL.AlbumID) AS 'seguidores'
FROM
    SpotifyClone.artists AS AR
        INNER JOIN
    SpotifyClone.albums AS AL ON AR.ArtistID = AL.ArtistID
        INNER JOIN
    SpotifyClone.followartists AS F ON AR.ArtistID = F.ArtistID
GROUP BY AL.AlbumID
ORDER BY COUNT(AL.AlbumID) DESC , AR.ArtistName , AL.AlbumName;
