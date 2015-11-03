CREATE PROCEDURE `display_reserved_cameras` (
	IN patron_id varchar(50)
)
BEGIN
	SELECT C.cam_id, C.make, C.model, C.memory_available, C.lens_config, CW.out_date, L.lib_name
    FROM Cameras C INNER JOIN Cam_waitlist CW INNER JOIN Library_Cameras LC INNER JOIN Libraries L
    WHERE (CW.patron_id = patron_id) AND (CW.cam_id = C.cam_id) AND (L.lib_id = LC.lib_id)
		  AND (LC.cam_id = C.cam_id);
END