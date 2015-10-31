CREATE VIEW `student_profile` AS
	SELECT P.user_id, P.password, P.first_name, P.last_name, 
		   P.nationality, P.phone_no, P.alternate_phone, P.DOB, 
           P.department, P.category, P.sex, S.degree, 
           SA.address_line1, SA.address_line2, SA.city, SA.postal_code
    FROM Patrons P INNER JOIN Students S INNER JOIN Student_Addresses SA
    WHERE (P.patron_id = S.student_id) AND (P.patron_id = SA.student_id)