CREATE PROCEDURE `camera_checkout` (
	IN cam_id varchar(25),
    IN patron_id varchar(50),
    IN out_date datetime,
    OUT checkout_status tinyint(2)
)
BEGIN
	SET @status = (
		SELECT LC.status
        FROM Library_Cameras LC
        WHERE (LC.cam_id = cam_id)
    );
    
    IF(@status = 'Checkout Out') THEN
		SET checkout_status = 0;
	ELSE
		BEGIN
			SET @queuePosition := 0;
			DROP TABLE IF EXISTS Temp;
			CREATE TABLE Temp
			SELECT C.patron_id,@queuePosition := @queuePosition + 1 AS queuePosition
			FROM Cam_waitlist C
			WHERE (C.cam_id = cam_id) AND (C.out_date = out_date)
			ORDER BY C.out_date,C.position;
			
			ALTER TABLE Temp AUTO_INCREMENT = 1;
			
			SET @queue_position = (
				SELECT T.queuePosition
				FROM Temp T
				WHERE (T.patron_id = patron_id)
			);
            
            IF(@queue_position = 1) THEN
				BEGIN
                    INSERT INTO Cam_checkout
                    VALUES (patron_id, cam_id, out_date, DATE_ADD(out_date, INTERVAL 6 DAY));
                    DELETE FROM Cam_waitlist
                    WHERE (Cam_waitlist.cam_id = cam_id) AND (Cam_waitlist.out_date = out_date);
                    SET checkout_status = 1;
				END;
            ELSE
				SET checkout_status = 2;
            END IF;
		END;
	END IF;
END