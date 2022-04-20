SELECT dp1.name AS [DatabaseRoleName],
       ISNULL(dp2.name, 'No members') AS [DatabaseUserName]
FROM sys.database_role_members AS drm
RIGHT OUTER JOIN sys.database_principals AS dp1
    ON drm.role_principal_id = dp1.principal_id
LEFT OUTER JOIN sys,database_principals AS dp2
    ON drm.member_principal_id = dp2.principal_id
WHERE dp1.type = 'R'
ORDER BY dp1.name