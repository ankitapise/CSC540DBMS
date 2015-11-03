CREATE PROCEDURE `display_selected_checked_out_camera` (
	IN cam_id varchar(25),
    IN patron_id varchar(50)
)
BEGIN
	SELECT C.cam_id, C.make, C.model, C.memory_available, C.lens_config,
		   CC.out_date, CC.due_date
    FROM Cameras C INNER JOIN Cam_checkout CC
    WHERE (C.cam_id = cam_id) AND (CC.cam_id = C.cam_id) AND (CC.patron_id = patron_id);
END