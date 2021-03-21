DELIMITER $$

CREATE FUNCTION quantidade_musicas_no_historico(id int)
RETURNS INT READS SQL DATA
BEGIN
    DECLARE qtd_songs INT;
    SELECT COUNT(*)
    FROM SpotifyClone.histsongs
    WHERE histsongs.UserID = id INTO qtd_songs;
    RETURN qtd_songs;
END $$

DELIMITER ;
