CREATE PROCEDURE `camera_requests` (
	IN patron_id varchar(50)
)
BEGIN
	SELECT C.cam_id, C.make, C.model, C.memory_available, C.lens_config
    FROM Cameras C INNER JOIN Cam_waitlist CW
    WHERE (CW.patron_id = patron_id) AND (CW.cam_id = C.cam_id);
END
