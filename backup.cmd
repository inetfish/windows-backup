echo off

call ./backup_config.cmd

echo Setting the Date for the log
set CURRENT_DATE=%date:~10,4%%date:~4,2%%date:~7,2%
echo %CURRENT_DATE%


echo **** backup task starting up... >> %logpath%backup-script-%CURRENT_DATE%.log
date /t >> %logpath%backup-script-%CURRENT_DATE%.log
time /t >> %logpath%backup-script-%CURRENT_DATE%.log


REM Map a netowrk drive.
REM Requirement: network share is available
echo Mapping a network drive to the backup share... >>  %logpath%backup-script-%CURRENT_DATE%.log
net use %networkDrive% \\%networkIP%\share

REM Mirror the data to backups share
echo Mirroring data to backup share
echo Backup started for %backupName1% and creating log file backup-%backupName1%-%CURRENT_DATE%.log
robocopy %backupSrcPath1% %backupDstPath1% /MIR /W:3 /R:5 /copy:D /dcopy:D /Log+:%logpath%backup-%backupName1%-%CURRENT_DATE%.log /XA:HS /MT:8


echo Backup started for %backupName2% and creating log file backup-%backupName2%-%CURRENT_DATE%.log
robocopy %backupSrcPath2% %backupDstPath2% /MIR /W:3 /R:5 /copy:D /dcopy:D /Log+:%logpath%backup-%backupName2%-%CURRENT_DATE%.log /XA:HS /MT:8


echo Backup started for %backupName3% and creating log file backup-%backupName3%-%CURRENT_DATE%.log
robocopy %backupSrcPath3% %backupDstPath3% /MIR /W:3 /R:5 /copy:D /dcopy:D /Log+:%logpath%backup-%backupName3%-%CURRENT_DATE%.log /XA:HS /MT:8

echo Mirroring Complete.

echo Removing w: drive.
net use %networkDrive% /d /y

echo Removing network drive >> %logpath%backup-script-%CURRENT_DATE%.log
date /t >> %logpath%backup-script-%CURRENT_DATE%.log
time /t >> %logpath%backup-script-%CURRENT_DATE%.log
echo **** backup task completed >> %logpath%backup-script-%CURRENT_DATE%.log
