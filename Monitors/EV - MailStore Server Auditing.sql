
INSERT INTO `Agents` (`Name`,`LocID`,`ClientID`,`ComputerID`,`DriveID`,`CheckAction`,`AlertAction`,`AlertMessage`,`ContactID`,`interval`,`Where`,`What`,`DataOut`,`Comparor`,`DataIn`,`LastScan`,`LastFailed`,`FailCount`,`IDField`,`AlertStyle`,`Changed`,`Last_Date`,`Last_User`,`ReportCategory`,`TicketCategory`,`Flags`,`GUID`,`AgentDefaultGUID`,`WarningCount`,`DeviceId`) Values('EV - MailStore Server Auditing - Custom','0','0','0','1623','0','0','~~~%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %NAME% result %RESULT%.!!!~~~%NAME% %STATUS% on %CLIENTNAME%\\%COMPUTERNAME% at %LOCATIONNAME% for %NAME% result %RESULT%.','1','86400','RAWSQL','RAWSQL','SELECT DISTINCT \'C\',computers.computerid,computers.Name AS ComputerName,CONVERT(CONCAT(clients.name,\' \',locations.name) USING utf8) AS Location, eventlogs.\`EventID\` AS TestValue,eventlogs.message, COUNT(*) AS occurrences FROM ((eventlogs LEFT JOIN Computers ON Computers.ComputerID=eventlogs.ComputerID) LEFT JOIN Locations ON Locations.LocationID=Computers.Locationid) LEFT JOIN Clients ON Clients.ClientID=Computers.clientid JOIN AgentComputerData ON Computers.ComputerID=AgentComputerData.ComputerID WHERE eventlogs.\`EventID\` = 0 AND  (eventlogs.Source=\'MailStore Server Auditing\' AND eventlogs.EventType=1 AND Eventlogs.TimeGen > NOW() - INTERVAL 1 DAY)  AND Computers.ComputerID NOT IN (SELECT ComputerID FROM AgentIgnore WHERE AgentID=11761) HAVING COUNT(*) > 5\;','1','','2016/01/20 12:54:00','2015/12/23 12:54:16','0','','2','0','2016/01/20 12:55:42','root@localhost','9','0','0','7e11c884-ae66-472d-a31e-57097e0da1a6','','0','0');