CREATE DEFINER=`root`@`localhost` PROCEDURE `display_faculty_profile`(
	IN user_id varchar(20)
)
BEGIN
	SELECT *
    FROM faculty_profile
    WHERE (faculty_profile.user_id = user_id);
END