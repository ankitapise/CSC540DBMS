CREATE PROCEDURE `display_checked_out_room` (
	IN patron_id varchar(50)
)
BEGIN
	SELECT L.lib_name, R.room_no, R.start_time, R.end_time
    FROM Room_Reservations R INNER JOIN Libraries L
    WHERE (R.patron_id = patron_id) AND (R.status = 'CheckedIn') AND (R.lib_id = L.lib_id);
END