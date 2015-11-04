CREATE PROCEDURE `reserve_room` (
	IN patron_id varchar(50),
    IN lib_id smallint(6),
    IN room_no varchar(6),
    IN startTime datetime,
    IN endTime datetime,
    OUT reservation_status tinyint(1)
)
BEGIN
	INSERT INTO Room_Reservations
    VALUES (patron_id,lib_id, room_no, startTime, endTime, 'Reserved');
END