CREATE VIEW `faculty_profile` AS
	SELECT P.user_id, P.password, P.first_name, P.last_name, 
		   P.nationality, P.department, P.category
    FROM Patrons P INNER JOIN Faculty F
    WHERE (P.patron_id = F.faculty_id)