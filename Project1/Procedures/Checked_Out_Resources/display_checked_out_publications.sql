CREATE PROCEDURE `display_checked_out_publications` (
	IN patron_id varchar(50)
)
BEGIN
	SELECT P.pub_id, P.title, P.category
    FROM Publications P INNER JOIN Pub_checkout PC
    WHERE (P.pub_id = PC.pub_id) AND (PC.patron_id = patron_id);
END