CREATE VIEW top_2_hits_do_momento AS
SELECT S.SongName AS 'cancao', COUNT(*) AS 'reproducoes' 
FROM  SpotifyClone.histsongs AS H
INNER JOIN SpotifyClone.songs AS S ON S.SongID = H.SongID
GROUP BY S.SongName
ORDER BY COUNT(*) DESC, S.SongName
LIMIT 2;
