CREATE DEFINER=`root`@`localhost` PROCEDURE `login_student`(
    IN user_id varchar(20),
    IN password varchar(20)
)
BEGIN
	SELECT P.patron_id, P.user_id, P.password
	FROM Patrons P, Students S
	WHERE (P.user_id = user_id) AND (P.password = password) AND (P.patron_id = S.student_id);
END