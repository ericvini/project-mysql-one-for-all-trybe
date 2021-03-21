DELIMITER $$
CREATE TRIGGER trigger_usuario_delete
    BEFORE DELETE ON SpotifyClone.users
    FOR EACH ROW
BEGIN
    DELETE FROM SpotifyClone.followartists WHERE UserID = OLD.UserID;
    DELETE FROM SpotifyClone.histsongs WHERE UserID = OLD.UserID;
END $$
DELIMITER ;
