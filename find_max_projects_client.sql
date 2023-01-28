--вариант 1---
SELECT client.name, count(*) as project_count
FROM project
LEFT JOIN client
ON project.client_id = client.id
GROUP BY client_id  HAVING project_count IN (
             SELECT MAX(project_count)
             FROM (SELECT client_id, COUNT(*) as project_count
	                  FROM project
                          GROUP BY client_id))

;

--вариант 2 ----
SELECT client.name, count(*) as project_count
FROM project
LEFT JOIN client
ON project.client_id = client.id
GROUP BY client_id  HAVING (project_count IN (
             SELECT count(*) as project_count
             FROM project
             GROUP BY client_id
             ORDER BY project_count DESC 
             LIMIT 1))

;