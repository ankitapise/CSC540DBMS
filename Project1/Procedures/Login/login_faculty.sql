CREATE DEFINER=`root`@`localhost` PROCEDURE `login_faculty`(
    IN user_id varchar(20),
    IN password varchar(20)
)
BEGIN
	SELECT P.user_id, P.password
	FROM Patrons P, Faculty F
	WHERE (P.user_id = user_id) AND (P.password = password) AND (P.patron_id = F.faculty_id);
END