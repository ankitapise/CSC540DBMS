CREATE PROCEDURE `publication_requests` (
	IN patron_id varchar(50)
)
BEGIN
	SET @student = (
		SELECT S.student_id
        FROM Patrons P INNER JOIN Students S
        WHERE (P.patron_id = patron_id) AND (P.patron_id = S.student_id)
    );
    IF(@student IS NULL) THEN
		SELECT P.pub_id, P.title, P.category
        FROM Faculty F INNER JOIN Faculty_waitlist FW INNER JOIN Publications P
        WHERE (F.faculty_id = patron_id) AND (F.faculty_id = FW.faculty_id)
			  AND (FW.pub_id = P.pub_id);
	ELSE
		SELECT P.pub_id, P.title, P.category
        FROM Student S INNER JOIN Student_waitlist SW INNER JOIN Publications P
        WHERE (S.student_id = patron_id) AND (S.student_id = SW.student_id)
			  AND (SW.pub_id = P.pub_id);
	END IF;
END