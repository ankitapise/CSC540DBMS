CREATE PROCEDURE `display_publications` ()
BEGIN
	SELECT P.pub_id, P.title, P.category,
		   IF(P.e_copy = 1, 'Yes', 'No') AS e_copy
    FROM Publications P;
END