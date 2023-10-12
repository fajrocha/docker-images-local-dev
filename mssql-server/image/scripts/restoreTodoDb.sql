RESTORE DATABASE TodoDo FROM DISK = "/tmp/TodoDb.bak"
WITH FILE = 1,
MOVE "TodoDb" to "/var/opt/mssql/data/TodoDb.mdf",
MOVE "TodoDb_Log" to "/var/opt/mssql/data/TodoDb_log.ldf",
NOUNLOAD, REPLACE, STATS = 5
GO