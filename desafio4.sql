CREATE VIEW  top_3_artistas AS
SELECT A.ArtistName AS 'artista', COUNT(*) AS 'seguidores' 
FROM  followartists AS F
INNER JOIN SpotifyClone.artists AS A ON A.ArtistID = F.ArtistID
GROUP BY A.ArtistName
ORDER BY COUNT(*) DESC, A.ArtistName
LIMIT 3;
