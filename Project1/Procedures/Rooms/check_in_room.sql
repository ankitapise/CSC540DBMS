CREATE PROCEDURE `check_in_room` (
	IN patron_id varchar(50),
    IN lib_id smallint(6),
    IN room_no varchar(6),
    OUT checkInStatus tinyint(1)
)
BEGIN
	CALL cancel_reservations(CURDATE());
    UPDATE Room_Reservations R
    SET R.status = 'CheckedIn'
    WHERE (R.patron_id = patron_id) AND (R.lib_id = lib_id) AND (R.room_no = room_no)
		  AND (R.status = 'Reserved') AND (DATE_FORMAT(R.start_time,'%Y-%m-%d') = CURDATE())
          AND (TIMESTAMPDIFF(HOUR,R.start_time,CURRENT_TIMESTAMP) >=0)
          AND (TIMESTAMPDIFF(HOUR,R.start_time,CURRENT_TIMESTAMP) <1);
	SET checkInStatus = ROW_COUNT();
END