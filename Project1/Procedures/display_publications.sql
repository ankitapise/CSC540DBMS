CREATE PROCEDURE `display_publications` ()
BEGIN
	SELECT P.pub_id, P.title, P.category
    FROM Publications P;
END