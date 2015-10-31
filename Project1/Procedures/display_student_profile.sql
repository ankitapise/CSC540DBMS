CREATE DEFINER=`root`@`localhost` PROCEDURE `display_student_profile`(
	IN user_id varchar(20)
)
BEGIN
	SELECT *
    FROM student_profile
    WHERE (student_profile.user_id = user_id);
END