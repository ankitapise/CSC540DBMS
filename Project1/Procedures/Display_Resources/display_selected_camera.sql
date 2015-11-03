CREATE PROCEDURE `display_selected_camera` (
	IN cam_id varchar(25)
)
BEGIN
	SELECT C.cam_id, C.make, C.model, C.memory_available, C.lens_config, L.lib_name
    FROM Cameras C INNER JOIN Libraries L INNER JOIN Library_Cameras LC
    WHERE (C.cam_id = cam_id) AND (C.cam_id = LC.cam_id) AND (LC.lib_id = L.lib_id);
END