CREATE PROCEDURE `display_cameras` ()
BEGIN
	SELECT C.cam_id, C.make, C.model
    FROM Cameras C; 
END