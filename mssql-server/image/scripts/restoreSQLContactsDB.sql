RESTORE DATABASE SQLContactsDB FROM DISK = "/tmp/SQLContactsDB.bak"
WITH FILE = 1,
MOVE "SQLContactsDB" to "/var/opt/mssql/data/SQLContactsDB.mdf",
MOVE "SQLContactsDB_Log" to "/var/opt/mssql/data/SQLContactsDB_log.ldf",
NOUNLOAD, REPLACE, STATS = 5
GO