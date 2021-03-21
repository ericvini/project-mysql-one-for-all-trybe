CREATE VIEW historico_reproducao_usuarios AS
    SELECT 
        U.UserName AS 'usuario', S.SongName AS 'nome'
    FROM
        histsongs AS H
            INNER JOIN
        SpotifyClone.songs AS S ON S.SongID = H.SongID 
            INNER JOIN
        SpotifyClone.users AS U ON U.UserID = H.UserID
    ORDER BY U.UserName , S.SongName;
