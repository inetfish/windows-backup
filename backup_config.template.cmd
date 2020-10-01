REM backup configuration file
REM Replace {} with your backup information.
REM Rename file to backup_config.cmd

set networkDrive={networkDrive}
set networkIP={networkIP}
set targetPath=%networkdrive%\{share/path}

set backupNum={numberofBackupFolders}

set logPath={logPath}

REM note root backup folder name is used in backupDstPath*
set backupName1={backupName1}
set backupSrcPath1={bakcupSrcPath1}
set backupDstPath1=%targetPath%%backupName1%

set backupName2={backupName2}
set backupSrcPath2={backupSrcPath2}
set backupDstPath2=%targetPath%%backupName2%

set backupName3={backupName3}}
set backupSrcPath3={bakcupSrcPath3}
set backupDstPath3=%targetPath%%backupName3%
