SELECT name, DATEDIFF('MONTH',start_date,finish_date) as month_count
FROM project
WHERE DATEDIFF('MONTH',start_date,finish_date) IN (
      SELECT DATEDIFF('MONTH',start_date,finish_date) as month_count 
      FROM project
      ORDER BY month_count DESC
      LIMIT 1);