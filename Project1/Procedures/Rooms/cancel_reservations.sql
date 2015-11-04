CREATE PROCEDURE `cancel_reservations`(
	IN inputDate date
)

BEGIN
	DROP TABLE IF EXISTS Temp;
    CREATE TABLE Temp
    SELECT lib_id,room_no FROM Room_Reservations R2
	WHERE DATE_FORMAT(R2.start_time,'%Y-%m-%d') <= inputDate AND R2.status = 'Reserved'
    AND TIMESTAMPDIFF(HOUR,R2.start_time,CURRENT_TIMESTAMP) > 1;
	
    SET SQL_SAFE_UPDATES = 0;
	UPDATE Room_Reservations R
	JOIN Temp T
    ON R.lib_id = T.lib_id AND R.room_no = T.room_no
	SET R.status = "Nulled";
	SET SQL_SAFE_UPDATES = 1;
END