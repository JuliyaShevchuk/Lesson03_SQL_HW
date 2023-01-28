SELECT project.name,SUM(DATEDIFF('MONTH',start_date,finish_date)*salary) as suma   
FROM project_worker
LEFT JOIN worker
ON project_worker.worker_id=worker.id 
LEFT JOIN project
ON project_worker.project_id = project.id
GROUP BY project_id
ORDER BY suma DESC
;