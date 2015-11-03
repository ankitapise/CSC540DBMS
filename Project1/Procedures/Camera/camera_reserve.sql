CREATE PROCEDURE `camera_reserve` (
	IN cam_id varchar(25),
    IN patron_id varchar(50),
    IN out_date datetime,
    OUT queue_position smallint
)
BEGIN
	INSERT INTO Cam_waitlist (cam_id, patron_id, out_date)
    VALUES (cam_id, patron_id, out_date);
    
    SET @queuePosition := 0;
    DROP TABLE IF EXISTS Temp;
    CREATE TABLE Temp
    SELECT C.patron_id,@queuePosition := @queuePosition + 1 AS queuePosition
	FROM Cam_waitlist C
	WHERE C.cam_id = cam_id
    ORDER BY C.position;
    
    ALTER TABLE Temp AUTO_INCREMENT = 1;
    
    SET queue_position = (
		SELECT T.queuePosition
		FROM Temp T
		WHERE (T.patron_id = patron_id)
	);
END