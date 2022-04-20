SELECT command,
       db.name,
       start_time,
       percent_complete,
       (estimated_completion_time/1000)/60 AS estimated_completion_time
FROM sys.dm_exec_requests r
INNER JOIN sys.sysdatabases AS db ON db.dbid = database_id
WHERE command LIKE '%backup%'