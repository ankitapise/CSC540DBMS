CREATE PROCEDURE `display_checked_out_cameras` (
	IN patron_id varchar(50)
)
BEGIN
	SELECT C.cam_id, C.make, C.model
    FROM Cameras C INNER JOIN Cam_checkout CC
    WHERE (CC.cam_id = C.cam_id) AND (CC.patron_id = patron_id);
END