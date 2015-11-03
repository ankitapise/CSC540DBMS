CREATE PROCEDURE `display_rooms` (
	IN patron_id varchar(50),
    IN occupancy smallint(6),
    IN type enum('Conference','Study'),
    IN startTime datetime,
    IN endTime datetime,
    OUT display_status tinyint(1)
)
BEGIN
	SET @student = (
		SELECT S.student_id
        FROM Patrons P INNER JOIN Students S
        WHERE (P.patron_id = patron_id) AND (S.student_id = P.patron_id)
    );
    
    IF((@student IS NOT NULL) AND (type = 'Conference')) THEN
		SET display_status = 0;
	ELSE
		BEGIN
			CALL cancel_reservations(CURDATE());
            SELECT LR.lib_id, LR.room_no, LR.position_floor
            FROM Library_Rooms LR
            WHERE (LR.capacity = occupancy) AND (LR.type = type)
				  AND LR.room_no NOT IN(
					SELECT RR.room_no
                    FROM Room_Reservations RR
                    WHERE (LR.room_no = RR.room_no) AND (LR.lib_id = RR.lib_id)
                    AND (startTime BETWEEN RR.start_time AND RR.end_time)
                    AND (endTime BETWEEN RR.start_time AND RR.end_time)
                    AND (RR.status NOT LIKE '%Nulled%') 
                    AND (DATE_FORMAT(RR.start_time,'%Y-%m-%d') = DATE_FORMAT(startTime,'%Y-%m-%d'))
                  );
        END;
	END IF;
END