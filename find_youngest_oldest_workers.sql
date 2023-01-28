SELECT name, birthday, 'youngest' as type 
FROM worker
WHERE birthday IN (
	SELECT  MAX(birthday) 
	FROM worker)
UNION
SELECT  name, birthday, 'oldest' 
FROM worker
WHERE birthday IN (
	SELECT  MIN(birthday) 
	FROM worker)
;